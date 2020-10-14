# テーブル設計

## users テーブル

| Colum    | Type    | Options    |
| -------- | ------- | ---------- |
| nickname | string  | null:false |
| email    | string  | null:false |
| password | string  | null:false |
| name     | string  | null:false |
| furigana | string  | null:false |
| birthday | integer | null:false |

 ### Association

 - has_many :items
 - has_many :comments

## items テーブル

| Colum       | Type       | Options    |
| ----------- | ---------- | ---------- |
| product     | string     | null:false |
| description | string     | null:false |
| category    | string     | null:false |
| status      | string     | null:false |
| burden      | string     | null:false |
| day_to_ship | string     | not null   |
| user        | references |            |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## purchases テーブル

| Colum            | Type       | Options    |
| ---------------- | ---------- | ---------- |
| card_information | integer    | null:false |
| deadline         | integer    | null:false |
| code             | integer    | null:false |
| post_code        | integer    | null:false |
| city             | string     | null:false |
| address          | string     | null:false |
| building         | string     |            |
| tel              | integer    | null:false |
| item             | references |            |

### Association

- belongs_to :item

## comments テーブル

| Colum | Type       | Options    |
| ----- | ---------- | ---------- |
| text  | string     | null:false |
| user  | references |            |
| item  | references |            |

### Association

- belongs_to :user
- belongs_to :item