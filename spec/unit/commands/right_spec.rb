require 'spec_helper'

describe Commands::Right do
  let(:command) { described_class.new(robot: robot, table: table) }
  let(:table) { instance_double(Table, position_available?: true) }
  let(:robot) { instance_double(Robot) }

  describe "#valid?" do
    subject { command.valid? }

    context "when the robot has been placed" do
      let(:robot) { instance_double(Robot, placed?: true) }

      it { is_expected.to eq(true) }
    end

    context "when the robot has not been placed" do
      let(:robot) { instance_double(Robot, placed?: false) }

      it { is_expected.to eq(false) }
    end
  end

  describe "#execute" do
    let(:robot) {
      instance_double(Robot, placed?: true, next_position: {})
    }

    let(:place_command) { instance_double(Commands::Place) }

    before { allow(Commands::Place).to receive(:new).and_return(place_command) }

    it "calls #execute on the next place command" do
      expect(place_command).to receive(:execute)

      command.execute
    end

    context "when robot is not placed" do
      let(:robot) { instance_double(Robot, placed?: false) }

      it "doesn't call #execute on the next place command" do
        expect(place_command).not_to receive(:execute)

        command.execute
      end
    end
  end
end
