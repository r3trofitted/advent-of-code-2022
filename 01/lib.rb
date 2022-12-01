class Inventory
  attr_reader :elves
  
  def initialize(data)
    parse_data data
  end
  
  private
  
  def parse_data(data)
    @elves = data
               .chomp!
               .split(/\n{2}/)
               .map(&:split)
               .map { |cc| Elf.new(calories_carried: cc) }
  end
end

class Elf
  def initialize(calories_carried: [])
    @calories_carried = calories_carried
  end
end
