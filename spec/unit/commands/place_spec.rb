require 'spec_helper'

describe Commands::Place do
  let(:command) { described_class.new(table: table, robot: robot, arguments: arguments) }
  let(:table) { instance_double(Table, position_available?: true) }
  let(:robot) { instance_double(Robot) }
  let(:arguments) { ["1", "2", Robot::EAST] }

  describe "#valid?" do
    subject { command.valid? }

    context "with valid orientation and table position" do
      it { is_expected.to eq(true) }
    end

    context "with invalid table position" do
      let(:table) { instance_double(Table, position_available?: false) }

      it { is_expected.to eq(false) }
    end

    context "with invalid orientation" do
      let(:arguments) { ["1", "2", "WAYWARD"] }

      it { is_expected.to eq(false) }
    end

    context "with missing orientation" do
      let(:arguments) { ["1", "2"] }

      it { is_expected.to eq(false) }
    end

    context "with invalid table position argument" do
      let(:arguments) { ["bob", "2", Robot::EAST] }

      it { is_expected.to eq(false) }
    end

    context "with missing table position arguments" do
      let(:arguments) { [] }

      it { is_expected.to eq(false) }
    end
  end

  describe "#execute" do
    subject(:execute) { command.execute }

    it "calls #place_robot on simulation" do
      expect(robot).to receive(:place).with(
        x_position: 1,
        y_position: 2,
        orientation: Robot::EAST
      )

      execute
    end

    context "when the command is invalid" do
      let(:table) { instance_double(Table, position_available?: false) }

      it "doesn't call #place_robot on simulation" do
        expect(robot).not_to receive(:place)

        execute
      end
    end
  end
end
