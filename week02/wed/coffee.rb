class Coffee
	def initialize(drink_name)
		@drink_name = drink_name
		@drink_amount = 1.0
	end

	def full?
		@drink_amount < 1.0 ? false : true
	end

	def empty?
		@drink_amount < 0.1 ? true : false
	end

	def amount
		@drink_amount
	end

	def amount=(amount)
		@drink_amount = amount
	end

end