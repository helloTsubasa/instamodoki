<h1>InstaModoki(Insta風写真投稿アプリ)</h1>




## DEMO
![DEMO](https://user-images.githubusercontent.com/66294265/89740069-cdd3b080-dac0-11ea-8ce9-9975f57a629d.gif)

## アプリケーションの概要
Instagram風写真投稿アプリです。  
写真付ツイートの投稿と、ユーザー間でチャットが出来ます。  
個人制作物としては、本アプリが処女作になります。  

## 制作経緯
本アプリ開発の目的は、個人開発を通じた自分自身のスキルアップです。

プログラミングスクールでこれまで、写真投稿アプリ・チャットアプリを作成しました。  
ただ正直に言うと、教材に倣ってコードを書いているだけなので、完全に100%自分の技術に出来ているのかという不安がありました。  
また、これまで自分自身の力だけで0からWebアプリを作った経験がありませんでした。  

そこで、これまで作成してきたアプリの機能を組み合わせて、個人制作物の開発を行う事を決めました。  
Instagram風のアプリにした理由は、下記の２点です。
<ul>
  <li>これまで学習した内容+αの知識で実装が可能</li>
  <li>SNSアプリの需要は今後も好調を維持すると予測出来るため、有名SNSアプリの機能を実装することで、今後必要とされるエンジニアとしての知識を得ることが出来る</li>
</ul>

学んだ知識の定着および、新しい知識の習得のために本アプリの制作を決意した次第です。

## 本番環境
<ul>
  <li>URL : https://instamodoki.herokuapp.com/</li>
  <li>テスト用アカウント</li>
  <ul>
    <li>ユーザー名：test_user</li>
    <li>メールアドレス：test@test.com</li>
    <li>パスワード：12345678</li>
  </ul>
</ul>


## アプリケーションの機能
<ul>
  <li>ユーザーの新規登録/ログイン</li>
  <li>ユーザーマイページの表示</li>
  <li>ユーザーの検索</li>
  <li>ユーザー情報の編集・削除</li>
  <li>ツイートの一覧表示</li>
  <li>ツイートの投稿・削除</li>
  <li>ツイートの詳細表示</li>
  <li>ツイートへのいいね・わるいね(非同期)</li>
  <li>ツイートへのコメント(非同期)</li>
  <li>ユーザー間のチャット(非同期)</li>
  <li>チャットグループの作成・編集・削除</li>
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


## 今後の実装予定
<ul>
  <li>フォロー/フォロワー機能</li>
  <li>ユーザー検索(非同期)</li>
  <li>画像の複数枚投稿・表示</li>
  <li>動画の投稿・表示</li>
</ul>

<br></br>
# DB設計
![データベース ER 図](https://user-images.githubusercontent.com/66294265/89739468-dfff2000-dabb-11ea-82ca-183a5fef488e.png)


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
- has_many :messages
- has_many :group_users
- has_many :groups, through :group_users


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



## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :group_users
- has_many :users, through :group_users


## group_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
