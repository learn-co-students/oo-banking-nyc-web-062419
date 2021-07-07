class Transfer
  attr_accessor :amount, :sender, :receiver, :status
  attr_reader
  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def self.all
      @@all
  end

  def valid?
    sender.valid? && receiver.valid?
  end 

  def execute_transaction
      if @status == "pending" 
        if sender.balance > amount && sender.valid?
          @sender.balance = @sender.balance - @amount
          @receiver.balance = @receiver.balance + @amount
          @status = 'complete'
      else
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if receiver.balance >= amount && valid? && status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'   
    else
      @status = 'rejected'
    end
  end
end
