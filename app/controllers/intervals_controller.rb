class IntervalsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @interval = Interval.new(params[:interval])
    @interval.user = current_user
    create!
  end

  private

  def collection
    @intervals ||= (end_of_association_chain === Interval ? end_of_association_chain.by_user(current_user.id) : end_of_association_chain)
  end
end
