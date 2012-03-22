require 'spec_helper'

describe "announcements/index" do
  before(:each) do
    assign(:announcements, [
      stub_model(Announcement),
      stub_model(Announcement)
    ])
  end

  it "renders a list of announcements" do
    render
  end
end
