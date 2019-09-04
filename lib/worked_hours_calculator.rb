class WorkedHoursCalculator
  def initialize(time_periods)
    @time_periods = time_periods
  end

  def calculate
    elapsed_time_per_period = @time_periods.split.each_slice(2).map do |start_time, finish_time|
      start_time   = Time.parse(start_time)
      finish_time  = Time.parse(finish_time)

      difference_in_seconds = finish_time - start_time
    end
   
    elapsed_time_per_period.sum
  end
end
