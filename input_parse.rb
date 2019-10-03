# Input file needs to be parsed to call MarsRover class.
# Therefore, two static methods are provided here.

require_relative 'mars_rover'

class InputParse

  # morphing L,R,M into spin_left, spin_right, and move_forward
  def self.execute_directions(mars_rover, directions)
    directions.each do |direction|
      if direction == MarsRover::LEFT
        mars_rover.spin_left
      elsif direction == MarsRover::RIGHT
        mars_rover.spin_right
      elsif direction == MarsRover::MOVE
        mars_rover.move_forward
      end
    end
  end

  def self.parse_input
    File.open("input_file.txt", "r") do |f|

      # The first line of the input file is top right corner
      read_top_right_corner = f.readline.split(' ')
      if read_top_right_corner.length == 2
        MarsRover.initialize_top_right_corner(read_top_right_corner.first, read_top_right_corner.last)
      else
        p "Please provide top right corner coordinate in correct format"
      end

      # Collecting two consecutive lines from an input file
      f.each_line.with_index do |line|
        line = line.split(' ')
        if line.length == 3
          # The first line of two lines is Rover's position.
          # This line is used for initializing a MarsRover instance.
          mars_rover = MarsRover.new(line[0], line[1], line[2])

          # The second line is used for directions.
          directions = f.gets.strip.split('')
          InputParse.execute_directions(mars_rover, directions)

          # Printing final position of the rover in console
          mars_rover.print_current_position_of_rover

          # Writing final position of the rover in output.txt file
          File.open("output.txt", "a") { |f| f.write mars_rover.get_current_position_of_rover }
        end
      end
    end
  end
end

InputParse.parse_input