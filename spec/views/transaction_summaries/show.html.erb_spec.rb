require 'spec_helper'

describe "transaction_summaries/show.html.erb" do
  before(:each) do
    @transaction_summary = assign(:transaction_summary, stub_model(TransactionSummary,
      :count => 1,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
