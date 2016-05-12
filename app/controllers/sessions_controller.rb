class SessionsController < ApplicationController
	def new
    if current_user.present?
      redirect_to my_home_path
    end
	end

	def create
		if login(params[:email], params[:password])
      flash[:success] = 'Welcome back!'
      redirect_to my_home_path
    else
      flash.now[:warning] = 'E-mail and/or password is incorrect.'
      render 'new'
    end
	end

	def destroy
		logout
    flash[:success] = 'See you!'
    redirect_to log_in_path
	end
end