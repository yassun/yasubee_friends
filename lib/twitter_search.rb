require 'twitter'
module TwitterSearch
 extend self

  def execute

    client   = get_tw_client
    since_id = get_last_since_id

    results = client.search(
      "やすべえ exclude:retweets",
      include_entities: true,
      :lang => "ja",
      :count => 20,
      :result_type => "recent",
      :since_id => since_id,)

    results.attrs[:statuses].reverse.each do |tweet|

      img_url = tweet[:entities][:media][0][:media_url] rescue nil
      next unless img_url

      Tweet.create(
                    :twitter_id  => tweet[:user][:id],
                    :screen_name => tweet[:user][:screen_name],
                    :tweets_id   => tweet[:id],
                    :img_url     => img_url,
                    :text        => tweet[:text])
    end


  end

  def get_tw_client
    Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["TW_CONSUMER_KEY"]
          config.consumer_secret     = ENV["TW_CONSUMER_SECRET"]
          config.access_token        = ENV["TW_ACCESS_TOKEN"]
          config.access_token_secret = ENV["TW_ACCESS_SECRET"]
    end
  end

  def get_last_since_id
    id = Tweet.maximum(:id)
    return 0 unless id
    Tweet.find(id).tweets_id
  end

end

