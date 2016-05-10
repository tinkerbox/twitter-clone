class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    
  end

  def create
    # @tweet = Tweet.new(tweet_params)
    # @user = User.find(current_user)
    @tweet = current_user.tweets.create(tweet_params)

    # @tweet.save
    redirect_to @tweet
  end

  private
    def tweet_params
      params.require(:tweet).permit(:text)
    end
end
