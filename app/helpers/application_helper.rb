module ApplicationHelper
  def avatar_url(user)
    return user.profile_pic unless user.profile_pic.nil?
    "https://yt3.ggpht.com/a/AATXAJw1i2lxh6Mw8_KjBvnABfJIZlUGeHdZaNjc5Q=s900-c-k-c0xffffffff-no-rj-mo"
  end
end
