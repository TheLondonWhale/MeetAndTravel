class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tips, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :conversations, dependent: :destroy

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(username) = :value OR lower(email)= :value", value: login.downcase).first
    else
      where(conditions.to_hash).first
    end
  end


  def self.from_facebook(auth)
    where(facebook_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
    end
  end

  def age
    age = Date.today.year - birthdate.year
  end

  def user_time
    @usertime = updated_at.strftime("%d/%m/%y à %Hh%M")
  end
end
