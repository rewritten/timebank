require 'spec_helper'

describe "currencies/index.html.erb" do
  before(:each) do
    assign(:currencies, [
      stub_model(Currency,
        :name => "Name",
        :symbol => "Symbol",
        :pattern => "Pattern",
        :description => "MyText"
      ),
      stub_model(Currency,
        :name => "Name",
        :symbol => "Symbol",
        :pattern => "Pattern",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of currencies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pattern".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
