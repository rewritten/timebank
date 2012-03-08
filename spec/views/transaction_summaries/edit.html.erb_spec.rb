require 'spec_helper'

describe "transaction_summaries/edit.html.erb" do
  before(:each) do
    @transaction_summary = assign(:transaction_summary, stub_model(TransactionSummary,
      :count => 1,
      :amount => "9.99"
    ))
  end

  it "renders the edit transaction_summary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transaction_summaries_path(@transaction_summary), :method => "post" do
      assert_select "input#transaction_summary_count", :name => "transaction_summary[count]"
      assert_select "input#transaction_summary_amount", :name => "transaction_summary[amount]"
    end
  end
end
