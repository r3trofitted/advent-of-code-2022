class RucksacksSorter
  def self.from_data(data)
    new *data.split(/\n/)
  end
  
  def initialize(*sacks_contents)
    @misplaced_item_detectors = sacks_contents.map { |sc| detector_for(sc) }
    @badges_detectors = sacks_contents.each_slice(3).map { |gc| badge_detector_for(gc) }
  end
  
  def misplaced_items_priorities_sum
    misplaced_items.sum(&:priority)
  end
  
  def misplaced_items_priorities
    misplaced_items.map(&:priority)
  end
  
  def misplaced_items
    @_misplaced_items ||= @misplaced_item_detectors.map(&:take)
  end
  
  def badges_priorities_sum
    badges.sum(&:priority)
  end
  
  def badges_priorities
    badges.map(&:priority)
  end
  
  def badges
    @_badges ||= @badges_detectors.map(&:take)
  end
  
  private
  
  def detector_for(sack_contents)
    Ractor.new(sack_contents) do |sc|
      first_compartment, second_compartment = sc.chars.each_slice(sc.length / 2).to_a
      (first_compartment & second_compartment).first.extend(Prioritizer)
    end
  end
  
  def badge_detector_for(group_contents)
    Ractor.new(group_contents) do |gc|
      a, b, c = gc.map(&:chars)
      (a & b & c).first.extend(Prioritizer)
    end
  end
  
  module Prioritizer
    ITEMS_BY_PRIORITY = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    def priority
      ITEMS_BY_PRIORITY.index(self) + 1
    end
  end
end
