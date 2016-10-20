require 'spec_helper'

describe Commands::Null do
  let(:command) { described_class.new(robot: instance_double(Robot), table: instance_double(Table)) }

  describe "#execute" do
    subject(:execute) { command.execute }

    it { is_expected.to eq(nil) }
  end
end
