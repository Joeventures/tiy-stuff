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
    count = 1
    until guess[0] == number
      if guess[0] > number
        result = "high"
        puts "#{guess[0]} is Too High!"
      else
        result = "low"
        puts "#{guess[0]} is Too Low!"
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
smart.play

binding.pry

#puts "just screwing around"