class Solver
  PRECISION = 3
  INTERVAL = 10 ** (-1 * PRECISION)
  MAX_ITERATIONS = 20
  attr_reader :time_value, :goal
  attr_accessor :lower_bound, :upper_bound, :upper_cap_met

  def initialize(time_value:, lower_bound: 0.00, upper_bound: nil, guess: 0.00)
    @upper_bound = upper_bound || guess
    @lower_bound = lower_bound
    @time_value = time_value.dup
    @time_value.i = guess
    @goal = time_value.fv
    @upper_cap_met = false
  end

  def solve!
    iteration_count = 0
    while (upper_bound - lower_bound).round(PRECISION) > INTERVAL &&
      iteration_count < MAX_ITERATIONS
      iteration_count += 1
      begin
        result = time_value.calc_fv
      rescue FloatDomainError
        return nil
      end
      adjust_bounds!(result: result)
      time_value.i = new_guess
    end
    # TODO: This will not handle the case where the 20th iteration
    # finds the solution
    rate if iteration_count < MAX_ITERATIONS
  end

  private

  def adjust_bounds!(result:)
    if result > goal
      # interest rate too high
      self.upper_cap_met = true
      self.upper_bound = rate
    elsif result < goal
      # interest rate too low
      self.upper_bound *= 2 unless upper_cap_met
      self.lower_bound = rate
    end
  end

  def new_guess
    ((upper_bound + lower_bound) / 2).round(PRECISION)
  end

  def rate
    time_value.i.round(2)
  end
end
