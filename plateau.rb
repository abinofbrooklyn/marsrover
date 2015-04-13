class Plateau
  attr_reader :x_cord_limit, :y_cord_limit, :rovers

  def initialize(x_cord_limit, y_cord_limit)
    @x_cord_limit = x_cord_limit
    @y_cord_limit = y_cord_limit
    @rovers = []
  end

  def add_rover(rover)
    @rovers << rover
    rover.plateau = self
  end

  def in_bounds?(first_pos, second_pos)
    first_pos <= x_cord_limit && second_pos <= y_cord_limit
  end
end
