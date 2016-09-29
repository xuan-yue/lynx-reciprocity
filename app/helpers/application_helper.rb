module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Lynx"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def avatar_url(user)
	  if user.avatar_url.present?
	    user.avatar_url
	  else
	    default_url = "#{root_url}images/guest.png"
	    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
	    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
	  end
	end
end

