class AdminController < ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
    redirect_to new_admin_session_path unless current_admin?
  end

  def current_admin?
    return if current_admin.present?
  end
end
