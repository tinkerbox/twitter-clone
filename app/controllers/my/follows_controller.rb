class My::FollowsController < ApplicationController
	def create
		@user = current_user.id
		@other_user = params[:format]
		if Follow.create(follower_id: @user, followee_id: @other_user)
			flash[:success] = "You've successfully followed this user"
			redirect_to user_path(params[:format])
		end
	end

	def destroy
	end

end