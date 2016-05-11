class My::TweetsController < ApplicationController
  def new
    
  end

  def create
    @tweet = current_user.tweets.create(tweet_params)

    redirect_to @tweet
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    redirect_to new_my_tweet_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
