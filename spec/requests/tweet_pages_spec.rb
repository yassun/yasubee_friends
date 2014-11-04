require 'rails_helper'

RSpec.describe "TweetPages", :type => :request do

  subject { page }

  describe "index" do
    before do
       @tweet = FactoryGirl.create(:tweet)
       visit root_path
    end

    it { should have_title('#YasubeeFriends') }
    it { should have_content('#YasubeeFriends') }

    describe "tweetが表示されている事" do
      it { should have_content(@tweet.screen_name) }
      it { should have_selector("img[src$='#{@tweet.img_url}']")}
      it { should have_content(@tweet.text) }
    end

    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:tweet) } }
      it { should have_selector('ul.pagination') }

      it "tweetの一覧が表示されている事" do
        Tweet.page_created_desc(1).each do |tweet|
            should have_selector('span', text: tweet.screen_name)
            should have_selector('p', text: tweet.text)
        end
      end
    end

  end
end

