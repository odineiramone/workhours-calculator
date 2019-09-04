require 'minitest/autorun'
require './lib/time_formater.rb'

class TimeFormaterTest < Minitest::Test
  def test_returns_formated_time
    formatter = TimeFormatter.new(28800)
    assert_equal 'You worked for 8:00 in this period.', formatter.formated_time
  end
end
