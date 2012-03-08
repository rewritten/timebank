require 'spec_helper'

describe "account_types/show.html.erb" do
  before(:each) do
    @account_type = assign(:account_type, stub_model(AccountType,
      :type => "Type",
      :name => "Name",
      :description => "MyText",
      :currency => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
