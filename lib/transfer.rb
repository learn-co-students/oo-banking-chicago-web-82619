class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status != "pending" || !(self.valid?) || sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if status =="complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
