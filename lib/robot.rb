class Robot
  ORIENTATIONS = [
    NORTH = 'NORTH',
    EAST = 'EAST',
    SOUTH = 'SOUTH',
    WEST = 'WEST',
  ]

  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :orientation

  def position
    {
      x_position: x_position,
      y_position: y_position,
      orientation: orientation,
    }
  end

  def range
    case orientation
    when NORTH
      { y_position: 1 }
    when SOUTH
      { y_position: -1 }
    when WEST
      { x_position: -1 }
    when EAST
      { x_position: 1 }
    end
  end

  def place(x_position:, y_position:, orientation:)
    self.x_position = x_position
    self.y_position = y_position
    self.orientation = orientation
  end

  def placed?
    !!orientation
  end

  def current_position
    position
  end

  def next_position(action = :move)
    case action
    when :move
      current_position.merge(range) do |_, current_position, range|
        current_position + range
      end
    when :left
      current_position.merge(
        orientation: Robot::ORIENTATIONS[
          Robot::ORIENTATIONS.index(orientation) - 1
        ]
      )
    when :right
      current_position.merge(
        orientation: Robot::ORIENTATIONS[
          Robot::ORIENTATIONS.index(orientation) + 1
        ]
      )
    end
  end
end
