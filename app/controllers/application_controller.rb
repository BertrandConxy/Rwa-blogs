class ApplicationController < ActionController::Base
  def current_user
    @user = User.first
  end
  helper_method :current_user
end
