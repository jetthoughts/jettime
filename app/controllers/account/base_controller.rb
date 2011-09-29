class Account::BaseController < ApplicationController
  before_filter :authenticate_user!
end
