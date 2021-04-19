# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |

### Association

- has_many :diaries
- has_many :points

## diaries テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| title                  | string     | null: false       |
| text                   | text       | null: false       |
| user                   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :point

## points テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| point                  | integer    | null: false       |
| diary                  | references | foreign_key: true |
| user                   | references | foreign_key: true |

belongs_to :user
belongs_to :diary