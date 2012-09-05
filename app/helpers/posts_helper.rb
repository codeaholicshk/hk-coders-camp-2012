# Helper methods defined here can be accessed in any controller or view in the application

HkCodersCamp2012.helpers do
  def markdown(text)
    flags = {hard_wrap: true, filter_html: true, autolink: true}
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, flags).render(text).html_safe
  end
  
  def truncate_words(passage, num_words)
    return if passage.nil?
    
    arr = passage.split(' ')
    arr.length <= num_words ? passage : "#{arr[0...num_words].join(' ')} ..."
  end
end
