require 'pry'
class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount && @receiver.balance > @amount
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && self.valid?
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = 'reversed'
    end
  end

end
