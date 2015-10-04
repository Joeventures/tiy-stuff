require 'minitest/autorun'
require './player'
require './grid'
require './tic-tac-toe'

class T3Test < Minitest::Test
  def test_grid_should_be_square_and_numbered
    grid = GridBoard.new(3,3)
    assert(grid.spaces.count, 9)
    i = 0
    grid.spaces.each do |n|
        assert(i == n, true)
        i += 1
    end
    grid.set_space(3,'x')
    assert(grid.space_value(3),'x')
  end

  def test_player_should_have_name
    player = Player.new("Mortimer")
    assert(player.name, "Mortimer")
  end

  def test_win
    #game = TicTacToe.new

  end
end