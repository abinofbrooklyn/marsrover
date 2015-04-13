require 'spec_helper'
require_relative '../rover'

describe Rover do

  it "should move one space forward" do
    rover = Rover.new(1,1, "N")
    expect { rover.move_forward }.to change { rover.y_cord }.from(1).to(2)
    expect { rover.move_forward }.not_to change{ rover.x_cord }
  end

  it "should change postion when rover turns right" do
    rover = Rover.new(1,1, "N")
    expect { rover.turn_right }.to change { rover.direction }.from("N").to("E")
  end

  it "should change position when rover turns left" do
    rover = Rover.new(1,1, "N")
    expect { rover.turn_left }.to change { rover.direction }.from("N").to ("W")
  end

  it "should recieve instruction and change coordinates accordingly" do
    rover = Rover.new(1,1, "N")
    rover.send(:single_move, "M")
    expect(rover.y_cord).to eq(2)
  end
end
