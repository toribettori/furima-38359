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

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| item_name          | string     | null: false                     |
| category_id        | integer    | null: false                     |
| situation_id       | integer    | null: false,                    |
| explanation        | text       | null: false                     |
| delivery_charge_id | integer    | null: false                     |
| delivery_date_id   | integer    | null: false                     |
| price              | integer    | null: false                     |
| area_id            | integer    | null: false                     |
| user               | references | null: false, foreign_key: true |


### Association
  
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one to:address
- belongs_to :user


## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| area_id          | integer    | null: false                    |
| municipalitie    | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     |                                |
| phone            | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase



