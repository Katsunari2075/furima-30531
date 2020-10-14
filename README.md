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

## items テーブル

| Colum          | Type       | Options    |
| -------------- | ---------- | ---------- |
| name           | string     | null:false |
| description    | string     | null:false |
| category_id    | integer    | null:false |
| status_id      | integer    | null:false |
| burden_id      | integer    | null:false |
| area_id        | integer    | null:false |
| day_to_ship_id | integer    | null:false |
| user           | references |            |

### Association

- belongs_to :user
- belongs_to :purchase
- has_many :comments

## purchases テーブル

| Colum | Type       | Options |
| ----- | ---------- | ------- |
| user  | references |         |
| item  | references |         |

### Association

- belongs_to :item
- belongs_to :user
- has_one :recipient

## recipient テーブル

| Colum     | Type       | Options    |
| --------- | ---------- | ---------- |
| post_code | integer    | null:false |
| area_id   | integer    | null:false |
| city      | string     | null:false |
| address   | string     | null:false |
| building  | string     |            |
| tel       | integer    | null:false |
| purchase  | references |            |

### Association

- belongs_to :purchase
