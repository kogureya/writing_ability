アプリケーション名  
writing_ability

アプリケーション概要  
日記を毎日欠かさず書くことで、文章構成力を向上させることを目的として作成しました。  
毎日続けるためにゲーム性を導入し飽きずに続けられるよう設計しています。

URL：http://35.73.84.139/

テスト用アカウント  
ID：aozora@email.com  
パスワード：aozora  
ポイントを使用したシステムを確認するためのアカウントです。  
ポイント取得のための文章は青空文庫様よりお借りしております。

利用方法  
日記を書くことでそれに応じたポイントを取得します。  
取得したポイントでゲームを遊ぶことができます。

目指した課題解決  
文章を書くことが苦手な人やブログを始めたが長続きせずやめてしまった人が  
書き続けることで毎日の習慣にできるよう考えて制作しました。  

要件定義URL：https://docs.google.com/spreadsheets/d/1d2xf9S5pLwZaYInN6-oBk2qViai9ChhbrgrgyZqECOQ/edit#gid=282075926

画像：




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