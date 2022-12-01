require "minitest/autorun"
require_relative "lib"

class InventoryTest < Minitest::Test
  def setup
    @data = <<~TXT
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    TXT
  end
  
  def test_creating_an_inventory_with_initial_data
    inventory = Inventory.from_data @data
        
    assert_equal 5, inventory.elves.count
    
    elf = inventory.elves.first
    
    assert_includes elf.calories_carried, 1000
    assert_includes elf.calories_carried, 2000
    assert_includes elf.calories_carried, 3000
  end
  
  def test_fetching_the_elf_with_the_most_calories
    inventory = Inventory.from_data @data
    
    elf = inventory.elf_with_the_most_calories
    
    assert_includes elf.calories_carried, 7000
    assert_includes elf.calories_carried, 8000
    assert_includes elf.calories_carried, 9000
  end
  
  def test_fetching_any_number_of_elves_with_the_most_calories
    inventory = Inventory.from_data @data
    
    elves = inventory.elves_with_the_most_calories(3)
    
    first, second, third = elves
    assert_equal 24000, first.total_calories_carried
    assert_equal 11000, second.total_calories_carried
    assert_equal 10000, third.total_calories_carried
  end
end

class ElfTest < Minitest::Test
  def test_total_calories_carried
    elf = Elf.new calories_carried: %w(1000 2000 3000)
    assert_equal 6000, elf.total_calories_carried
  end
  
  def test_total_calories_carried_when_nothing_carried
    assert_equal 0, Elf.new.total_calories_carried
  end
end
