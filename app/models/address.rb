class Address < ApplicationRecord

  validates :family_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} , on: :validates_step3
  validates :first_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}, on: :validates_step3
  validates :furigana_family_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}, on: :validates_step3
  validates :furigana_first_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}, on: :validates_step3
  validates :zipcode,            presence: true, on: :validates_step3
  validates :prefecture,         presence: true, on: :validates_step3
  validates :city,               presence: true, on: :validates_step3
  validates :street,             presence: true, on: :validates_step3
  # validates :tell

  belongs_to :user, optional: true
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
end
