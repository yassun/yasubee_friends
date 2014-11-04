class Tweet < ActiveRecord::Base

  def self.get_last_tweet_id
    id = self.maximum(:id)
    return 0 unless id
    self.find(id).tweets_id
  end

  def self.page_created_desc(page)
    self.page(page).per(15).order("created_at DESC")
  end

end

