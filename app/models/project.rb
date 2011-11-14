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
  
  def user_ids=(val)
    new_user_ids = User.find(val).map(&:id)
    self.members.not_in(user_id: new_user_ids).delete_all
    new_user_ids.map{|uid| Member.create(:user_id => uid, :project_id => self.id) }
  end

end
