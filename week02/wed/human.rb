class Human
	def initialize(name)
		@name = name
		@alertness = 0.05
		@coffee = nil
	end

	def alertness
		@alertness
	end

	def buy(coffee)
		@coffee = coffee
	end

	def drink!
		@coffee.amount = @coffee.amount - 0.33
		@alertness = @alertness + 0.3
	end

	def has_coffee?
		if @coffee == nil
			false
		elsif @coffee.amount == 0
			false
		else
			true
		end
			
	end

	def needs_coffee?
		@coffee == nil ? true : false
	end
end