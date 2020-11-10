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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| kanjifirstname  | string | null: false |
| kanjifamilyname | string | null: false |
| kanafirstname   | string | null: false |
| kanafamilyname  | string | null: false |
| birthday        | text   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :consumer

## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| image        | string | null: false |
| name         | string | null: false |
| discriotion  | string | null: false |
| category     | string | null: false |
| status       | string | null: false |
| shippingfee  | string | null: false |
| shippingarea | string | null: false |
| shippingdate | string | null: false |
| price        | text   | null: false |

### Association

- has_many :comments
- belongs_to :user
- has_one :consumer

## comments テーブル

| Column  | Type       | Options   |
| ------- | ---------- | --------- |
| content | string     | null: false |

### Association

- belongs_to :user

## consumers テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| date   | string     | null: false |

### Association

- has_one :shipping_adress
- belongs_to :item
- belongs_to :user

## shipping_adresses テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal      | string     | null: false |
| prefucture  | string     | null: false |
| city        | string     | null: false |
| adress      | string     | null: false |
| building    | string     | null: false |
| phonenumber | string     | null: false |

### Association

- belongs_to :consumer