require 'rails_helper'

RSpec.describe Tweet, :type => :model do

  it "有効なファクトリを持つこと" do
    expect(FactoryGirl.build(:tweet)).to be_valid
  end

  describe "最大IDのTwitterIDを取得する" do

    context "レコードが存在しない場合" do
      it "0を返すこと" do
        expect(Tweet.get_last_tweet_id).to eq 0
      end
    end

    context "レコードが存在する場合" do

      it "TwitterIDを返すこと" do
        FactoryGirl.create(:tweet, tweets_id: "100")
        tweet = FactoryGirl.create(:tweet, tweets_id: "999")
        expect(Tweet.get_last_tweet_id).to eq tweet.tweets_id
      end

    end
  end

end
