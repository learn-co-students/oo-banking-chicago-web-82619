class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def deposit(amt)
        @balance = @balance + amt 
    end

    def withdrawal(amt)
        @balance = @balance - amt
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        if (self.balance > 0 && self.status == "open")
            true
        else 
            false
        end
    end

    def close_account
        self.status = "closed"
    end

end
