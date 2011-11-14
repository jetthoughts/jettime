class Timesheet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :hours, :type => Float
  field :date, :type => Date
  field :notes, :type => String

  belongs_to :project, :inverse_of => :timesheets
  belongs_to :task, :inverse_of => :timesheets
  belongs_to :user, :inverse_of => :timesheets

  validates :user_id, :project_id, :presence => true
end
