#!/usr/bin/env ruby

require 'optparse'

require './lib/time_formater.rb'
require './lib/worked_hours_calculator.rb'

# This will hold the options we parse
options = {}

OptionParser.new do |parser|
  parser.banner = 'Usage: ruby calculator.rb [options]'

  parser.on('-p', '--periods PERIODS', 'Each period of time separated by spaces in 24h-format. Example: "09:00 12:00 13:15 18:15"') do |args|
    time_periods = args

    if time_periods
      calculator = WorkedHoursCalculator.new(time_periods)
      total_elapsed_time = calculator.calculate
      
      formatter = TimeFormatter.new(total_elapsed_time)
      puts formatter.formated_time
    end
  end

  parser.on('-h', '--help', 'Show this help message') do
    puts parser
  end
end.parse!
