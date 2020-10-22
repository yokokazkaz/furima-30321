# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| name            | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| ruby_last_name  | string | null: false               |
| ruby_first_name | string | null: false               |
| birth_date      | date   | null: false               |


### Association

- has_many :items
- has_one  :buyer

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| detail           | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| delivery_fee     | integer    | null: false                    |
| shipping_area    | string     | null: false                    |
| shipping_days    | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| buyer_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer


## buyer テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| card_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :items
- has_one    :ship_address

## ship_address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| address_detail | string     | null: false                    |
| apartment_name | string     |                                |
| phone_number   | string     | null: false                    |
| buyer_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer  