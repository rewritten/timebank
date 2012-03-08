require 'spec_helper'

describe "account_types/index.html.erb" do
  before(:each) do
    assign(:account_types, [
      stub_model(AccountType,
        :type => "Type",
        :name => "Name",
        :description => "MyText",
        :currency => ""
      ),
      stub_model(AccountType,
        :type => "Type",
        :name => "Name",
        :description => "MyText",
        :currency => ""
      )
    ])
  end

  it "renders a list of account_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
