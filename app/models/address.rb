class Address < ApplicationRecord

  validates :family_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :furigana_family_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}
  validates :furigana_first_name,presence: true,format: { with: /\A[ぁ-んー－]+\z/}
  validates :zipcode,            presence: true
  validates :prefecture,         presence: true
  validates :city,               presence: true
  validates :street,             presence: true
  # validates :tell,            

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
