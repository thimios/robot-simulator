class Command

  def initialize(table:, robot:, arguments: [])
    @table = table
    @robot = robot
    @arguments = arguments
  end

  def execute
    raise NotImplementedError, "Commands must implement #execute"
  end
end
