HkCodersCamp2012.controllers :users do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end
  
  get :profile do
    content_type :text
    current_account.to_yaml
  end
  
  get :edit_profile do
    content_type :text
    current_account.to_yaml
  end 
  
  get :logout do
    set_current_account(nil)
    redirect url(:index)
  end
end
