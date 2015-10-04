require 'pry'
require './grid'
require './player'

class TicTacToe
  def initialize( player1, player2 )
    @board = GridBoard.new(3,3)
    @player1 = player1
    @player2 = player2
    @player = @player1
    @wins = [[0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]]
  end

  def welcome
    puts "Would you like to play a game?"
    @board.show
  end

  def win?
    @wins.any? do |x, y, z|
      @board.space_value(x) == @board.space_value(y) && @board.space_value(y) == @board.space_value(z)
    end
  end

  def switch_player
    @player = @player == @player1 ? @player2 : @player1
  end

  def draw?
    spaces = @board.spaces
    @wins.all? do |x,y,z|
      #binding.pry
      [spaces[x],spaces[y],spaces[z]].include?('x') && [spaces[x],spaces[y],spaces[z]].include?('o')
    end
  end

  def game_over?
    win? || draw?
  end

  def available_spaces
    @board.spaces.reject { |x| x.is_a?(String) }
  end

  def play_game
    until game_over?
      @board.show
      choice = @player.play_move(available_spaces, @board.spaces)
      @board.set_space(choice, @player.name)
      switch_player
    end
    postmortem
  end

  def who_won?
    winner = nil
    @wins.each do |ary|
      if @board.space_value(ary[0]) == @board.space_value(ary[1]) && @board.space_value(ary[1]) == @board.space_value(ary[2])
        winner = @board.space_value(ary[0])
      end
    end
    binding.pry
    winner = "Nobody" if winner == nil
    winner
  end

  def postmortem
    @board.show
    puts who_won? + " wins!"
  end

end

player1 = Player.new("X")
player2 = Player.new("O")
game = TicTacToe.new(player1,player2)
game.play_game