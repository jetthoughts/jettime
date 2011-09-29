class Account::BaseController < ApplicationController
  layout 'account'
  before_filter :authenticate_user!

  def current_company
    @current_company ||= Company.where(:subdomain => request.subdomain).first
  end
end
