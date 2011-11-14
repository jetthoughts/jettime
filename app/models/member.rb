class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :project
  
  delegate :full_name, :to => :user

  validates_uniqueness_of :user_id, :scope => :project_id
  validates :user_id, :project_id, :presence => true
end
