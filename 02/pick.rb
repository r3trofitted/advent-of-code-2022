class Pick
  include Comparable
  
  ROCK     = :🪨
  PAPER    = :🧻
  SCISSORS = :✂️
  
  attr_reader :sign
  
  def initialize(sign)
    raise ArgumentError unless [ROCK, PAPER, SCISSORS].include? sign
    
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
end
