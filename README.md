# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | ---------------------------|
| nickname           | string | null: false                |
| email              | string | null: false  unique: true  |
| encrypted_password | string | null: false                |
| firstname          | string | null: false                |
| lastname           | string | null: false                |
| firstname_kana     | string | null: false                |
| lastname_kana      | string | null: false                |
| birthday           | date   | null: false                |


### Association

- has_many :items
- has_many :product_records







## items テーブル

| Column            | Type        | Options                        |
| ------------------| ----------- | -----------------------------  |
| product name      | string      | null: false                    |
| explanation       | text        | null: false                    |
| category_id       | integer     | null: false                    |
| productstate_id   | integer     | null: false                    | 
| deliveryfee_id    | integer     | null: false                    |
| region_id         | integer     | null: false                    |
| deliverydate_id   | integer     | null: false                    |
| price             | integer     | null: false                    |
| user              | references  | foreign_key: true              |




### Association

- belongs_to :user
- has_one    :product_record







## product_record テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| user               | references | foreign_key: true              |
| item               | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :items
- has_one    :shipping_address





## shipping_address テーブル

| Column             | Type       | Options                        |
| -------------------| -----------| -----------------------------  |
| postalcode         | string     | null: false                    |
| prefectures        | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    | 
| buildingname       | string     | null: false                    |
| phonenumber        | string     | null: false                    |
| product_record     | references | foreign_key: true              |


### Association

- belongs_to :product_record