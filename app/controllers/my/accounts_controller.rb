class My::AccountsController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:success] = 'Profile updated!'
      redirect_to current_user
    else
      flash[:error] = 'Your changes were unsaved'
      render 'edit'
    end
  end

  def destroy
    @user = current_user
    logout
    @user.destroy
    redirect_to log_in_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :birthdate, :description, :location, :avatar)
  end

end
