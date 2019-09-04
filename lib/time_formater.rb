class TimeFormatter
  attr_accessor :elapsed_time

  def initialize(elapsed_time_in_seconds)
    @elapsed_time_in_seconds = elapsed_time_in_seconds.to_i
  end
  
  def formated_time
    hours   = (@elapsed_time_in_seconds / 3600)
    minutes = (@elapsed_time_in_seconds / 60) % 60

    elapsed_time = hours.to_s + ':' + format('%02d',minutes.to_s)
    'You worked for ' + elapsed_time + ' in this period.'
  end
end
