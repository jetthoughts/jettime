class Timesheet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :hours, :type => Float
  field :date, :type => Date
  field :notes, :type => String

  belongs_to :project, :inverse_of => :timesheets
  belongs_to :task, :inverse_of => :timesheets
  belongs_to :user, :inverse_of => :timesheets

  validates :user_id, :project_id, :hours, :notes, :date, :presence => true
  
  def date=(value)
    _date = Date.parse(value) rescue Date.strptime(value, '%m/%d/%Y') rescue value.to_date
    write_attribute(:date, _date)
  end
  
  def hours=(h)
    write_attribute :hours, (h.is_a?(String) ? h.to_hours : h)
  end
end
