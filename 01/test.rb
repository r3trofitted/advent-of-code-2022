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
    
    assert_includes elf.calories_carried, "1000"
    assert_includes elf.calories_carried, "2000"
    assert_includes elf.calories_carried, "3000"
  end
  
  def test_fetching_the_elf_with_the_most_calories
    inventory = Inventory.from_data @data
    
    elf = inventory.elf_with_the_most_calories
    
    assert_includes elf.calories_carried, "7000"
    assert_includes elf.calories_carried, "8000"
    assert_includes elf.calories_carried, "9000"
  end
end
