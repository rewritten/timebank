require 'spec_helper'

describe Transaction do
  before do
    Account.all.delete
    Transaction.all.delete
    User.all.delete
    @user_1 = User.create(email: "saverio@example.com", password: "qwerty", account: Account.create)
    @user_2 = User.create(email: "ana@example.com", password: "asdfgh", account: Account.create)
  end
  
  it "should update balances of related accounts" do
    t = Transaction.create(amount: 60, source: @user_2.account, destination: @user_1.account)
    c = t.created_at
    puts c
    @user_1.account.balance.should == -60
  end
end
