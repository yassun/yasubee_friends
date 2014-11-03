module TweetsHelper

  def tweet_url(tweet)
    "https://twitter.com/"+tweet.screen_name+"/status/"+tweet.tweets_id
  end

end
