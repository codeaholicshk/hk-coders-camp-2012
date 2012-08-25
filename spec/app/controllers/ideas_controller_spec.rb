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
  
  # describe "#new" do
    # before do
      # @account = FactoryGirl.create(:publisher)
    # end
#     
    # it "be success" do
      # get "/ideas/new"
      # last_response.status.should be(200)
    # end
  # end
#   
  # describe "#create" do
    # before do
      # @account = FactoryGirl.create(:publisher)
      # post "/ideas/", :idea => {:name => "A", :description => "B", :cool_things => ["C", "D", "E"]}
    # end
#     
    # it "be success" do
      # last_response.status.should be(200)
    # end
  # end  
 
end
