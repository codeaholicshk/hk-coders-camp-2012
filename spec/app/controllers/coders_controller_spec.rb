require 'spec_helper'

describe "CodersController" do
  before do
    get "/"
  end

  it "returns hello world" do
    last_response.status.should be(200)
  end
end
