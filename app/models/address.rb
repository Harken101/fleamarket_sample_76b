class Address < ApplicationRecord

  validates :family_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} , on: :validates_step3
  validates :first_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}, on: :validates_step3
  validates :furigana_family_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}, on: :validates_step3
  validates :furigana_first_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}, on: :validates_step3
  validates :zipcode, format: { with: /\A\d{3z}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}, presence: true, on: :validates_step3
  validates :prefecture,         presence: true, on: :validates_step3
  validates :city,               presence: true, on: :validates_step3
  validates :street,             presence: true, on: :validates_step3
  validates :tell, format: { with: /\A\d{10,11}\z/}, on: :validates_step3

  belongs_to :user, optional: true
end
