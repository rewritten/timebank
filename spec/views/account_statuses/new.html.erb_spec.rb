require 'spec_helper'

describe "account_statuses/new.html.erb" do
  before(:each) do
    assign(:account_status, stub_model(AccountStatus,
      :type => "MyString",
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
    ).as_new_record)
  end

  it "renders new account_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_statuses_path, :method => "post" do
      assert_select "input#account_status_type", :name => "account_status[type]"
      assert_select "input#account_status_account_id", :name => "account_status[account_id]"
      assert_select "input#account_status_root_credits_id", :name => "account_status[root_credits_id]"
      assert_select "input#account_status_root_debits_id", :name => "account_status[root_debits_id]"
      assert_select "input#account_status_nested_credits_id", :name => "account_status[nested_credits_id]"
      assert_select "input#account_status_nested_debit_id", :name => "account_status[nested_debit_id]"
      assert_select "input#account_status_pending_debits_id", :name => "account_status[pending_debits_id]"
      assert_select "input#account_status_reserved_scheduled_payments", :name => "account_status[reserved_scheduled_payments]"
      assert_select "input#account_status_credit_limit", :name => "account_status[credit_limit]"
      assert_select "input#account_status_upper_credit_limit", :name => "account_status[upper_credit_limit]"
      assert_select "input#account_status_transfer_id", :name => "account_status[transfer_id]"
      assert_select "input#account_status_scheduled_payment_id", :name => "account_status[scheduled_payment_id]"
      assert_select "input#account_status_transfer_authorization_id", :name => "account_status[transfer_authorization_id]"
      assert_select "input#account_status_credit_limit_by_id", :name => "account_status[credit_limit_by_id]"
      assert_select "input#account_status_d_rate", :name => "account_status[d_rate]"
      assert_select "input#account_status_rate_balance_correction", :name => "account_status[rate_balance_correction]"
      assert_select "input#account_status_volume_account_fees", :name => "account_status[volume_account_fees]"
      assert_select "input#account_status_account_fee_log_id", :name => "account_status[account_fee_log_id]"
    end
  end
end
