class Round
  PICKS = [
    ROCK     = :🪨,
    PAPER    = :🧻,
    SCISSORS = :✂️
  ]
  
  attr_reader :opponent_pick, :player_pick
  
  def initialize(opponent_pick:, player_pick:)
    @opponent_pick, @player_pick = opponent_pick, player_pick
  end
  
  def score
  end
end
