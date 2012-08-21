require 'spec_helper'

describe "Idea Model" do
  let(:idea) { Idea.new }
  it 'can be created' do
    idea.should_not be_nil
  end
end
