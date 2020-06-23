class Address < ApplicationRecord

  validates :family_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} 
  validates :first_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :furigana_family_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}
  validates :furigana_first_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}
  validates :zipcode, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}, presence: true
  validates :prefecture, presence: true, numericality: { less_than_or_equal_to: 47 } 
  validates :city,               presence: true
  validates :street,             presence: true
  validates :tell,presence: false, format: { with: /\A\d{10,11}\z/}, allow_blank: true
  belongs_to :user, optional: true
end
