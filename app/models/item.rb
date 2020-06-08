class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum delivery_charge: {
    "送料込み（出品者負担)":1, "着払い（購入者負担)":2
  }

  enum delivery_days:{
    "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3
  }

end
