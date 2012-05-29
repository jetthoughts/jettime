class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         :omniauthable, :invite_for => 2.weeks

  #invitable
  field :invitation_token, type: String
  field :invitation_sent_at, :type => Time
  field :invitation_accepted_at, :type => Time
  field :invitation_limit, :type => Integer
  field :invited_by_id, type: String
  field :invited_by_type, type: String

  field :admin, :type => Boolean, :default => false
  field :first_name
  field :last_name

  belongs_to :company, :autosave => true
  has_many :members
  has_many :timesheets

  accepts_nested_attributes_for :company

  validates_presence_of :company

  before_create :reset_authentication_token

  attr_accessor :subdomain

  #def self.find_for_authentication(conditions={})
  #  conditions[:company] = true
  #  super
  #end
  def self.find_for_authentication(conditions={})
    Company.where(subdomain: conditions.delete(:subdomain)).first.users.where(conditions).first
  end

  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  #sample of access_token: {"provider"=>"google_apps", "uid"=>"https://www.google.com/accounts/o8/id?id=AItOawlIIiLY8oRYWmOlldK2zWkaFSxKzE3TykU", "user_info"=>{"first_name"=>"Michael", "last_name"=>"Nikitochkin", "name"=>"Michael Nikitochkin"}}
  def self.find_for_google_apps_oauth(access_token)
    if user = User.where(email: access_token["user_info"]["email"]).first
      user
    else # Create a user with a stub password.
      User.create(:email => access_token["user_info"]["email"], :password => Devise.friendly_token[0, 20])
    end
  end

  def build_company(args={})
    self.company ||= Company.new(args)
  end

end
