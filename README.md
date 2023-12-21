
 usersテーブル

|Column             |Type   |Options      |
|-------------------|-------|-------------|
|nickname           |string |null: false  |
|email              |string |null: false  |
|encrypted_password |string |null: false  |
|last_name          |string |null: false  |
|first_name         |string |null: false  |
|last_name_kana     |string |null: false  |
|first_name_kana    |string |null: false  |
|birthday           |date   |null: false  |


has_many :items
has_many :purchasers


itemsテーブル

|Column            |Type       |Options                         |
|------------------|-----------|--------------------------------|
|title             |string     |null: false                     |
|explanation       |text       |null: false                     |
|category          |integer    |null: false                     |
|condition         |integer    |null: false                     |
|shipping_fee      |integer    |null: false                     |
|shipping_source   |integer    |null: false                     |
|shipping_schedule |integer    |null: false                     |
|price             |integer    |null: false                     |
|user              |references |null: false, foreign_key: true  |


belongs_to :user
has_one :purchasers


purchasersテーブル

|Column|Type        |Options                        |
|------|------------|-------------------------------|
|user  |references  |null: false, foreign_key: true |
|item  |references  |null: false, foreign_key: true |


belongs_to :user
belongs_to :items
has_one :addresses


addressesテーブル
|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
|postal_code   |string     |null: false                     |
|prefecture_id |integer    |null: false                     |
|city          |string     |null: false                     |
|street_address|string     |null: false                     |
|building_name |string     |                                |
|phone_number  |string     |null: false                     |
|purchaser     |references |null: false, foreign_key: true  |

belongs_to :purchasers


