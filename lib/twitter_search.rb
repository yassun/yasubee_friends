require 'twitter'
module TwitterSearch
 extend self

  def execute

    puts "TwitterSearch execute start"

    client   = get_tw_client
    since_id = Tweet.get_last_tweet_id

    results = client.search(
      "#yasubeefriends exclude:retweets",
      include_entities: true,
      :count => 100,
      :result_type => "recent",
      :since_id => since_id,)

    results.attrs[:statuses].reverse.each do |tweet|

      img_url = tweet[:entities][:media][0][:media_url] rescue nil
      next unless img_url

      tweet = Tweet.create(
                    :twitter_id  => tweet[:user][:id],
                    :screen_name => tweet[:user][:screen_name],
                    :tweets_id   => tweet[:id],
                    :img_url     => img_url,
                    :text        => tweet[:text])

      p tweet.to_yaml

    end

    puts "TwitterSearch execute end"

  end

  def get_tw_client
    Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["TW_CONSUMER_KEY"]
          config.consumer_secret     = ENV["TW_CONSUMER_SECRET"]
          config.access_token        = ENV["TW_ACCESS_TOKEN"]
          config.access_token_secret = ENV["TW_ACCESS_SECRET"]
    end
  end

end

