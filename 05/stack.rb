require "forwardable"

class Stack
  extend Forwardable
  def_delegators :@crates, :shift, :unshift, :[]
  
  def initialize(crates)
    @crates = crates.compact
  end
  
  def to_s
    @crates.join
  end
end
