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
    case other.value
    when weaker_pick_value then 1
    when stronger_pick_value then -1
    else 0
    end
  end
  
  def weaker_pick
    Pick.new(weaker_pick_value)
  end
  
  def stronger_pick
    Pick.new(stronger_pick_value)
  end
  
  def same_pick
    Pick.new(value)
  end
  
  private
  
  def weaker_pick_value
    sorted_options.first
  end
  
  def stronger_pick_value
    sorted_options.last
  end
  
  def sorted_options
    OPTIONS.rotate(OPTIONS.index(value) - 1) # places the current value in the middle of the options list
  end
  
  module Emojis
    refine Kernel do
      def 🪨
        Pick.new(:rock)
      end
      
      def 🧻
        Pick.new(:paper)
      end
      
      def ✂️
        Pick.new(:scissors)
      end
    end
  end
end
