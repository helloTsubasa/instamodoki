<h1 align="center">Instamodoki</h1>

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
