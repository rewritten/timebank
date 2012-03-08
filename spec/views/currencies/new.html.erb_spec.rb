require 'spec_helper'

describe "currencies/new.html.erb" do
  before(:each) do
    assign(:currency, stub_model(Currency,
      :name => "MyString",
      :symbol => "MyString",
      :pattern => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new currency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => currencies_path, :method => "post" do
      assert_select "input#currency_name", :name => "currency[name]"
      assert_select "input#currency_symbol", :name => "currency[symbol]"
      assert_select "input#currency_pattern", :name => "currency[pattern]"
      assert_select "textarea#currency_description", :name => "currency[description]"
    end
  end
end
