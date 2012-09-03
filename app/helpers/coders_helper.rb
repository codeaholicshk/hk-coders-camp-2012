# Helper methods defined here can be accessed in any controller or view in the application

HkCodersCamp2012.helpers do
  def register_path
    '/auth/github'
  end
  
  def gravatar_link_to(coder)
    link_content = coder.name || coder.login || coder.github_page.match(/https:\/\/github\.com\/(.*)/)[1]
    link_to link_content, coder.github_page
  end
end
