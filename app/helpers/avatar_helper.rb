module AvatarHelper
  def avatar_url_for(user)
    if user.avatar.attached?
      user.avatar
    else
      file_path = Rails.root.join('app/javascript/images/default-avatar.png')
      user.avatar.attach(io: File.open(file_path), filename: 'default-avatar.png', content_type: 'image/png')
    end
  end
end