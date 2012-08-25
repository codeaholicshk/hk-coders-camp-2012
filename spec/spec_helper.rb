PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Webrat::Methods
  config.include Webrat::Matchers

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  HkCodersCamp2012.tap { |app|  }
end

FactoryGirl.definition_file_paths = [
    File.join(Padrino.root, 'factories'),
    File.join(Padrino.root, 'test', 'factories'),
    File.join(Padrino.root, 'spec', 'factories')
]
FactoryGirl.find_definitions