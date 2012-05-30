require 'mongoid/denormalize'

class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Denormalize

  field :balance, type: Integer, default: 0 # account balance in seconds
  field :last_update_balance, type: DateTime, default: nil
  field :label, type: String, default: ""
  field :type
  field :owner_name

  belongs_to :user
  denormalize :name, from: :user
  
  has_many :transactions_from, class_name: "Transaction", inverse_of: :source
  has_many :transactions_to, class_name: "Transaction", inverse_of: :destination

  def update_balance(options={})
    up_to = options[:up_to] || DateTime.now
    delta = [transactions_to, transactions_from].collect do |transactions|
      transactions.where(
        created_at: { :"$gt" => last_update_balance || 0, :"$lte" => up_to }
      ).map(&:amount).inject(0, :+)
    end.inject(:-)
    update_attributes last_update_balance: up_to, balance: balance + delta
  end
  
  def to_s
    user ? "User #{user}" : "Special #{label}"
  end

  def special?
    user.nil?
  end

end
