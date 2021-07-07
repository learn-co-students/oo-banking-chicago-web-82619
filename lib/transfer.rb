class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end
    
  def execute_transaction
    if @status != 'complete'
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      if !self.valid?
        rollback
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      else
        @status = 'complete'
      end
    end
  end

  def reverse_transfer
    if @status == 'complete'
      rollback
      @status = 'reversed'
    end
  end

  def rollback
    @sender.deposit(@amount)
    @receiver.withdraw(@amount)
  end
end
