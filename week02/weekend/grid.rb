class GridBoard

  def initialize(rows,columns)
    @spaces = (0..(rows * columns)-1).to_a
    @size = (rows * columns) - 1
    @rows = rows
    @columns = columns
  end

  def spaces
    @spaces
  end

  def set_space(position, value)
    @spaces[position] = value
  end

  def space_value(position)
    @spaces[position]
  end

  def show
    show_top_bottom
    row_number = 0
    @rows.times do
      show_row(row_number)
      row_number += 1
      show_top_bottom
    end
  end

  private

  def show_row(row_number)
    column = 0
    to_put = ""
    @columns.times do
      space_position = column + (row_number * @columns)
      to_put += "| #{@spaces[space_position]} "
      column += 1
    end
    puts to_put + "|"
  end

  def show_top_bottom
    to_put = ""
    @columns.times do
      to_put += "----"
    end
    puts to_put + "-"
  end
end

