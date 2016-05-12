class TweetsController < ApplicationController
  def index
    @tweet = Tweet.find(params[:user_id])
  end

  def show
    @tweet = Tweet.find(params[:id])

    @people_liked_id = Like.where(tweet_id: params[:id]).order('created_at DESC').collect { |like| like.user_id }
    @people_liked = User.all.where(id: @people_liked_id)
  end
end
