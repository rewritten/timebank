require 'spec_helper'

describe "accounts/index.html.erb" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :type => "Type",
        :owner_name => "Owner Name",
        :account_type_id => "",
        :credit_limit => "9.99",
        :upper_credit_limit => "9.99",
        :member_id => "",
        :member_status => 1
      ),
      stub_model(Account,
        :type => "Type",
        :owner_name => "Owner Name",
        :account_type_id => "",
        :credit_limit => "9.99",
        :upper_credit_limit => "9.99",
        :member_id => "",
        :member_status => 1
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Owner Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
