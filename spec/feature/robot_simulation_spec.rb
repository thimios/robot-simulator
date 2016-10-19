require 'spec_helper'

describe RobotSimulator do
  
  def run(command)  
  end

  def expect_report_output(output)
    expect { run('REPORT') }.to output("#{output}\n").to_stdout
  end

  it 'runs the first required scenario' do
    run 'PLACE 0,0,NORTH'
    run 'MOVE'

    expect_report_output('0,1,NORTH')
  end

  it 'runs the second required scenario' do
    run 'PLACE 0,0,NORTH'
    run 'LEFT'

    expect_report_output('0,0,WEST')
  end

  it 'runs the third required scenario' do
    run 'PLACE 1,2,EAST'
    run 'MOVE'
    run 'MOVE'
    run 'LEFT'
    run 'MOVE'

    expect_report_output('3,3,NORTH')
  end
end
