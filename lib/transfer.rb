class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize (sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending"
      self.sender.balance -= self.amount
      if self.sender.valid?
        self.status = "complete"
        self.receiver.balance += self.amount
      else
        self.status = "rejected"
        self.sender.balance += self.amount
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
    end
  end

end
