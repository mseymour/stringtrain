require "stringtrain"
require "test/unit"
 
class TestStringtrain < Test::Unit::TestCase

  def test_simple
    advanced = Stringtrain.new {
      b.part "Artist"
      b.part "Song name"
      b.part "A time value"
      b.part "Server Title"
      b.part ''
    }

    assert_same('Artist - Songname A time value Server Title', advanced)
  end
 
  def test_advanced
    a_false_condition = false

    advanced = Stringtrain.new(part_separator: '+') {|b|
      b.part "Artist", suffix: '-'
      b.part "Song name"
      b.part "A time value", surround_with: ['(',')'], condition: a_false_condition
      b.part "Server Title", prefix: '/'
      b.part '', prefix: '/'
    }

    assert_same('Artist -+Songname+/ Server Title', advanced)
  end
 
end