class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  belongs_to :category
  belongs_to :user

  validates :name, presence: true, length: {maximum: 40}
  validates :description, presence: true, length: {maximum: 1000}
  validates :price, length: {maximum: 10}
  validates :prefecture_id, presence: true, numericality: { less_than_or_equal_to: 47 }
  validates :category_id, presence: true
  validates :child_category_id, presence: true
  validates :grandchild_category_id, presence: true, :numericality => { :greater_than_or_equal_to => 1} 
  
  #アソシエーションを組んであるモデルに対してのバリデーションを組む
  validates_associated :images
  validates :images, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  enum delivery_charge: {
    "送料込み（出品者負担)":0, "着払い（購入者負担)":1
  }

  enum delivery_days:{
    "1~2日で発送":0, "2~3日で発送":1, "4~7日で発送":2
  }

  enum item_statuses:{
    "新品、未使用":0, "目立った傷や汚れなし":1, "やや傷や汚れあり":2, "全体的に状態が悪い":3
  }
 
  belongs_to :category
  
  def self.items_search(search)
    if search
      Item.where(['name LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end

end