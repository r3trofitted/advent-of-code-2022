require "minitest/autorun"

require_relative "drawing"
class DrawingTest < Minitest::Test
  def test_parse_stacks
    drawing = Drawing.new <<~TXT
          [D]    
      [N] [C]    
      [Z] [M] [P]
       1   2   3 
    TXT
    
    stacks = drawing.stacks
    
    assert_equal %w(N Z), stacks[1]
    assert_equal %w(D C M), stacks[2]
    assert_equal %w(P), stacks[3]
  end
  
  def test_parse_commands
  end
end
