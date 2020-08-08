class UsersController < ApplicationController
  
  before_action :set_user, only: [:index, :show, :search, :edit]

  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.json
    end
  end

  def show
    @tweets = Tweet.where(user_id: @user.id).order('created_at DESC')
    @tweets_count = Tweet.where(user_id: @user.id).count
  end

  def search
    @users = User.search(params[:keyword])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_pic)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
