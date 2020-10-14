# テーブル設計

## users テーブル

| Colum    | Type   | Options    |
| -------- | ------ | ---------- |
| nickname | string | null:false |
| email    | string | null:false |
| password | string | null:false |

 ### Association

 - has_one :profile

 ## profiles テーブル

| Colum    | Type    | Option     |
| -------- | ------- | ---------- |
| name     | string  | null:false |
| furigana | string  | null:false |
| birthday | integer | null:false |

### Association

- belongs_to :user