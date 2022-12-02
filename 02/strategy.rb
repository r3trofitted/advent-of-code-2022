require_relative "round"
require_relative "pick"
using Pick::Emojis

class Strategy
  attr_reader :rounds
  
  PICKS_ENCRYPTION_MAP        = { "A" => 🪨, "B" => 🧻, "C" => ✂️ }
  EXPECTATIONS_ENCRYPTION_MAP = { "X" => :weaker_pick, "Y" => :same_pick, "Z" => :stronger_pick }
  
  def self.from_data(data)
    new *data.split(/\n/)
  end
  
  def self.parse_round_strategy(round_strategy)
    encrypted_pick, encrypted_result = round_strategy.split
    
    opponent_pick = PICKS_ENCRYPTION_MAP.fetch(encrypted_pick)
    expected_pick = EXPECTATIONS_ENCRYPTION_MAP.fetch(encrypted_result)
    
    [opponent_pick, opponent_pick.public_send(expected_pick)]
  end
  
  def initialize(*rounds_strategies)
    @rounds = rounds_strategies.map do |rs|
      opponent, player = Strategy.parse_round_strategy(rs)
      Round.new opponent_pick: opponent, player_pick: player
    end
  end
  
  def final_score
    @rounds.sum(&:score)
  end
end
