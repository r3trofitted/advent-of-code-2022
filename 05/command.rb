class Command
  attr_reader :move, :from, :to
  
  def initialize(move:, from:, to:)
    @move, @from, @to = move.to_i, from.to_i, to.to_i
  end
  
  def ==(other)
    if other.is_a? Command
      other.move == @move && other.from == @from && other.to == @to
    else
      super
    end
  end
end
