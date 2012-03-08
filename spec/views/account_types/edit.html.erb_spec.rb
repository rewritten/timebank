require 'spec_helper'

describe "account_types/edit.html.erb" do
  before(:each) do
    @account_type = assign(:account_type, stub_model(AccountType,
      :type => "MyString",
      :name => "MyString",
      :description => "MyText",
      :currency => ""
    ))
  end

  it "renders the edit account_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_types_path(@account_type), :method => "post" do
      assert_select "input#account_type_type", :name => "account_type[type]"
      assert_select "input#account_type_name", :name => "account_type[name]"
      assert_select "textarea#account_type_description", :name => "account_type[description]"
      assert_select "input#account_type_currency", :name => "account_type[currency]"
    end
  end
end
