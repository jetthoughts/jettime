class Account::BaseController < ApplicationController
  layout 'account'
  before_filter :authenticate_user!
end
