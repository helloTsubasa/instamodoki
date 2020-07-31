class Tweet < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :dislikes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  def liked_by(user)
    Like.find_by(user_id: user.id, tweet_id: id)
  end

  def disliked_by(user)
    Dislike.find_by(user_id: user.id, tweet_id: id)
  end

end
