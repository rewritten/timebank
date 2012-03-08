require 'spec_helper'

describe "accounts/edit.html.erb" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :type => "MyString",
      :owner_name => "MyString",
      :account_type_id => "",
      :credit_limit => "9.99",
      :upper_credit_limit => "9.99",
      :member_id => "",
      :member_status => 1
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accounts_path(@account), :method => "post" do
      assert_select "input#account_type", :name => "account[type]"
      assert_select "input#account_owner_name", :name => "account[owner_name]"
      assert_select "input#account_account_type_id", :name => "account[account_type_id]"
      assert_select "input#account_credit_limit", :name => "account[credit_limit]"
      assert_select "input#account_upper_credit_limit", :name => "account[upper_credit_limit]"
      assert_select "input#account_member_id", :name => "account[member_id]"
      assert_select "input#account_member_status", :name => "account[member_status]"
    end
  end
end
