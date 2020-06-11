class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # step1
  validates :nickname,presence: true, uniqueness: true, on: :validates_step1
  validates :email,presence: true, uniqueness: true, on: :validates_step1
  
  # step2
  validates :family_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}, on: :validates_step2
  validates :first_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}, on: :validates_step2
  validates :furigana_family_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}, on: :validates_step2
  validates :furigana_first_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}, on: :validates_step2
  validates :birthday,presence: true, on: :validates_step2

  has_one  :address,       dependent: :destroy
  accepts_nested_attributes_for :address
end
