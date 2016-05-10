class My::AccountsController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
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
