# テーブル設計

## users テーブル

| Column      | Type   | Options                |
| ------------| ------ | -----------------------|
| nickname    | string | NOT NULL               |
| email       | string | NOT NULL               |
| password    | string | NOT NULL  unique: true |

### Association

- has_many :items
- has_many :product record







## items テーブル

| Column         | Type       | Options                        |
| ---------------| -----------| -----------------------------  |
| product name   | string     | NOT NULL                       |
| explanation    | text       | NOT NULL                       |
| product state  | string     | NOT NULL                       | 
| delivery fee   | string     | NOT NULL                       |
| region         | string     | NOT NULL                       |
| date           | string     | NOT NULL                       |
| price          | string     | NOT NULL                       |
| user           | references | null: false, foreign_key: true |




### Association

- belongs_to :user
- has_one    :product  record
- has_one    :shipping address







## product record テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| who bought what    | string     | NOT NULL                       |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one    :shipping address





## shipping address テーブル

| Column         | Type       | Options                       |
| ---------------| -----------| ----------------------------- |
| postal code    | string     | NOT NULL                      |
| prefectures    | string     | NOT NULL                      |
| municipality   | string     | NOT NULL                      |
| address        | string     | NOT NULL                      | 
| phone number   | string     | NOT NULL                      |


### Association

- belongs_to :product record