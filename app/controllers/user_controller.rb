class UserController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome!'
      redirect_to new_user_path
    else
    	flash[:error] = 'Your registration was unsuccessful!'
      render 'new'
    end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :birthdate, {avatars: []})
	end
end