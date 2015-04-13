require_relative 'plateau'

class Rover
  attr_accessor :plateau
  attr_reader :x_cord, :y_cord, :direction

  def initialize(x_cord, y_cord, direction)
    @x_cord = x_cord
    @y_cord = y_cord
    @direction = direction
  end

  def move_forward
   case @direction
    when "N" then @y_cord += 1
    when "S" then @y_cord -= 1
    when "E" then @x_cord += 1
    when "W" then @x_cord -= 1
   end
  end

  def turn_right
    @direction = case @direction
      when "N" then "E"
      when "E" then "S"
      when "S" then "W"
      when "W" then "N"
    end
  end

  def turn_left
   @direction = case @direction
      when "N" then "W"
      when "E" then "N"
      when "S" then "E"
      when "W" then "S"
    end
  end

  def moves(commands)
    commands.split(" ").each do |instruction|
      unless in_bounds?
        off_the_grid
        break
      end
      single_move(instruction)
    end
  end

  def in_bounds?
    plateau.in_bounds?(@x_cord, @y_cord)
  end

  def starting_position
    p "The rover's starting position is: #{self}"
  end

  def ending_position
    p "The rover's ending position is: #{self}"
  end

  def to_s
    "#{@x_cord} #{@y_cord} #{@direction}"
  end

  def off_the_grid
    p "Rover is off the grid"
  end

  private

  def single_move(instruction)
    case
      when instruction == "M" then move_forward
      when instruction == "R" then turn_right
      when instruction == "L" then turn_left
    end
  end

end
