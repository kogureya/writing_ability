# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |

### Association

- has_many :diaries

## diaries テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| title                  | string     | null: false       |
| text                   | text       | null: false       |
| point                  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- belongs_to :user