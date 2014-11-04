require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TweetsHelper. For example:
#
# describe TweetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe TweetsHelper, :type => :helper do
  describe "tweet_url" do
    it "tweetへのURLが作成される事" do
      expect(helper.tweet_url(FactoryGirl.build(:tweet, screen_name:"screen_name", tweets_id: "100"))).to eq "https://twitter.com/screen_name/status/100"
    end
  end
end

