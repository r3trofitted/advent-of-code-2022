class Pick
  include Comparable
  
  OPTIONS = %i[rock paper scissors]
  
  protected attr_reader :value
  
  def initialize(value)
    raise ArgumentError unless OPTIONS.include? value
    
    @value = value
  end
  
  def hash
    @value.hash
  end
  
  def eql?(other)
    @value.eql? other.value
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
  
  def weaker_pick
    case value
    when :rock     then Pick.new(:scissors)
    when :paper    then Pick.new(:rock)
    when :scissors then Pick.new(:paper)
    end
  end
  
  def stronger_pick
    case value
    when :rock     then Pick.new(:paper)
    when :paper    then Pick.new(:scissors)
    when :scissors then Pick.new(:rock)
    end
  end
  
  def same_pick
    self
  end
  
  module Emojis
    @🪨 = Pick.new(:rock)
    @🧻 = Pick.new(:paper)
    @✂️ = Pick.new(:scissors)
    
    refine Kernel do
      %w(🪨 🧻 ✂️).each do |p|
        define_method(p) { Emojis.instance_variable_get(:"@#{p}") }
      end
    end
  end
end
