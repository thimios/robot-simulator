require 'spec_helper'

describe Command do
  let(:command) { described_class.new(table: table, robot: robot) }

  let(:table) { instance_double(Table) }

  let(:robot) { instance_double(Robot) }

  describe "#execute" do
    it "raises exception" do
      expect{ command.execute }.to raise_error(NotImplementedError)
    end
  end
end
