class Table
  attr_reader :x_range
  attr_reader :y_range

  def initialize(x_length: 5, y_length: 5)
    @x_range = Range.new(0, x_length - 1)
    @y_range = Range.new(0, y_length - 1)
  end

  def position_available?(x_position:, y_position:)
    x_range.cover?(x_position) && y_range.cover?(y_position)
  end
end
