class HomesController < ApplicationController
	def show
		@followees = current_user.followees
		@tweets = Tweet.all.where(user_id: @followees.ids).order('created_at DESC')
	end
end