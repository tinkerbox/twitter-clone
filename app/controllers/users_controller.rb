class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@tweets = @user.tweets.all.order('created_at DESC').paginate(page: params[:page], per_page: 20)
    
		if current_user
			@me = current_user
		end
	end

end