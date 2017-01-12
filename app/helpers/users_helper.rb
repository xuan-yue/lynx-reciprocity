module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 40)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag("http://sedonakarma.com/images/wallpapers/profile-pictures/profile-pictures-1.jpg", alt: user.firstName, class: "gravatar user-profile-img" )
  end
end