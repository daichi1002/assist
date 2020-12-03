## Business-Assist

![c2b2a4d1dc170636d31ae05d95cef596](https://user-images.githubusercontent.com/72916511/100971789-ec334f80-357a-11eb-9470-4d81beda1643.gif)

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| postal_code        | string  | null: false |
| state_id           | integer | null: false |
| city               | string  | null: false |
| address_number     | string  | null: false |
| building_name      | string  | null: false |
| phone_number       | string  | null: false |
| birth_day          | date    | null: false |


### Association
- belongs_to :state
- has_many :likes
- has_many :articles
- has_many :likes
- has_many :liked_articles

## articles（記事） テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| genre_id        | integer    | null: false                    |
| type_id         | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| maximum_price   | integer    | null: false                    |
| start_date      | date       | null: false                    |
| end_date        | date       | null: false                    |
| infomation      | text       | null: false                    |
| url             | string     | null: false                    |
| registered_date | date       | null: false                    |
| update_date     | date       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- has_many   :likes
- belongs_to :user
- belongs_to :area
- belongs_to :genre
- belongs_to :type
- has_one_attached :image

## likes（お気に入り） テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| article | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :article
