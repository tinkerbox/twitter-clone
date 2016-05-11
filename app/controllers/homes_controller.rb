class HomesController < ApplicationController
	def show
		@user = current_user
		@followees = current_user.followees
		@tweets = Tweet.all.where(user_id: @followees.ids).order('created_at DESC').paginate(page: params[:page], per_page: 20)
	end
end