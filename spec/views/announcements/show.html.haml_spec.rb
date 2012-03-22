require 'spec_helper'

describe "announcements/show" do
  before(:each) do
    @announcement = assign(:announcement, stub_model(Announcement))
  end

  it "renders attributes in <p>" do
    render
  end
end
