class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  has_many :projects

  field :admin, :type => Boolean, :default => false

  field :first_name
  field :last_name

  before_create :reset_authentication_token


  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end

end
