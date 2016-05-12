class My::LikesController < My::BaseController

  def create
    @like = current_user.likes.create(user_id: current_user.id, tweet_id: params[:tweet_id])

  end

  def destroy
    Like.where(user_id: current_user.id, tweet_id: params[:tweet_id]).destroy_all
  end

end