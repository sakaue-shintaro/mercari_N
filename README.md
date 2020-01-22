# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthdate_year|integer|null: false|
|birthdate_month|integer|null: false|
|birthdate_day|integer|null: false|
|phone_number|integer|null: false, unique: true|
|address_number|string|null: false|
|address_prefecture|integer|null: false, default: 0|
|address_name|string|null: false|
|address_block|string|null: false|
|address_building|string||
|address_phone_number|integer||
|introduce|text||
|encrypted_password|string|null: false, default: ""|

### Association
- has_many :items
- has_many :comments
- has_one :evaluation
- has_one :card


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brandname|string|null: false|

### Association
- belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|path|integer|null: false|
|name|string|null: false|

### Association
- belongs_to :item
- has_ancestry


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|good|integer|null: false|
|normal|integer|null: false|
|bad|integer|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|status|integer|null: false|
|body|text||
|category_id|integer|foreign_key: true|
|size|string||
|brand_id|integer|foreign_key: true|
|condition|string|null: false|
|burden|string|null: false|
|region|string|null: false|
|sending_days|string|null: false|
|price|integer|null: false|
|saler|integer|null: false|
|buyer|integer||

### Association
- has_one :category
- has_one :brand
- belongs_to :user
- has_many :items
- has_many :images
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true

### Validation
- validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|item_id|integer|foreign_key: true|

### Association
- belongs_to :item


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null:false|

### Association
- belongs_to :user

![mercari_DB (1)](https://user-images.githubusercontent.com/54758561/71304420-cc5a5880-2409-11ea-8def-ea19871f5fe0.jpeg)
