class LikesController < ApplicationController
  def index
    @user = current_user
    @tweet_likes_id = Like.where(user_id: @user.id).order('created_at DESC').collect { |like| like.tweet_id }
    @tweets_liked = Tweet.all.where(id: @tweet_likes_id)

  end

end