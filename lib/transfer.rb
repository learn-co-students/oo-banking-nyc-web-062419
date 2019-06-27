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
			if sender.valid? && sender.balance >= amount
				sender.balance -= amount
				receiver.balance += amount
				@status = "complete"
				else
				@status = "rejected"
				"Transaction rejected. Please check your account balance."
			end
		end
	end

	def reverse_transfer
		if @status == "complete"
			if receiver.valid? && receiver.balance >= amount
				receiver.balance -= amount
				sender.balance += amount
				@status = "reversed"
			else
				@status = "rejected"
			end
		end
	end

end
