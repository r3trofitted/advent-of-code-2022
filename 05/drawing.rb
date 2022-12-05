require_relative "stack"
require_relative "command"

class Drawing
  STACKS_PARSER = /(?:\[([A-Z])\])|\s{3}/
  COMMANDS_PARSER = /move (?<move>\d+) from (?<from>\d+) to (?<to>\d+)/
  
  def self.parse(input)
    d = new(input)
    
    [d.stacks, d.commands]
  end

  def initialize(input)
    @input = input
  end
  
  def stacks
    @_stacks ||= parse_stacks
  end
  
  def commands
    @_commands ||= parse_commands
  end
  
  private
  
  def parse_stacks
    @input
      .split(/\n/)                               # parsing line by line
      .map { |l| l.scan(STACKS_PARSER).flatten } # extracting the crates (or their absence)
      .reject { |c| c.all?(&:nil?) }             # ignoring lines with no crates at all (captions, commands, etc.)
      .transpose                                 # converting the parsed data into arrays of crates (in vertical stacks)
      .map { |crates| Stack.new crates }         # converting to stacks
  end
  
  def parse_commands
    @input
      .split(/\n/)                                            # parsing line by line
      .map { |l| l.scan(COMMANDS_PARSER).flatten }            # extracting the commands
      .map { |move, from, to| Command.new move:, from:, to: } # converting to Command objects
  end
end
