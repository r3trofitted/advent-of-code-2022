class Stack
  def initialize(crates)
    @crates = crates.compact
  end
  
  def to_s
    @crates.join
  end
end
