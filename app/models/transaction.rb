require 'mongoid/denormalize'

class Transaction
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Denormalize
  include Mongoid::Timestamps::Created

  field :amount, type: Integer # amount of the stransaction in seconds.
  field :confirmed, type: Boolean
  belongs_to :source, class_name: "Account", inverse_of: :transactions_from
  belongs_to :destination, class_name: "Account", inverse_of: :transactions_to
  belongs_to :announcement

  denormalize :user_name, from: :source
  denormalize :user_name, from: :destination
  denormalize :title, from: :announcement

  after_create :update_accounts

  def update_accounts
    [source, destination].each do |account|
      account.update_balance if account
    end
  end

end
