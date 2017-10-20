<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->

## usersテーブル

|Column|Typy|Options|
|------|----|-------|
|id|int|null: false|
|user_name|str|null: false, index: true|
|e-mail|str|null: false, unique: true|

### Association
- has_many :groups, through: :group_users
- has_many :group_users
- has_many :messages

## groupsテーブル

|Column|Typy|Options|
|------|----|-------|
|id|int|null:false|
|group_name|str|null: false, unique: true|

### Association
-has_many :users, through: :group_users
-has_many :group_users

## group_usersテーブル

|Column|Typy|Options|
|------|----|-------|
|id|int|null: false|
|user_id|int|null: false, foreign_key: true|
|group_id|int|null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :group

##messagesテーブル

|Column|Typy|Options|
|------|----|-------|
|id|int|null: false|
|body|text||
|image|str||
|group_id|int|null: false|
|user_id|int|null: false|

### Association
-belongs_to :user
-belongs_to :group