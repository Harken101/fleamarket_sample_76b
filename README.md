-#frima sample DB設計
## userテーブル
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
- has_many :item
- has_many :address
- has_many :cards

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|description|text|null: false|
|status|string|null: false|
|price|integer|null: false|
### Association
belongs_to :user
belongs_to :category
has_many :images
 
## addressテーブル
|Column|Type|Options|
|------|----|-------|
|familyname|string|null: false|
|firstname|string|null: false|
|furiganafamilyname|string|null: false|
|furiganafirstname|string|null: false|
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|mansion|string|
|tell|string|
### Association
belongs_to :user

## carsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
has_many :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|
|item_id|integer|null: false, foreign_key: true|
### Association
belongs_to :item



aaaaaa