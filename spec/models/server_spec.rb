require 'spec_helper'

describe Server do

  before(:each) do
    @attr = {
      :name => "Example Server",
      :url => "http://example.server.com",
      :username => "user",
      :password => "pass"
    }
  end

  it "should create a new instance given a valid attribute" do
    Server.create!(@attr)
  end

end
