class My::BaseController < ApplicationController
  before_action :logged_in

  private
  def logged_in
    if !current_user.present?
      flash[:error] = 'You need to be logged in to view this page.'
      redirect_to log_in_path
    end
  end
end