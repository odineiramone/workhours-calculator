#!/usr/bin/env ruby

require 'optparse'
require 'csv'

require './lib/time_formater.rb'
require './lib/worked_hours_calculator.rb'

LIST_PERIOD_SEPARATOR = ';'

OptionParser.new do |parser|
  parser.banner = 'Usage: ruby calculator.rb [options]'

  parser.on('-p',
            '--periods PERIODS',
            'Each period of time separated by spaces in 24h-format. Example: "09:00 12:00 13:15 18:15". You can provide a list of periods separated by semicolon. Example: "09:00 12:00 13:15 18:15; 09:37 12:00 12:42 18:19"') do |args|
    time_periods_list = args

    if time_periods_list
      time_periods_list.split(LIST_PERIOD_SEPARATOR).each do |time_periods|
        calculator = WorkedHoursCalculator.new(time_periods.strip)
        total_elapsed_time = calculator.calculate
        
        formatter = TimeFormatter.new(total_elapsed_time)
        puts formatter.formated_time
      end
    end
  end

  parser.on('-f', '--file FILE_PATH', 'Read periods of time from a .csv (comma-separated values) file. File path must be between quotes') do |args|
    csv_file_path = args

    if csv_file_path
      time_periods_list = CSV.read(csv_file_path)

      time_periods_list.each do |time_periods|
        calculator = WorkedHoursCalculator.new(time_periods.join(' '))
        total_elapsed_time = calculator.calculate

        formatter = TimeFormatter.new(total_elapsed_time)
        puts formatter.formated_time
      end
    end
  end

  parser.on('-h', '--help', 'Show this help message') do
    puts parser
  end
end.parse!
