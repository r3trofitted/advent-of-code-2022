class Strategy
  attr_reader :rounds
  
  def self.from_data(data)
    new data.split(/\n/)
  end
  
  def initialize(rounds = [])
    @rounds = rounds
  end
end
