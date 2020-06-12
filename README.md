-#frima sample DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|pass|string|null: false|
|nickname|string|null: false|
|birthday|date|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|furigana_family_name|string|null: false|
|furigana_first_name|string|null: false|
### Association
- has_many :items dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :cards, dependent: :destroy
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|furigana_family_name|string|null: false|
|furigana_first_name|string|null: false|
|zipcode|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|street|string|null: false|
|mansion|string|
|tell|string|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture
## cardsテーブル
<!-- gem Payjpを使う -->
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
belongs_to :user
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|status|integer|null: false| <!-- enumを使う -->
|price|integer|null: false|
|payer|integer|null: false| <!-- enumを使う -->
|preday|integer|null: false| <!-- enumを使う -->
|sellar_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|postage_typ_id|integer|null: false, foreign_key: true|
|prefecture|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :postage_typ
- has_many :item_images
- belongs_to_active_hash :prefecture
- has_one :sellar 
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
- has_many :items
<!-- prefecturesモデルはある。gem  active hash-->
## postage_typesテーブル
|Column|Type|Options|
|------|----|-------|
|ship_price|string|null: false|
### Association
- has_many :items, dependent: :destroy
## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## sellarsテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

