class My::TweetsController < My::BaseController
  def new
    
  end

  def create
    @tweet = current_user.tweets.create(tweet_params)

    if @tweet.persisted?
      flash[:success] = 'Your Tweet was posted!'
      redirect_to current_user
    else
      flash[:warning] = 'Please type a message to tweet!'
      render 'new'
    end
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