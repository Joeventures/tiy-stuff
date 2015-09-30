class SmartPlayer
	def get_guess(last_result = 'low', last_guesses = [0,100] )
		#last_guesses = [most recent, next most recent]
		#binding.pry
		if last_guesses[1] == nil
			last_guesses[1] = 100 if last_result == 'low'
			last_guesses[1] = 0 if last_result == 'high'
		end
		#binding.pry
		if last_guesses[0] > last_guesses[1]
			mid = last_guesses[0] - last_guesses[1]
		elsif last_guesses[1] > last_guesses[0]
			mid = last_guesses[1] - last_guesses[0]
		else
			mid = 2
		end
		mid = mid / 2
		#( last_guesses[0] + last_guesses[1] ) / 2
		guess = last_guesses[0] + mid if last_result == 'low'
		guess = last_guesses[0] - mid if last_result == 'high'
		#guess = 50 if last_result == 'start'
		guess
	end
end