require 'spec_helper'

describe Robot do
  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Robot) }
  end

  describe "#place" do
    it "sets the robot x_position" do
      expect(subject).to receive(:x_position=).with(1)

      subject.place(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end

    it "sets the robot y_position" do
      expect(subject).to receive(:y_position=).with(2)

      subject.place(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end

    it "sets the robot orientation" do
      expect(subject).to receive(:orientation=).with(Robot::EAST)

      subject.place(x_position: 1, y_position: 2, orientation: Robot::EAST)
    end
  end

  describe "#robot_placed?" do
    it "calls #orientation on the robot" do
      expect(subject).to receive(:orientation)

      subject.placed?
    end

    it "returns true when #orentation exists" do
      subject.orientation = "anything"

      expect(subject.placed?).to eq(true)
    end

    it "returns false when #orentation doesn't exist" do
      subject.orientation = nil

      expect(subject.placed?).to eq(false)
    end
  end

  describe "#current_robot_position" do
    it "calls #position on the robot" do
      expect(subject).to receive(:position)

      subject.current_position
    end
  end

  describe "#next_robot_position" do
    before do
      subject.x_position = 1
      subject.y_position = 1
      subject.orientation = Robot::EAST
    end

    it "defaults to a move action" do
      expect(subject.next_position).to eq({
        x_position: 2,
        y_position: 1,
        orientation: Robot::EAST,
      })
    end

    it "returns the robots next table position for a move action" do
      expect(subject.next_position(:move)).to eq({
        x_position: 2,
        y_position: 1,
        orientation: Robot::EAST,
      })
    end

    it "returns the robots next table position for a left action" do
      expect(subject.next_position(:left)).to eq({
        x_position: 1,
        y_position: 1,
        orientation: Robot::NORTH,
      })
    end

    it "returns the robots next table position for a right action" do
      expect(subject.next_position(:right)).to eq({
        x_position: 1,
        y_position: 1,
        orientation: Robot::SOUTH,
      })
    end
  end

  describe "#position" do
    it "returns a hash representation of the robot position" do

      subject.x_position = 2
      subject.orientation = :south_west

      expect(subject.position).to eq({
        x_position: 2,
        y_position: nil,
        orientation: :south_west
      })
    end
  end

  describe "#range" do
    it "returns a hash for range correlating to orientation" do
      subject.orientation = Robot::NORTH

      expect(subject.range).to eq({ y_position: 1 })
    end

    it "returns nil if orientation is not set" do
      expect(subject.range).to eq(nil)
    end
  end
end
