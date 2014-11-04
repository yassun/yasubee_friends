require 'rails_helper'

RSpec.describe TweetsController, :type => :controller do
  describe 'GET #index' do

    it "@tweetsが登録日の降順で並んでいること" do
      tw1 = FactoryGirl.create(:tweet, screen_name: 'tw1')
      tw2 = FactoryGirl.create(:tweet, screen_name: 'tw2')
      get :index
      expect(assigns(:tweets)).to eq [tw2, tw1]
    end

  end
end
