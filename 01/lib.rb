class Inventory
  attr_reader :elves
  
  def self.from_data(data)
    elves = data
             .chomp!
             .split(/\n{2}/)
             .map(&:split)
             .map { |cc| Elf.new(calories_carried: cc) }
    
    new(elves)
  end
  
  def initialize(elves = [])
    @elves = elves
  end
  
  def elf_with_the_most_calories
    @elves.max_by(&:total_calories_carried)
  end
  
  def elves_with_the_most_calories(n)
    @elves.sort_by(&:total_calories_carried).reverse.first(n)
  end
end

class Elf
  attr_reader :calories_carried
  
  def initialize(calories_carried: [])
    @calories_carried = calories_carried.map(&:to_i)
  end
  
  def total_calories_carried
    @calories_carried.inject(:+) || 0
  end
end
