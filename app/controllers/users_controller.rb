class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		if current_user
			@me = current_user
		end
	end

end