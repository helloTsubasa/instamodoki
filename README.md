<h1 align="center">InstaModoki(Insta風写真投稿アプリ)</h1>

## アプリケーションの概要
IPアドレス : https://instamodoki.herokuapp.com/  
~~Instagramのパクリ~~もとい、Instagram風写真投稿アプリです。  
画像と文章を合わせて投稿できます。  

## アプリケーションの機能
<ul>
  <li></li>
  <li></li>
  <li></li>
</ul>

# DB設計
![データベース ER 図](https://user-images.githubusercontent.com/66294265/88665910-4e39ff00-d11a-11ea-96f3-9e842b7dc310.png)


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|profile_photo|string||

### Association
- has_many :tweets
- has_many :likes
- has_many :dislikes


## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- has_many :photos
- has_many :likes
- has_many :dislikes
- belongs_to :user


## photosテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|tweet_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :tweet



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet



## dislikesテーブル

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet
