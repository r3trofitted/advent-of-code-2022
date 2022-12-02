require "forwardable"

class Pick
  include Comparable
  
  OPTIONS = %i[rock paper scissors]
  
  protected attr_reader :value
  
  def initialize(value)
    raise ArgumentError unless OPTIONS.include? value
    
    @value = value
  end
  
  def <=>(other)
    return 0 if other.value == self.value
    
    case value
    when :rock
      other.value == :paper ? -1 : 1
    when :paper
      other.value == :scissors ? -1 : 1
    when :scissors
      other.value == :rock ? -1 : 1
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
