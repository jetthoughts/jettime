class Company
  include Mongoid::Document

  field :subdomain, :type => String
  field :custom_domain, :type => String
  field :name, :type => String

  validates_presence_of :name
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain

  has_many :users
  belongs_to :owner, :class_name => "User"

end
