class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :account
  has_many :announcements

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise(
    :database_authenticatable,
    :registerable,
    # :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable
  )

  ## Database authenticatable
  field :email,              :type => String, :null => false, :default => ""
  field :encrypted_password, :type => String, :null => false, :default => ""

  # ## Recoverable
  # field :reset_password_token,   :type => String
  # field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Encryptable
  # field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  field :name, type: String
  field :image, type: String
  field :role, type: String, default: "Guest"
  field :info, type: String
  field :notes, type: String

  ROLES = %w(Guest User Admin)

  ADMIN = PRIVATE_CONFIG[Rails.env]["admin"] rescue []

  after_update :create_account

  validates :role, inclusion: {:in => ROLES}

  def create_account
    self.account ||= Account.create!(user: self) unless guest?
  end

  def guest?
    role.nil? or role.blank? or role == "Guest"
  end

  def admin?
    ADMIN.include? email or role == "Admin"
  end

  def to_s
    name || email
  end

  def balance_str
    account.nil? ? "N/A" : "#{account.balance}h"
  end

  # cache the redirected image if any
  def face
    return nil unless image
    Rails.cache.fetch(image) do
      Faraday.head(image).headers[:location] || image
    end
  end


  # Facebook omniauth. See https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(email: data.email).first
      user
    else # Create a user with a stub password.
      User.create!(email: data.email,
                   name: data.name,
                   image: access_token.info.image,
                   password: Devise.friendly_token[0,20],
                   info: YAML.dump(access_token))
    end
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(email: data["email"]).first
      user
    else
      User.create!(email: data["email"],
                   password: Devise.friendly_token[0,20],
                   info: YAML.dump(access_token.to_hash))
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  include Mongo::Voter
end
