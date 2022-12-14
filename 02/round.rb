require_relative "pick"
using Pick::Emojis

class Round
  PICKS_SCORES = { 🪨 => 1, 🧻 => 2, ✂️ => 3 }
  
  attr_reader :opponent_pick, :player_pick
  
  def initialize(opponent_pick:, player_pick:)
    @opponent_pick, @player_pick = opponent_pick, player_pick
  end
  
  def score
    PICKS_SCORES.fetch(@player_pick) + outcome_score
  end
  
  def outcome_score
    case @player_pick <=> @opponent_pick
    when  1 then 6 # victory
    when  0 then 3 # draw
    when -1 then 0 # defeat
    end
  end
end
