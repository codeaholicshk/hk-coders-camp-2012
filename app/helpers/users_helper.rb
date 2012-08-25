# Helper methods defined here can be accessed in any controller or view in the application

HkCodersCamp2012.helpers do

  def gravatar_tag(user, options={})
    size = options.delete(:size) || 40
    image_tag("https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}", height: size, width: size)
  end
  
  def gravatar_span(user, options={})
    thumbnail_content = gravatar_tag(user, size: 210) + content_tag(:h3, link_to(user.name, user.github_page))
    content_tag(:div, thumbnail_content, class: :thumbnail)
  end
end
