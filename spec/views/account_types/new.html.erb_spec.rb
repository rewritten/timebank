require 'spec_helper'

describe "account_types/new.html.erb" do
  before(:each) do
    assign(:account_type, stub_model(AccountType,
      :type => "MyString",
      :name => "MyString",
      :description => "MyText",
      :currency => ""
    ).as_new_record)
  end

  it "renders new account_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_types_path, :method => "post" do
      assert_select "input#account_type_type", :name => "account_type[type]"
      assert_select "input#account_type_name", :name => "account_type[name]"
      assert_select "textarea#account_type_description", :name => "account_type[description]"
      assert_select "input#account_type_currency", :name => "account_type[currency]"
    end
  end
end
