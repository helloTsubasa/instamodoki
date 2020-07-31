class UsersController < ApplicationController
  
  before_action :set_user

  def show
    @tweets = Tweet.where(user_id: @user.id).order('created_at DESC')
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

end
