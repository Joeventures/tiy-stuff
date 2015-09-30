require "pry"
require "./human"
require "./random"
require "./counting"
require "./smart"

class GuessingGame
  def initialize(player)
    @player = player
  end

  def play
    guess = Array.new
    number = rand(1..100)
    guess[0] = @player.get_guess()
    guess[1] = 0
    count = 1
    until guess[0] == number
      diff1 = number - guess[0] > 0 ? number - guess[0] : guess[0] - number
      diff2 = number - guess[1] > 0 ? number - guess[1] : guess[1] - number
      if diff2 > diff1
        result = "warmer"
        puts "#{guess[0]} is closer than #{guess[1]}. Warmer!"
      else
        result = "colder"
        puts "#{guess[0]} is further than #{guess[1]}. Colder!"
      end
      #binding.pry
      new_guess = @player.get_guess(result, guess)
      guess[1] = guess[0]
      guess[0] = new_guess
      count += 1
    end
    puts "You win! Took #{count} tries. The number was #{number}."
  end
end

game = GuessingGame.new(CountingPlayer.new)
smart = GuessingGame.new(SmartPlayer.new)
#smart.play

binding.pry

#puts "just screwing around"