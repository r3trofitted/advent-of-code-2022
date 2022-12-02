require "minitest/autorun"

require_relative "strategy"
require_relative "pick"

using Pick::Emojis

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
  
  def test_parsing_rounds_data_when_aiming_for_a_draw
    strategy = Strategy.new("A Y")
    round    = strategy.rounds.first
    
    assert_equal 🪨, round.opponent_pick
    assert_equal 🪨, round.player_pick
  end
  
  def test_parsing_rounds_data_when_aiming_for_a_loss
    strategy = Strategy.new("B X")
    round    = strategy.rounds.first
    
    assert_equal 🧻, round.opponent_pick
    assert_equal 🪨, round.player_pick
  end
  
  def test_parsing_rounds_data_when_aiming_for_a_win
    strategy = Strategy.new("C Z")
    round    = strategy.rounds.first
    
    assert_equal ✂️, round.opponent_pick
    assert_equal 🪨, round.player_pick
  end
  
  def test_final_score
    strategy = Strategy.from_data(@data)
    
    assert_equal 15, strategy.final_score
  end
end

require_relative "round"
class RoundTest < Minitest::Test
  def test_score_when_winning
    round = Round.new opponent_pick: 🪨, player_pick: 🧻
    assert_equal 8, round.score
  end
  
  def test_score_when_losing
    round = Round.new opponent_pick: 🧻, player_pick: 🪨
    assert_equal 1, round.score
  end
  
  def test_score_when_draw
    round = Round.new opponent_pick: ✂️, player_pick: ✂️
    assert_equal 6, round.score
  end
end

class PickTest < Minitest::Test
  def test_comparison
    assert Pick.new(:rock) > Pick.new(:scissors)
    assert Pick.new(:paper) > Pick.new(:rock)
    assert Pick.new(:scissors) > Pick.new(:paper)
  end
end
