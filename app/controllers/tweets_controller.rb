class TweetsController < ApplicationController
  def index
    @tweets = Tweet.page_created_desc(params[:page])
  end
end
