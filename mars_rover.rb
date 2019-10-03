# MarsRover class simulates three action of a Rover
# spin_left, spin_right, and move_forward. It is necessary
# to initialize the top right corner of the Plateau using
# the class method MarsRover.initialize_top_right_corner.
# Otherwise, it will use (10,10) coordinate.

class MarsRover
  attr_accessor :x_axis, :y_axis, :direction

  # Declaring constants, so that, these values can be changed easily in the future
  NORTH = 'N'
  SOUTH = 'S'
  EAST = 'E'
  WEST = 'W'
  LEFT = 'L'
  RIGHT = 'R'
  MOVE = 'M'

  DIRECTION_AFTER_SPINNING_LEFT = {}
  DIRECTION_AFTER_SPINNING_LEFT[NORTH] = WEST
  DIRECTION_AFTER_SPINNING_LEFT[WEST] = SOUTH
  DIRECTION_AFTER_SPINNING_LEFT[SOUTH] = EAST
  DIRECTION_AFTER_SPINNING_LEFT[EAST] = NORTH

  DIRECTION_AFTER_SPINNING_RIGHT = {}
  DIRECTION_AFTER_SPINNING_RIGHT[NORTH] = EAST
  DIRECTION_AFTER_SPINNING_RIGHT[EAST] = SOUTH
  DIRECTION_AFTER_SPINNING_RIGHT[SOUTH] = WEST
  DIRECTION_AFTER_SPINNING_RIGHT[WEST] = NORTH

  # Class/Static variables needed for all instances of MarsRover
  @@top_right_x_axis = 10
  @@top_right_y_axis = 10


  # Initializing Rover with the input.
  # However, if data is not provided then the Rover will start from (0,0) and facing NORTH(N) direction
  def initialize(x_axis = 0, y_axis = 0, direction = NORTH)
    @x_axis = x_axis.to_i
    @y_axis = y_axis.to_i
    @direction = direction
  end

  def spin_left
    @direction = DIRECTION_AFTER_SPINNING_LEFT[@direction]
    self
  end

  def spin_right
    @direction = DIRECTION_AFTER_SPINNING_RIGHT[@direction]
    self
  end

  def move_forward
    if @direction == NORTH && is_moving_possible?(@x_axis, @y_axis + 1)
      @y_axis += 1
    elsif @direction == EAST && is_moving_possible?(@x_axis + 1, @y_axis)
      @x_axis += 1
    elsif @direction == SOUTH && is_moving_possible?(@x_axis, @y_axis - 1)
      @y_axis -= 1
    elsif @direction == WEST && is_moving_possible?(@x_axis - 1, @y_axis)
      @x_axis -= 1
    else
      p "Rover Couldn't move at (#{@x_axis},#{y_axis}) and facing #{@direction}"
    end
    self
  end

  # Print current position of the Rover
  def print_current_position_of_rover
    p "Current position of Rover is at (#{@x_axis},#{y_axis}) and facing '#{@direction}'"
  end

  # generating current position for a file output
  def get_current_position_of_rover
    "#{@x_axis} #{@y_axis} #{@direction}\n"
  end

  # Initializing top right corner of the Plateau
  def self.initialize_top_right_corner(top_right_x_axis, top_right_y_axis)
    @@top_right_x_axis = top_right_x_axis.to_i
    @@top_right_y_axis = top_right_y_axis.to_i
  end

  private

  def is_moving_possible?(x_axis, y_axis)
    # Assuming Rover can't move beyond Plateau and Plateau's bottom left corner is (0,0) and
    # top right corner is (@@top_right_x_axis, @@top_right_y_axis).
    # Assuming Rover can't move to negative co-ordinate

    if (x_axis >= 0 and x_axis <= @@top_right_x_axis and y_axis >= 0 and y_axis <= @@top_right_y_axis)
      return true;
    else
      return false;
    end
  end
end

# MarsRover.initialize_top_right_corner(10, 10)
# a = MarsRover.new(5, 6, 'N')
# a.print_current_position_of_rover
# a.spin_left.move_forward.move_forward.spin_left.move_forward
# a.print_current_position_of_rover
# b = MarsRover.new()
# b.spin_left.move_forward.move_forward.spin_left.move_forward
# b.print_current_position_of_rover