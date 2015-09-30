class SmartPlayer
	def get_guess(last_result = 'colder', last_guesses = [0,100] )
		#last_guesses = [most recent, next most recent]
		#binding.pry
		if last_guesses[0] > last_guesses[1] && last_result == 'warmer'
			mid = (last_guesses[0] - last_guesses[1]) / 2
			guess = last_guesses[0] + mid
		elsif last_guesses[0] > last_guesses[1] && last_result == 'colder'
			mid = (last_guesses[0] - last_guesses[1]) / 2
			guess = last_guesses[0] - mid
		elsif last_guesses[1] > last_guesses[0] && last_result == 'warmer'
			mid = ( last_guesses[1] - last_guesses[0] ) / 2
			guess = last_guesses[0] - mid
		elsif last_guesses[1] > last_guesses[0] && last_result == 'colder'
			mid = ( last_guesses[1] - last_guesses[0] ) / 2
			guess = last_guesses[0] + mid
		else
			guess = rand(1..100)
		end
		#binding.pry
		#mid = mid / 2
		#( last_guesses[0] + last_guesses[1] ) / 2
		#guess = last_guesses[0] + mid if last_result == 'low'
		#guess = last_guesses[0] - mid if last_result == 'high'
		#guess = 50 if last_result == 'start'
		guess
	end
end