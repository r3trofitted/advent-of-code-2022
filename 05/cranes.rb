module Cranes
  class CrateMover9000
    attr_reader :stacks
  
    def initialize(stacks)
      @stacks = StacksList.new(stacks)
    end
  
    def operate!(command_or_commands)
      Array(command_or_commands).each { |c| operate_command c }
    end
  
    private
  
    def operate_command(command)
      @stacks[command.to].unshift(*@stacks[command.from].shift(command.move).reverse)
    end
  end

  class CrateMover9001 < CrateMover9000
    private
  
    def operate_command(command)
      @stacks[command.to].unshift *@stacks[command.from].shift(command.move)
    end
  end

  class StacksList
    def initialize(stacks)
      @_stacks = stacks.map(&:clone)
    end
  
    def [](n)
      @_stacks[n-1]
    end
  
    def method_missing(name, *args, &b)
      @_stacks.send name, *args, &b
    end
  
    def respond_to_missing? name
      @_stacks.respond_to_missing?(name)
    end
  end
end