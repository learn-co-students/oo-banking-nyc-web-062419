require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
    def initialize(sender, receiver, amount)
      @sender, @receiver, @status = sender, receiver, "pending"
      @amount = amount
    end

    def valid?
      if self.sender.valid?  && self.receiver.valid? && self.status == "pending"
        return true
      else
        return false
      end
    end 

      def execute_transaction 
       
        if self.status == "pending" && sender.balance >= @amount    
          @sender.balance -= @amount 
          @receiver.balance += @amount
          self.status = "complete"
          
        else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      end

      def reverse_transfer
        if self.status == "complete"
        @sender.balance += @amount 
        @receiver.balance -= @amount
        self.status = "reversed"
      end
    end

end
