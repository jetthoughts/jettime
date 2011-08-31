class Interval
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :date, :type => Date
  field :start_time, :type => Time
  field :finish_time, :type => Time
  field :message, :type => String

  belongs_to :project
  belongs_to :user

  validates :message, :presence => true
  validates :date, :presence => true
  validates :start_time, :presence => true
  validates :finish_time, :presence => true

  validate :time_valid?

  scope :by_user, lambda {|uid| where(:user_id => uid)}

  def time_valid?
    if (finish_time && start_time && finish_time <= start_time)
      errors.add("finish_time", "Finish must be after start")
    end
  end

  def delta
    finish_time - start_time
  end

end
