require "forwardable"

class Pick
  include Comparable
  
  OPTIONS = [
    ROCK     = :rock,
    PAPER    = :paper,
    SCISSORS = :scissors
  ]
  
  attr_reader :sign
  
  def initialize(sign)
    raise ArgumentError unless OPTIONS.include? sign
    
    @sign = sign
  end
  
  def <=>(other)
    return 0 if other.sign == self.sign
    
    case sign
    when ROCK
      other.sign == PAPER ? -1 : 1
    when PAPER
      other.sign == SCISSORS ? -1 : 1
    when SCISSORS
      other.sign == ROCK ? -1 : 1
    end
  end
  
  module Signs
    extend Forwardable
    
    @🪨 = Pick.new(Pick::ROCK)
    @🧻 = Pick.new(Pick::PAPER)
    @✂️ = Pick.new(Pick::SCISSORS)
    
    class << self
      attr_reader :🪨, :🧻, :✂️
    end
    
    def_delegators "Pick::Signs", :🪨, :🧻, :✂️
  end
end
