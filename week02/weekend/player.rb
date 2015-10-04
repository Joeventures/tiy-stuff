class Player
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def play_move(spaces, grid)
    puts "Choose a space."
    choice = gets.chomp.to_i
    until (spaces).include?(choice)
      puts "You need to choose an available space: "
      choice = gets.chomp.to_i
    end
    choice
  end
end