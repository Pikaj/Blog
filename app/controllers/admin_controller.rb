class AdminController < ApplicationController
  before_filter :check_admin

  private
  def check_admin
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
