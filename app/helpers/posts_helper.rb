# Helper methods defined here can be accessed in any controller or view in the application

HkCodersCamp2012.helpers do
  def markdown(text)
    flags = {hard_wrap: true, filter_html: true, autolink: true}
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, flags).render(text).html_safe
  end
end
