class Project
  include Mongoid::Document
  field :name, :type => String
  field :decription, :type => String

  has_many :projects

end
