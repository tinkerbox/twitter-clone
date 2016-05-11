class My::HomesController < My::BaseController
	def show
    @user = current_user
    @followed_users = current_user.followees
		@tweets = Tweet.all.where(user_id: @followed_users.ids).order('created_at DESC').paginate(page: params[:page], per_page: 20)
	end
end