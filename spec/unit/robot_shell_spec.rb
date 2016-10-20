require 'spec_helper'

describe RobotShell do
  def command_double(command_class)
    command = double(:command, execute: true)
    expect(command_class).to receive(:new).and_return(command)
    expect(command).to receive(:execute)
  end

  describe '#report' do
    it "deligates to Commands::Report#execute" do
      command_double(Commands::Report)
      subject.report([])
    end
  end

  describe '#place' do
    it "deligates to Commands::Place#execute" do
      command_double(Commands::Place)
      subject.place([])
    end
  end

  describe '#right' do
    it "deligates to Commands::Right#execute" do
      command_double(Commands::Right)
      subject.right([])
    end
  end

  describe '#left' do
    it "deligates to Commands::Left#execute" do
      command_double(Commands::Left)
      subject.left([])
    end
  end

  describe '#move' do
    it "deligates to Commands::Move#execute" do
      command_double(Commands::Move)
      subject.move([])
    end
  end
end
