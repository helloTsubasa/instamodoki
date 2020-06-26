class TweetsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @tweets = Tweet.all.includes(:photos, :user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
    @tweet.photos.build
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.photos.present?
      @tweet.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:text, photos_attributes: [:image]).merge(user_id: current_user.id)
    end

end
