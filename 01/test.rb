require "minitest/autorun"
require_relative "lib"

class InventoryTest < Minitest::Test
  def setup
    @inventory = Inventory.new <<~TXT
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
  
  def test_elves_separate_their_own_inventories
    assert_equal 5, @inventory.elves.count
  end
end
