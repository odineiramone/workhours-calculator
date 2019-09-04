require './test/test_helper'

class CalculatorTest < Minitest::Test
  def test_returns_formated_time_for_one_period
    output, _errors = capture_subprocess_io do
      system "ruby calculator.rb -p '09:00 12:00 13:15 18:37 19:49 21:13'"
    end

    assert_equal "You worked for 9:46 in this period.\n", output
  end

  def test_returns_formated_time_for_many_period
    output, _errors = capture_subprocess_io do
      system "ruby calculator.rb -p '09:37 12:00 12:42 18:19 18:53 20:03; 09:37 12:00 12:42 18:19'"
    end

    assert_equal "You worked for 9:10 in this period.\nYou worked for 8:00 in this period.\n", output
  end
end
