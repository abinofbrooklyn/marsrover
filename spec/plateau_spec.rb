require 'spec_helper'
require_relative '../plateau'
require_relative '../rover'

describe Plateau do

  @plateau = Plateau.new(5,5)

  it "should add a rover" do
    rover = Rover.new(1,1,"N")
    @plateau.add_rover(rover).as_null_object
    expect(@plateau.rovers).to include(rover)
  end

  it "should return true if rover is in bounds" do
    expect(@plateau.in_bounds?(1,3)).to be_true
  end

  it "should return false if object is not in bounds" do
    expect(@plateau.in_bounds?(1,7)).to be_false
    expect(@plateau.in_bounds?(6,6)).to be_false
  end
end
