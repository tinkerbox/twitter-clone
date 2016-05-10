class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end
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

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = 'Profile updated!'
			redirect_to edit_my_account_path
		else
			flash[:error] = 'Your changes were unsaved'
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :birthdate, :description, :location, :avatar)
	end
end