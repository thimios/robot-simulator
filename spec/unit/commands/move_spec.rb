require 'spec_helper'

describe Commands::Move do
  let(:command) { described_class.new(robot: robot, table: table) }
  let(:robot) { instance_double(Robot, placed?: true) }
  let(:table) { instance_double(Table) }

  describe "#valid?" do
    subject { command.valid? }

    before { allow(Commands::Place).to receive(:new).and_return(place_command) }

    context "when the robot has been placed and next place command is valid" do
      let(:robot) {
        instance_double(Robot, placed?: true, next_position: {})
      }

      let(:place_command) { instance_double(Commands::Place, valid?: true) }

      it { is_expected.to eq(true) }
    end

    context "when the robot has not been placed" do
      let(:robot) { instance_double(Robot, placed?: false) }
      let(:place_command) { instance_double(Commands::Place) }

      it { is_expected.to eq(false) }
    end

    context "when the next place command is not valid" do
      let(:robot) {
        instance_double(Robot, placed?: true, next_position: {})
      }

      let(:place_command) { instance_double(Commands::Place, valid?: false) }

      it { is_expected.to eq(false) }
    end
  end

  describe "#execute" do
    let(:robot) {
      instance_double(Robot, placed?: true, next_position: {})
    }

    let(:place_command) { instance_double(Commands::Place, valid?: true) }

    before { allow(Commands::Place).to receive(:new).and_return(place_command) }

    it "calls #execute on the next place command" do
      expect(place_command).to receive(:execute)

      command.execute
    end

    context "when the next place command is invalid" do
      let(:place_command) { instance_double(Commands::Place, valid?: false) }

      it "doesn't call #execute on the next place command" do
        expect(place_command).not_to receive(:execute)

        command.execute
      end
    end
  end
end
