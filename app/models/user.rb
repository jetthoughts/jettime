class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         :omniauthable

  has_many :projects

  field :admin, :type => Boolean, :default => false
  field :first_name
  field :last_name

  before_create :reset_authentication_token

  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end

  #sample of access_token: {"provider"=>"google_apps", "uid"=>"https://www.google.com/accounts/o8/id?id=AItOawlIIiLY8oRYWmOlldK2zWkaFSxKzE3TykU", "user_info"=>{"first_name"=>"Michael", "last_name"=>"Nikitochkin", "name"=>"Michael Nikitochkin"}}
  def self.find_for_google_apps_oauth(access_token)
    if user = User.where(email: access_token["user_info"]["email"]).first
      user
    else # Create a user with a stub password.
      User.create(:email => access_token["user_info"]["email"], :password => Devise.friendly_token[0, 20])
    end
  end

end
