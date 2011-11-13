class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :description, :type => String

  belongs_to :company
  has_many :members

  def users
    User.find(user_ids)
  end

  def user_ids
    members.map(&:user_id)
  end

end
