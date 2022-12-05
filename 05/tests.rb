require "minitest/autorun"

require_relative "drawing"
require_relative "command"

class DrawingTest < Minitest::Test
  def test_parse_stacks
    drawing = Drawing.new <<~TXT
          [D]    
      [N] [C]    
      [Z] [M] [P]
       1   2   3 
    TXT
    
    stacks = drawing.stacks
    
    assert_equal "NZ", stacks[1].to_s
    assert_equal "DCM", stacks[2].to_s
    assert_equal "P", stacks[3].to_s
  end
  
  def test_parse_commands
    drawing = Drawing.new <<~TXT
      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    TXT
    
    commands = drawing.commands
    
    assert_equal Command.new(move: 1, from: 2, to: 1), commands[0]
    assert_equal Command.new(move: 3, from: 1, to: 3), commands[1]
    assert_equal Command.new(move: 2, from: 2, to: 1), commands[2]
    assert_equal Command.new(move: 1, from: 1, to: 2), commands[3]
  end
end
