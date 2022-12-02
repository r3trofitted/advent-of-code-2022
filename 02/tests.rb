require "minitest/autorun"

require_relative "strategy"
class StrategyTest < Minitest::Test
  def setup
    @data = <<~TXT
      A Y
      B X
      C Z
    TXT
  end
  
  def test_parsing_input_data
    strategy = Strategy.from_data(@data)
    
    assert_equal 3, strategy.rounds.count
  end
end
