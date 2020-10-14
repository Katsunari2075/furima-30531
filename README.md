# テーブル設計

## users テーブル

| Colum           | Type   | Options    |
| --------------- | ------ | ---------- |
| nickname        | string | null:false |
| email           | string | null:false |
| password        | string | null:false |
| last_name       | string | null:false |
| first_name      | string | null:false |
| kana_last_name  | string | null:false |
| kana_first_name | string | null:false |
| birthday        | date   | null:false |

 ### Association

 - has_many :items
 - has_many :comments
 - has_many :purchases

## items テーブル

| Colum          | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| name           | string     | null:false                    |
| description    | string     | null:false                    |
| category_id    | integer    | null:false                    |
| status_id      | integer    | null:false                    |
| burden_id      | integer    | null:false                    |
| area_id        | integer    | null:false                    |
| day_to_ship_id | integer    | null:false                    |
| price          | integer    | null:false                    |
| user           | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## purchases テーブル

| Colum | Type       | Options                       |
| ----- | ---------- | ----------------------------- |
| user  | references | null:false, foreign_key: true |
| item  | references | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :recipient

## recipient テーブル

| Colum     | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| post_code | string     | null:false                    |
| area_id   | integer    | null:false                    |
| city      | string     | null:false                    |
| address   | string     | null:false                    |
| building  | string     |                               |
| tel       | string     | null:false                    |
| purchase  | references | null:false, foreign_key: true |

### Association

- belongs_to :purchase
