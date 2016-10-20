require 'spec_helper'

describe Command do
  let(:command) { described_class.new(table: table, robot: robot) }

  let(:table) { instance_double(Table) }

  let(:robot) { instance_double(Robot) }

  describe "#execute" do
    it "raises a exeception so subclasses must implement method" do
      expect{ command.execute }.to raise_error(Command::NotImplementedError)
    end
  end
end
