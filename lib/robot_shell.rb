require 'highline'
require 'cli-console'


class RobotShell
  extend CLI::Task

  attr_reader :console

  usage 'Usage: REPORT'
  desc 'Announce the X,Y and F of the robot on standard output.'
  def report(params)
    execute_command(Commands::Report, params)
  end

  usage 'Usage: PLACE X, Y, F'
  desc 'Put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner.'
  def place(params)
    execute_command(Commands::Place, params)
  end

  usage 'Usage: RIGHT'
  desc 'Rotate the robot 90 degrees right without changing its position.'
  def right(params)
    execute_command(Commands::Right, params)
  end

  usage 'Usage: LEFT'
  desc 'Rotate the robot 90 degrees left without changing its position.'
  def left(params)
    execute_command(Commands::Left, params)
  end

  usage 'Usage: MOVE'
  desc 'Move the toy robot one unit forward in the direction it is currently facing'
  def move(params)
    execute_command(Commands::Move, params)
  end

  def initialize(input: STDIN, output: STDOUT)
    io = HighLine.new(input, output)
    @console = CLI::Console.new(io)
    add_commands(console)
  end

  def start
    console.start("%s> ", [Time.now])
  end

  private

  def execute_command(command, params)
  end

  def table
  end

  def robot
  end

  def preprocess_params(params)
    params[0].to_s.split(',')
  end

  def add_commands(console)
    console.addCommand('report', method(:report), "Report on robot's position.")
    console.addCommand('place', method(:place), 'Put the robot on the table.')
    console.addCommand('right', method(:right), 'Rotate the robot 90 degrees right.')
    console.addCommand('left', method(:left), 'Rotate the robot 90 degrees left.')
    console.addCommand('move', method(:move), 'Move the robot one step forward.')
    console.addHelpCommand('help', 'Help')
    console.addExitCommand('exit', 'Exit from program')
    console.addAlias('quit', 'exit')
  end
end
