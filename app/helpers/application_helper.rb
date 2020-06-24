module ApplicationHelper
  def avatar_url(user)
    return user.profile_pic unless user.profile_pic.nil?
    "https://pbs.twimg.com/media/DunUuqPUYAAQtCq.jpg"
  end
end
