class TweetsController < ApplicationController
  def index
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end
