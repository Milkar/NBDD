require 'spec_helper'

describe "/main/home" do
  before(:each) do
    render 'main/home'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/main/home])
  end
end
