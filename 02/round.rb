class Round
  PICKS_SCORES = [
    ROCK     = 1,
    PAPER    = 2,
    SCISSORS = 3
  ]
  
  attr_reader :opponent_pick, :player_pick
  
  def initialize(opponent_pick:, player_pick:)
    @opponent_pick, @player_pick = opponent_pick, player_pick
  end
  
  def score
    player_pick + 6
  end
end
