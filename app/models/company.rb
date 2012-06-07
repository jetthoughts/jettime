class Company
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subdomain, :type => String
  field :custom_domain, :type => String
  field :name, :type => String

  validates :name, :subdomain, presence: true
  validates :subdomain, uniqueness: true

  has_many :users
  has_many :projects

  belongs_to :owner, class_name: "User"

  index({subdomain: 1}, {unique: true})
  index({name: 1}, {unique: true})

  def domain
    subdomain + "." + Rails.application.config.domain
  end
end
