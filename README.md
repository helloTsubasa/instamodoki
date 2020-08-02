<h1>InstaModoki(Insta風写真投稿アプリ)</h1>

## アプリケーションの概要
~~Instagramのパクリ~~もとい、Instagram風写真投稿アプリです。  
個人制作物としては、本アプリが処女作になります。  
herokuを使ってデプロイ済 --> https://instamodoki.herokuapp.com/  

## アプリケーションの機能
<ul>
  <li>ユーザーの新規登録/ログイン</li>
  <li>ユーザーマイページの表示</li>
  <li>ツイートの一覧表示</li>
  <li>ツイートの投稿</li>
  <li>ツイートの削除</li>
  <li>ツイートの詳細表示</li>
  <li>ツイートへのいいね・わるいね(非同期)</li>
  <li>ツイートへのコメント(非同期)</li>
</ul>

## 開発環境

<p>
  <a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="45px;" /></a>
  <a href="https://railsguides.jp/getting_started.html"><img src="https://y-hilite.com/wp-content/uploads/2018/02/rails_logo.png" height="45px;" /></a>
   <a href="https://devdocs.io/html/"><img src="https://user-images.githubusercontent.com/66232530/88711698-87429580-d153-11ea-9ae5-452b13d15a70.png" height="45px;" /></a>
  <a href="https://devdocs.io/css/"><img src="https://user-images.githubusercontent.com/66232530/88711881-ccff5e00-d153-11ea-998e-f22d427ffa70.jpg" height="45px;" /></a>
  <a href="https://www.javascript.com/"><img src="https://user-images.githubusercontent.com/66232530/88712057-1780da80-d154-11ea-9129-11a9ff70322e.png" height="45px;" /></a>
  <a href="http://haml.info/"><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="45px;" /></a>
  <a href="https://sass-lang.com/"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Sass_Logo_Color.svg/144px-Sass_Logo_Color.svg.png" height="40px;" /></a>
  <a href="https://jquery.com/"><img src="https://syncer.jp/storage/web/brand-logos/static/dst/jquery-logo-001.png" height="45px;" /></a>
  <a href="https://github.co.jp/"><img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" height="45px;" /></a>
  <a href="https://jp.heroku.com/"><img src="https://webbibouroku.com/wp-content/uploads/eye_heroku.png" height="45px;" /></a>
</p>


# DB設計
![データベース ER 図](https://user-images.githubusercontent.com/66294265/89129578-61453880-d539-11ea-80c0-b28c22719a27.png)


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



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|tweet_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet
