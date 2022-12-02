require_relative "round"
require_relative "pick"

class Strategy
  extend Pick::Signs
  
  attr_reader :rounds
  
  ENCRYPTION_MAP = {
    "A" => 🪨, "B" => 🧻, "C" => ✂️,
    "X" => 🪨, "Y" => 🧻, "Z" => ✂️
  }
  
  def self.from_data(data)
    new *data.split(/\n/)
  end
  
  def self.parse_round_strategy(round_strategy)
    picks = round_strategy.split
    ENCRYPTION_MAP.values_at(*picks)
  end
  
  def initialize(*rounds_strategies)
    @rounds = rounds_strategies.map do |rs|
      opponent, player = Strategy.parse_round_strategy(rs)
      Round.new opponent_pick: opponent, player_pick: player
    end
  end
end
