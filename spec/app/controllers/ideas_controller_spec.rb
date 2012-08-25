require 'spec_helper'
require 'webrat'

describe "IdeasController" do
  before do
    @idea = FactoryGirl.create(:idea)
  end
  
  describe "#index" do
    before do
      get "/ideas/"
    end
    
    it "be success" do
      last_response.status.should be(200)
    end
    
    it "renders idea name" do
      last_response.should have_selector("h2", :content => @idea.name)
    end
  end
end
