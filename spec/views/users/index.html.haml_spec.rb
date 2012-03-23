require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User),
      stub_model(User)
    ])
  end

  it "renders a list of users" do
    render
  end
end
