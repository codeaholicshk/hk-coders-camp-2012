# encoding: utf-8
# Helper methods defined here can be accessed in any controller or view in the application

ALL_LOCALE = {:en => "English", :zh => "繁體中文"}.freeze

HkCodersCamp2012.helpers do
  def gravatar_tag(user, options={})
    size = options.delete(:size) || 40
    image_tag("https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}&d=retro", height: size, width: size)
  end

  def gravatar_span(user, options={})
    size = options[:size] || 210
    thumbnail_content = gravatar_tag(user, size: size) + content_tag(:h3, link_to(user.name, user.github_page))
    content_tag(:div, thumbnail_content, class: :thumbnail)
  end

  def gravatar_thumbnail(user, options={})
    thumbnail_content = link_to(gravatar_tag(user), user.github_page)
    content_tag(:div, thumbnail_content, class: :thumbnail)
  end

  def locale_name
    ALL_LOCALE[I18n.locale]
  end
end
