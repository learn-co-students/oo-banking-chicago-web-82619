require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      sender.valid? && receiver.valid?
    end

    def nil?
      sender.nil?
    end

    def execute_transaction
      # binding.pry
      if valid? && sender.balance > amount && self.status == "pending" 
        @receiver.balance += @amount
        @sender.balance -= @amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
     end
      # binding.pry
    end

    def reverse_transfer
      if valid? && self.status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
      end
    end


end
