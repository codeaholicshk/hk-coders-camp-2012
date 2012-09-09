 if ENV["RACK_ENV"] == 'development'
  require 'rack-mini-profiler'
end

class HkCodersCamp2012 < Padrino::Application
  use Rack::MiniProfiler if ENV["RACK_ENV"] == 'development' 
  register SassInitializer
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Admin::AccessControl
  register Padrino::Localization::Urls  

  enable :sessions

  # set :login_page, "/users/" # determines the url login occurs
#
  # access_control.roles_for :any do |role|
    # role.protect "/profile"
    # role.protect "/admin" # here a demo path
  # end
#
  # # now we add a role for users
  # access_control.roles_for :users do |role|
    # role.allow "/profile"
  # end

  ##
  # Caching support
  #
  # register Padrino::Cache
  # enable :caching
  #
  # You can customize caching store engines:
  #
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', exception_retry_limit: 1))
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', exception_retry_limit: 1))
  #   set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(host: '127.0.0.1', port: 6379, db: 0))
  #   set :cache, Padrino::Cache::Store::Memory.new(50)
  #   set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
  #

  ##
  # Application configuration options
  #
  # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
  # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
  # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
  # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
  # set :public_folder, "foo/bar" # Location for static assets (default root/public)
  # set :reload, false            # Reload application files (default in development)
  # set :default_builder, "foo"   # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"       # Set path for I18n translations (default your_app/locales)
  # disable :sessions             # Disabled sessions by default (enable if needed)
  # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
  # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #
  #   error 505 do
  #     render 'errors/505'
  #   end
  #

  use OmniAuth::Builder do
    if ENV["RACK_ENV"] == 'production'
      provider :github, '55122c136440e77227e1', 'd8a221c4b83dc6f6c0aa3127818370d28225d57f', skip_info: true
    else
      provider :github, 'f6d7ac6b72039e469c32', '95dce884b45bd3aec4ce6bb29fa923c8b25477e0', {skip_info: true, :client_options => {:ssl => {:verify => false}}}      
    end
  end

  get :auth, map: '/auth/:provider/callback' do
    auth    = request.env["omniauth.auth"]
    existing_account = Account.where(provider: auth["provider"]).where(uid: auth["uid"]).first
    
    account = if existing_account
      existing_account.update_attributes(:login => auth["extra"]["raw_info"]["login"])
      existing_account
    else
      Account.create_with_omniauth(auth)
    end
   
    set_current_account(account)

    redirect url("coders")
  end

  get :index do
    render 'home'
  end
  
  get '/sitemap.xml' do 
    map = XmlSitemap::Map.new('camp.codeaholics.hk') do |m|
      ['', '/zh'].each do |locale_path|
        m.add "#{locale_path}/ideas", :period => :daily, :priority => 0.8
        m.add "#{locale_path}/coders", :period => :daily, :priority => 0.8
        # Post.all.each do |post|
          # m.add url(:posts, :show, id: post.id), :updated => post.created_at, :period => :weekly        
        # end
        Post.all.each do |idea|
          m.add "#{locale_path}/posts/#{idea.id}", :updated => idea.created_at, :period => :weekly     
        end
        Idea.all.each do |idea|
          m.add "#{locale_path}/ideas/#{idea.id}", :updated => idea.created_at, :period => :weekly     
        end
      end
    end
 
    headers['Content-Type'] = 'text/xml'
    map.render
  end
end
