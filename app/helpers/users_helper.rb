# Helper methods defined here can be accessed in any controller or view in the application

HkCodersCamp2012.helpers do

  def gravatar_tag(user, options={})
    size = options.delete(:size) || 40
    image_tag("https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}")
  end
end
