require "forwardable"

class Pick
  include Comparable
  
  OPTIONS = %i[rock paper scissors]
  
  attr_reader :sign
  
  def initialize(sign)
    raise ArgumentError unless OPTIONS.include? sign
    
    @sign = sign
  end
  
  def <=>(other)
    return 0 if other.sign == self.sign
    
    case sign
    when :rock
      other.sign == :paper ? -1 : 1
    when :paper
      other.sign == :scissors ? -1 : 1
    when :scissors
      other.sign == :rock ? -1 : 1
    end
  end
  
  module Signs
    extend Forwardable
    
    @🪨 = Pick.new(:rock)
    @🧻 = Pick.new(:paper)
    @✂️ = Pick.new(:scissors)
    
    class << self
      attr_reader :🪨, :🧻, :✂️
    end
    
    def_delegators "Pick::Signs", :🪨, :🧻, :✂️
  end
end
