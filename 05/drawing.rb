class Drawing
  STACKS_PARSER = /(?:\[([A-Z])\])|\s{3}/

  def initialize(input)
    @input = input
  end
  
  def stacks
    @_stacks ||= parse_stacks
  end
  
  private
  
  def parse_stacks
    @input
      .split(/\n/)                               # parsing line by line
      .map { |l| l.scan(STACKS_PARSER).flatten } # extracting the crates (or their absence)
      .reject { |c| c.all?(&:nil?) }             # ignoring lines with no crates at all (captions, commands, etc.)
      .transpose                                 # converting the parsed data into arrays of crates (in vertical stacks)
      .map(&:compact)                            # removing the non-existant crates from the top of the stacks
      .unshift([])                               # adding a blank stack so that we can the stacks index starts at 1
  end
end
