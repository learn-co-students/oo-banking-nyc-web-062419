class Transfer
  
	attr_accessor :sender, :receiver, :amount, :status

	def initialize(sender, receiver, amount)
		@status = "pending"
		@sender = sender
		@receiver = receiver
		@amount = amount
	end

	def valid?
		if sender.valid? && receiver.valid?
			true
		else 
			false
		end
	end

	def execute_transaction
		if @status == "pending"
			if sender.balance >= amount
				sender.balance -= amount
				receiver.balance += amount
				else
				"Transaction rejected. Please check your account balance."
			end
		end
		@status = "complete"
	end

end
