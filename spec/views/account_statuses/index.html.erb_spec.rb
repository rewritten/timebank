require 'spec_helper'

describe "account_statuses/index.html.erb" do
  before(:each) do
    assign(:account_statuses, [
      stub_model(AccountStatus,
        :type => "Type",
        :account_id => "",
        :root_credits_id => "",
        :root_debits_id => nil,
        :nested_credits_id => nil,
        :nested_debit_id => nil,
        :pending_debits_id => nil,
        :reserved_scheduled_payments => nil,
        :credit_limit => "9.99",
        :upper_credit_limit => "9.99",
        :transfer_id => nil,
        :scheduled_payment_id => nil,
        :transfer_authorization_id => nil,
        :credit_limit_by_id => nil,
        :d_rate => "9.99",
        :rate_balance_correction => "9.99",
        :volume_account_fees => "9.99",
        :account_fee_log_id => ""
      ),
      stub_model(AccountStatus,
        :type => "Type",
        :account_id => "",
        :root_credits_id => "",
        :root_debits_id => nil,
        :nested_credits_id => nil,
        :nested_debit_id => nil,
        :pending_debits_id => nil,
        :reserved_scheduled_payments => nil,
        :credit_limit => "9.99",
        :upper_credit_limit => "9.99",
        :transfer_id => nil,
        :scheduled_payment_id => nil,
        :transfer_authorization_id => nil,
        :credit_limit_by_id => nil,
        :d_rate => "9.99",
        :rate_balance_correction => "9.99",
        :volume_account_fees => "9.99",
        :account_fee_log_id => ""
      )
    ])
  end

  it "renders a list of account_statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
