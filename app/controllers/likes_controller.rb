class LikesController < ApplicationController
  def index
    @tweet_likes_id = Like.where(user_id: params[:user_id]).order('created_at DESC').collect { |like| like.tweet_id }
    @tweets_liked = Tweet.all.where(id: @tweet_likes_id)
    @users_of_tweets_liked = User.all.where(id: @tweets_liked.collect { |tweet| tweet.user_id } )
    @user = User.find(params[:user_id])
  end

end