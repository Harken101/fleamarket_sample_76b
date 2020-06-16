class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # step1
  validates :nickname,presence: true, uniqueness: true
  validates :email,presence: true, uniqueness: true
  

  validates :family_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :furigana_family_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}
  validates :furigana_first_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}
  validates :birthday,presence: true


  has_one  :address,       dependent: :destroy
  accepts_nested_attributes_for :address
end
