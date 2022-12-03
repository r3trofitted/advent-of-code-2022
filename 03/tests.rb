require "minitest/autorun"
require_relative "rucksacks_sorter"

class RucksacksSorterTest < Minitest::Test
  def setup
    @data = <<~TXT
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    TXT
  end
  
  def test_misplaced_items_priorities_sum
    sorter = RucksacksSorter.from_data(@data)
    
    assert_equal 157, sorter.misplaced_items_priorities_sum
  end
  
  def test_misplaced_items_priorities
    sorter = RucksacksSorter.from_data(@data)
    
    assert_includes sorter.misplaced_items_priorities, 16 # p
    assert_includes sorter.misplaced_items_priorities, 38 # L
    assert_includes sorter.misplaced_items_priorities, 42 # P
    assert_includes sorter.misplaced_items_priorities, 22 # v
    assert_includes sorter.misplaced_items_priorities, 20 # t
    assert_includes sorter.misplaced_items_priorities, 19 # s
  end
end
