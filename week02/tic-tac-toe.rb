# The board is laid out as a simple array 0..8
#all_guesses is a hash: {"x"=>[1,2,3,4], "o"=>[5,6,7,8]}
WIN_SET = [
	[0,1,2], [3,4,5], [6,7,8],
	[0,3,6], [1,4,7], [2,5,8],
	[0,4,8], [2,4,6]
	]

def be_intelligent_or_something( all_guesses, available_spaces )
	available_spaces.each do |o|
		#for the win
		all_guesses['o'].push(o)
		return o + 1 if winning_set?(all_guesses['o'])
		all_guesses['o'].delete(o)
	end
	available_spaces.each do |x|
		#for the block
		all_guesses['x'].push(x)
		if winning_set?(all_guesses['x'])
			all_guesses['x'].delete(x)
			return x + 1
		else
			all_guesses['x'].delete(x)
		end
	end
	if all_guesses['x'].count == 2 && all_guesses['x'].any? {|x| [0,2,6,8].include?(x) }
		available_spaces = available_spaces - [1,3,5,7]
	elsif (2..3).to_a.include?all_guesses['x'].count
		available_spaces = available_spaces - [0,2,6,8]
	elsif all_guesses['x'].count == 1 && !available_spaces.include?(4)
		available_spaces = available_spaces - [1,3,5,7]
	end
	guess = available_spaces.sample + 1
	guess = 5 if available_spaces.include?(4)
	guess
end

def winning_set?( player_guesses )
	winner = false
	combos = player_guesses.sort.combination(3).to_a
	combos.each do |a|
		winner = true if WIN_SET.include?(a)
	end
	winner
end

def draw?( all_guesses )
	# Sorry, dude.
	grid = (0..8).to_a
	grid.map! do |g| 
		all_guesses['x'].include?(g) ? 'x' : g
	end
	grid.map! do |g| 
		all_guesses['o'].include?(g) ? 'o' : g
	end
	WIN_SET.all? do |x,y,z| 
		[grid[x],grid[y],grid[z]].include?('x') && [grid[x],grid[y],grid[z]].include?('o')
	end
end

def game_over? ( current_player, all_guesses )
	if winning_set?( all_guesses[current_player] )
		current_player
	elsif draw?( all_guesses )
		"Nobody"
	else
		false
	end
end

def show_grid( all_guesses )
	puts "\n" * 20
	space = Array.new
	available_spaces = Array.new
	(1..9).to_a.each do |n|
		space[n-1] = n.to_s
		space[n-1] = "x" if all_guesses["x"].include?(n-1)
		space[n-1] = "o" if all_guesses["o"].include?(n-1)
		available_spaces.push(n-1) if space[n-1] == n.to_s
	end
	puts "-------------"
	puts "| #{space[0]} | #{space[1]} | #{space[2]} |"
	puts "-------------"
	puts "| #{space[3]} | #{space[4]} | #{space[5]} |"
	puts "-------------"
	puts "| #{space[6]} | #{space[7]} | #{space[8]} |"
	puts "-------------"
	available_spaces
end

def take_turn( all_guesses, current_player, name)
	available_spaces = show_grid(all_guesses)
	puts "Player #{name}: Your turn."
	puts "Choose a square. Choose carefully!"
	if name == 'computer'
		guess = be_intelligent_or_something(all_guesses,available_spaces)
	else
		guess = gets.chomp.to_i
	end
	until (available_spaces).include?(guess-1)
		puts "That is not an available square. Please try again."
		guess = gets.chomp.to_i
	end
	guess = guess - 1
	all_guesses[current_player].push(guess)
end

def play_round(x_name, o_name)
	all_guesses = {'x' => [], 'o' => []}
	names = { 'x' => x_name, 'o' => o_name }
	current_player = 'o'
	until game_over?(current_player, all_guesses)
		if current_player == 'o'
			current_player = 'x'
		else
			current_player = 'o'
		end
		take_turn(all_guesses, current_player, names[current_player])
	end
	winner = game_over?(current_player, all_guesses)
	winner = names[winner] unless winner == "Nobody"
	show_grid(all_guesses)
	puts winner + " wins!"
end

def play_tic_tac_toe
	puts "You are about to play tic-tac-toe. Get ready!"
	sleep(1)
	puts "How many players? 1 or 2:"
	num_players = gets.chomp.to_i
	until (1..2).include?(num_players)
		puts "1 or 2 players?"
		num_players = gets.chomp.to_i
	end
	puts "Player x: What is your name?"
	x_name = gets.chomp
	if num_players == 1
		o_name = "computer"
	elsif num_players == 2
		puts "Player o: What is your name?"
		o_name = gets.chomp
	end
	if x_name == o_name
		x_name = "x" + x_name + "x"
		o_name = "o" + o_name + "o"
		puts "You both have the same name!"
		puts "To keep things simple, Player x will now be known as #{x_name}"
		puts "and Player o will now be known as #{o_name}. So there."
		puts "Press Enter to continue."
		gets
	end
	play_again = 'y'
	until play_again == 'n'
		play_round(x_name,o_name)
		sleep(1)
		puts "Great job! Play again? (y/n)"
		play_again = gets.chomp
	end
	puts "A strange game. The only winning move is not to play."
	puts "How about a nice game of chess?"
end

play_tic_tac_toe