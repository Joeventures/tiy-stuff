class CountingPlayer
  def initialize
    @count = 0
  end

  def get_guess(a = '', b = '')
    @count += 1
  end
end