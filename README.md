# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| family_name_full   | string | null: false                |
| first_name_full    | string | null: false                |
| family_name_half   | string | null: false                |
| first_name_half    | string | null: false                |
| birth_day          | date   | null: false                |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| item_name       | text       | null: false                     |
| image           | string     | null: false                     |
| category        | text       | null: false                     |
| situation       | text       | null: false,                    |
| explanation     | string     | null: false                     |
| delivery_charge | integer    | null: false                     |
| delivery_date   | date       | null: false                     |
| price           | integer    | null: false                     |
| area            | text       | null: false                     |
| user_id         | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :purchase

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- has_one to:address


## addresses テーブル

| Column           | Type   | Options                    |
| ---------------- | ------ | -------------------------- |
| post_code        | string | null: false                |
| prefecture       | string | null: false                |
| municipalities   | string | null: false                |
| house_number     | string | null: false                |
| building         | string |                            |
| phone            | string | null: false                |

### Association

- belongs_to :purchases



