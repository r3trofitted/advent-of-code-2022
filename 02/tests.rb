require "minitest/autorun"

require_relative "strategy"
require_relative "round"

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
  
  def test_parsing_rounds_data
    strategy = Strategy.new("A Y")
    round    = strategy.rounds.first
    
    assert_equal Round::ROCK, round.opponent_pick
    assert_equal Round::PAPER, round.player_pick
  end
end
