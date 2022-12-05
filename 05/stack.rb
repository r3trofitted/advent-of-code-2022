require "forwardable"

class Stack
  extend Forwardable
  def_delegators :@crates, :shift, :unshift, :[]
  
  def initialize(crates)
    @crates = crates.compact
  end
  
  def clone
    Stack.new(@crates.dup)
  end
  
  def to_s
    @crates.join
  end
  
  def top
    @crates.first
  end
end
