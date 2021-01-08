# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | NOT NULL                |
| email              | string | NOT NULL  unique: true  |
| encrypted_password | string | NOT NULL                |
| firstname          | string | NOT NULL                |
| lastname           | string | NOT NULL                |
| firstname_kana     | string | NOT NULL                |
| lastname_kana      | string | NOT NULL                |
| birthday           | date   | NOT NULL                |


### Association

- has_many :items
- has_many :product_records







## items テーブル

| Column            | Type        | Options                        |
| ------------------| ----------- | -----------------------------  |
| product name      | string      | NOT NULL                       |
| explanation       | text        | NOT NULL                       |
| category_id       | integer     | NOT NULL                       |
| productstate_id   | integer     | NOT NULL                       | 
| deliveryfee_id    | integer     | NOT NULL                       |
| region_id         | integer     | NOT NULL                       |
| deliverydate_id   | integer     | NOT NULL                       |
| price_id          | integer     | NOT NULL                       |
| user_id           | references  | null: false, foreign_key: true |




### Association

- belongs_to :user
- has_one    :product_record







## product_record テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |
| purchaserecord_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one    :shipping_address





## shipping_address テーブル

| Column             | Type       | Options                        |
| -------------------| -----------| -----------------------------  |
| postalcode         | string     | NOT NULL                       |
| prefectures        | string     | NOT NULL                       |
| municipality       | string     | NOT NULL                       |
| address            | string     | NOT NULL                       | 
| buildingname       | string     | NOT NULL                       |
| phonenumber        | string     | NOT NULL                       |
| product_record_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :product_record