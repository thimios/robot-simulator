require 'command'

module Commands
  class Report < ::Command
    def execute
      return unless valid?

      puts @robot.current_position.values.join(",")
    end

    def valid?
      @robot.placed?
    end
  end
end
