class DislikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @dislike = current_user.dislikes.build(dislike_params)
    @tweet = @dislike.tweet
    if @dislike.save
      respond_to :js
    end
  end

  def destroy
    @dislike = Dislike.find_by(id: params[:id])
    @tweet = @dislike.tweet
    if @dislike.destroy
      respond_to :js
    end
  end

  private
    def dislike_params
      params.permit(:tweet_id)
    end
end
