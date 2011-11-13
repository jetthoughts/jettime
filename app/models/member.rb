class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :user_id, :scope => :project_id
  validates :user_id, :project_id, :presence => true
end
