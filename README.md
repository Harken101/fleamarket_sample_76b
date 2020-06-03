-#frima sample DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|pass|string|null: false|
|nicname|string|null: false|
|birthday|date|null: false|
|familyname|string|null: false|
|firstname|string|null: false|
|furiganafamilyname|string|null: false|
|furiganafirstname|string|null: false|
### Association
- has_many :items
- has_many :addresses
- has_many :cards

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|familyname|string|null: false|
|firstname|string|null: false|
|furiganafamilyname|string|null: false|
|furiganafirstname|string|null: false|
|zipcode|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|street|string|null: false|
|mansion|string|
|tell|string|
### Association
belongs_to :user
belongs_to :prefecture


## carsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|description|text|null: false|
|status|integer|null: false| <!-- enumを使う -->
|price|integer|null: false|
|payer|integer|null: false| <!-- enumを使う -->
|preday|integer|null: false| <!-- enumを使う -->
|sold|integer|
|category_id|integer|null: false, foreign_key: true|
|postage_typ_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :postage_types
- belongs_to :shipping
- has_many :images

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
has_many :items

## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
has_many :items
has_many :addresses

## postage_typesテーブル
|Column|Type|Options|
|------|----|-------|
|ship_price|string|null: false|
### Association
has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|
|item_id|integer|null: false, foreign_key: true|
### Association
belongs_to :item