require "stringtrain"
require "test/unit"
 
class TestStringtrain < Test::Unit::TestCase

  def test_simple
    simple = Stringtrain::Cab.new {
      part "Artist"
      part "Song name"
      part "A time value"
      part "Server Title"
      part ''
    }
    assert_equal('Artist Song name A time value Server Title', simple.to_s)
  end
 
  def test_advanced
    a_false_condition = false

    advanced = Stringtrain::Cab.new(part_separator: '+') {|b|
      b.part "Artist", suffix: '-'
      b.part "Song name"
      b.part "A time value", surround_with: ['(',')'], condition: a_false_condition
      b.part "Server Title", prefix: '/'
      b.part '', prefix: '/'
    }

    assert_equal('Artist -+Song name+/ Server Title', advanced.to_s)
  end
 
end