require_relative "pick"

class Round
  PICKS_SCORES = {
    Pick::ROCK     => 1,
    Pick::PAPER    => 2,
    Pick::SCISSORS => 3
  }
  
  attr_reader :opponent_pick, :player_pick
  
  def initialize(opponent_pick:, player_pick:)
    @opponent_pick, @player_pick = opponent_pick, player_pick
  end
  
  def score
    PICKS_SCORES.fetch(@player_pick.sign) + outcome_score
  end
  
  def outcome_score
    case @player_pick <=> @opponent_pick
    when  1 then 6 # victory
    when  0 then 3 # draw
    when -1 then 0 # defeat
    end
  end
end
