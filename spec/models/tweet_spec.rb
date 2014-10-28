require 'rails_helper'

RSpec.describe Tweet, :type => :model do

  describe "最大IDのTwitterIDを取得する" do

    context "レコードが存在しない場合" do
      it "0を返すこと" do
        expect(Tweet.get_last_tweet_id).to eq 0
      end
    end

    context "レコードが存在する場合" do
      Tweet.create(
                    :twitter_id  => "1",
                    :screen_name => "screen_name",
                    :tweets_id   => "100",
                    :img_url     => "xxx/xxx/img_url.jpg",
                    :text        => "example")
      tweet = Tweet.create(
                    :twitter_id  => "1",
                    :screen_name => "screen_name",
                    :tweets_id   => "999",
                    :img_url     => "xxx/xxx/img_url.jpg",
                    :text        => "example")

      it "TwitterIDを返すこと" do
        expect(Tweet.get_last_tweet_id).to eq tweet.tweets_id
      end

    end

  end
end
