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
  
  def test_parsing_rounds_data
    strategy = Strategy.new("A Y")
    round    = strategy.rounds.first
    
    assert_equal Pick::ROCK, round.opponent_pick
    assert_equal Pick::PAPER, round.player_pick
  end
end

require_relative "round"
class RoundTest < Minitest::Test
  def test_score_when_winning
    round = Round.new opponent_pick: Pick.new(Pick::ROCK), player_pick: Pick.new(Pick::PAPER)
    assert_equal 8, round.score
  end
  
  def test_score_when_losing
    round = Round.new opponent_pick: Pick.new(Pick::PAPER), player_pick: Pick.new(Pick::ROCK)
    assert_equal 1, round.score
  end
  
  def test_score_when_draw
    round = Round.new opponent_pick: Pick.new(Pick::SCISSORS), player_pick: Pick.new(Pick::SCISSORS)
    assert_equal 6, round.score
  end
end

require_relative "pick"
class PickTest < Minitest::Test
  def test_comparison
    assert Pick.new(Pick::ROCK) > Pick.new(Pick::SCISSORS)
    assert Pick.new(Pick::PAPER) > Pick.new(Pick::ROCK)
    assert Pick.new(Pick::SCISSORS) > Pick.new(Pick::PAPER)
  end
end
