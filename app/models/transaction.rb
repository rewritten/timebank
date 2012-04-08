require 'mongoid/denormalize'

class Transaction
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Denormalize
  include Mongoid::Timestamps::Created

  field :amount, type: Integer # amount of the stransaction in seconds.
  belongs_to :source, class_name: "Account", inverse_of: :transactions_from
  belongs_to :destination, class_name: "Account", inverse_of: :transactions_to
  belongs_to :announcement
  
  denormalize :user_name, from: :source
  denormalize :user_name, from: :destination
  denormalize :title, from: :announcement

  set_callback :update, :before do |document|
    document.deny_unless_admin
  end
  
  set_callback :create, :after do |document|
    document.update_accounts
  end
  
  def deny_unless_admin
    raise "you should be admin"
  end
  
  def update_accounts
    [source, destination].each do |account|
      account.update_balance(up_to: created_at) if account
    end
  end
  
end
