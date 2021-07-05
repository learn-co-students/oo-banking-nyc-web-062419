class Transfer

  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  # your code here
  def initialize(sender,receiver,amount) 
    @sender = sender
    @amount =  amount
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? 
      true
    else 
      false
    end
  end

  def execute_transaction
    if self.valid? && @status == "pending" && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" 
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
