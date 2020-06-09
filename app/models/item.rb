class Item < ApplicationRecord
  
  belongs_to :category

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  
  #アソシエーションを組んであるモデルに対してのバリデーションを組む
  validates_associated :images
  validates :images, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum delivery_charge: {
    "送料込み（出品者負担)":1, "着払い（購入者負担)":2
  }

  enum delivery_days:{
    "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3
  }

  enum item_statuses:{
    "新品、未使用":1, "目立った傷や汚れなし":2, "やや傷や汚れあり":3, "全体的に状態が悪い":4
  }

end
