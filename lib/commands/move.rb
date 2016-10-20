require 'command'

module Commands
  class Move < ::Command
    def execute
      return unless valid?

      place_command.execute
    end

    def valid?
      @robot.placed? && place_command.valid?
    end

    private

    def place_command
      @_place_command ||= Commands::Place.new(
        robot: @robot,
        table: @table,
        arguments: @robot.next_position(:move).values
      )
    end
  end
end
