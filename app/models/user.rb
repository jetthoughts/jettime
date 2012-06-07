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

## Database authenticatable
  field :email, :type => String
  field :encrypted_password, :type => String

  ## Recoverable
  field :reset_password_token, :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count, :type => Integer
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at, :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  # Token authenticatable
  field :authentication_token, :type => String

  ## Invitable
  # field :invitation_token, :type => String

  validates :email, :encrypted_password, presence: true
  validates :email, uniqueness: true, allow_nil: true
  index({email: 1}, {unique: true})

  field :first_name
  field :last_name

  belongs_to :company, :autosave => true, inverse_of: :users

  has_many :members
  has_many :timesheets
  #has_many :companies, inverse_of: :owner


  accepts_nested_attributes_for :company

  validates_presence_of :company

  before_create :reset_authentication_token

  attr_accessor :subdomain

  attr_accessible :email, :password, :password_confirmation, :remember_me


  # Scopes
  scope :admin, where(admin: true)

  #def self.find_for_authentication(conditions={})
  #  conditions[:company] = true
  #  super
  #end
  def self.find_for_authentication(conditions={})
    if conditions.has_key?(:subdomain) && !conditions[:subdomain].blank?
      Company.where(subdomain: conditions.delete(:subdomain)).first.users.where(conditions).first
    else
      User.admin.where(conditions).first
    end
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
