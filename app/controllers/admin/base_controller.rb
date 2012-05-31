class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :require_admin!
  before_filter :authenticate_user!

  protected
  def require_admin!
    redirect_to root_url(subdomain: Rails.application.config.site_subdomain) unless current_user.admin?
  end
end