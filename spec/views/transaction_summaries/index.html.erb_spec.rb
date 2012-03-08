require 'spec_helper'

describe "transaction_summaries/index.html.erb" do
  before(:each) do
    assign(:transaction_summaries, [
      stub_model(TransactionSummary,
        :count => 1,
        :amount => "9.99"
      ),
      stub_model(TransactionSummary,
        :count => 1,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of transaction_summaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
