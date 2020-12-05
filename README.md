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

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| kanjifirstname     | string | null: false |
| kanjifamilyname    | string | null: false |
| first_name_kana    | string | null: false |
| kanafamilyname     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :consumers

## items テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| name            | string  | null: false       |
| discription     | text    | null: false       |
| category_id     | integer | null: false       |
| status_id       | integer | null: false       |
| shippingfee_id  | integer | null: false       |
| prefecture_id   | integer | null: false       |
| shippingdate_id | integer | null: false       |
| price           | integer | null: false       |
| user_id         | integer | foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :consumer

## comments テーブル

| Column  | Type    | Options           |
| ------- | ------- | ----------------- |
| content | string  | null: false       |
| item_id | integer | foreign_key: true |
| user_id | integer | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## consumers テーブル

| Column  | Type    | Options           |
| ------- | ------- | ----------------- |
| item_id | integer | foreign_key: true |
| user_id | integer | foreign_key: true |

### Association

- has_one :shipping_address
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column        | Type    | Options           |
| ------------- | ------- | ----------------- |
| postal        | string  | null: false       |
| prefucture_id | integer | null: false       |
| city          | string  | null: false       |
| address       | string  | null: false       |
| building      | string  |                   |
| phonenumber   | string  | null: false       |
| consumer_id   | integer | foreign_key: true |

### Association

- belongs_to :consumer