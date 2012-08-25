require 'spec_helper'

describe Account do
  before do
    @account = FactoryGirl.create(:publisher)
  end

  context "attributes" do
    subject {@account}
    it {should_not be_nil }
  end

  context "ideas relation" do
    before do
      @idea = FactoryGirl.create(:idea, :published_by_account => @account)
    end
    specify { @account.published_ideas.should_not be_empty }
  end
end
