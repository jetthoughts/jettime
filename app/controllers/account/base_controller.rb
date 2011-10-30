class Account::BaseController < ApplicationController
  layout 'account'
  before_filter :require_company!
  before_filter :authenticate_user!

  protected
  def require_company!
    redirect_to root_url(:subdomain => Rails.application.config.site_subdomain) if current_company.nil?
  end

  def current_company
    @current_company ||= Company.where(:subdomain => request.subdomain).first
  end
end
