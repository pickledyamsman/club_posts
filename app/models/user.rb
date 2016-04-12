class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :clubs, through: :posts

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(email: data["email"],
        password: Devise.friendly_token[0,20])
      end
    user
  end

  def name_without_email
    email.split("@").first
  end
end
