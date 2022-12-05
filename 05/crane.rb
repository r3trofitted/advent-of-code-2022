class Crane
  attr_reader :stacks
  
  def initialize(stacks)
    @stacks = stacks.unshift([]) # adding a blank stack so that we can the stacks index starts at 1

  end
  
  def operate!(command)
    @stacks[command.to].unshift(*@stacks[command.from].shift(command.move).reverse)
  end
end
