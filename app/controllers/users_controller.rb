class UsersController < ApplicationController
  
  before_action :set_user

  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.json
    end
  end

  def show
    @tweets = Tweet.where(user_id: @user.id).order('created_at DESC')
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

end
