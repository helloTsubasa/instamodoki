class TweetsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :destroy]
  before_action :set_user, only: [:index, :show]

  
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

  def show
  end

  def destroy
    if @tweet.user == current_user
      flash[:notice] = "投稿が削除されました" if @tweet.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:text, photos_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_tweet
      @tweet = Tweet.find_by(id: params[:id])
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end

end
