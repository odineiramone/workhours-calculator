require 'minitest/autorun'
require './lib/worked_hours_calculator.rb'

class WorkedHoursCalculatorTest < Minitest::Test
  def test_returns_formated_time
    calculator = WorkedHoursCalculator.new('09:00 12:00 13:00 18:00')
    assert_equal 28800, calculator.calculate
  end
end
