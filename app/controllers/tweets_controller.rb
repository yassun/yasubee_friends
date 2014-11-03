class TweetsController < ApplicationController
  def index
    @tweets = Tweet.page(params[:page]).per(15).order("created_at DESC")
  end
end
