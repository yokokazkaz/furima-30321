class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX, allow_blank: true}
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :encrypted_password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, allow_blank: true}

  validates :last_name,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true }
  validates :first_name,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true }
  validates :read_last_name,  presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, allow_blank: true }
  validates :read_first_name,  presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, allow_blank: true }
  validates :birth_date,  presence: true

end
