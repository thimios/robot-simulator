require 'command'

module Commands
  class Right < ::Command
    def execute
      return unless valid?

      place_command.execute
    end

    def valid?
      @robot.placed?
    end

    private

    def place_command
      @_place_command ||= Commands::Place.new(
        robot: @robot,
        table: @table,
        arguments: @robot.next_position(:right).values
      )
    end
  end
end
