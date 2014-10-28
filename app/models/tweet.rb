class Tweet < ActiveRecord::Base

  def self.get_last_tweet_id
    id = self.maximum(:id)
    return 0 unless id
    self.find(id).tweets_id
  end

end

