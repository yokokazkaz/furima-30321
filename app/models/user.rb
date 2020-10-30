class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX, allow_blank: true}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i #「半角英数字混合必須」「6文字以上100文字いない」の正規表現
  validates :password, presence: true, confirmation: true, format: { with: VALID_PASSWORD_REGEX, allow_blank: true}

  validates :last_name,  presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, allow_blank: true }
  validates :first_name,  presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, allow_blank: true }
  validates :read_last_name,  presence: true, format: { with: /\A(?:\p{Katakana}|[ー－])+\z/, allow_blank: true }
  validates :read_first_name,  presence: true, format: { with: /\A(?:\p{Katakana}|[ー－])+\z/, allow_blank: true }
  validates :birth_date,  presence: true

  has_many :items
  has_many :buyers

end
