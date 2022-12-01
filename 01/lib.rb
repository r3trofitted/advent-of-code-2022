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
end

class Elf
  attr_reader :calories_carried
  
  def initialize(calories_carried: [])
    @calories_carried = calories_carried
  end
end
