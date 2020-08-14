class User < ApplicationRecord

  has_many :tweets, dependent: :destroy
  has_many :likes
  has_many :dislikes
  has_many :comments, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: {case_sensitive: true}
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def self.search(search)
    if search
      User.where('name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end

end
