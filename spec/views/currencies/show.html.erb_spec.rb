require 'spec_helper'

describe "currencies/show.html.erb" do
  before(:each) do
    @currency = assign(:currency, stub_model(Currency,
      :name => "Name",
      :symbol => "Symbol",
      :pattern => "Pattern",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Symbol/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pattern/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
