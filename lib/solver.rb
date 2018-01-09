# frozen_string_literal: true
class Solver
  PRECISION = 3
  INTERVAL = 10**(-1 * PRECISION)
  MAX_ITERATIONS = 20
  attr_reader :time_value, :goal
  attr_accessor :lower_bound, :upper_bound, :upper_cap_met, :iteration_count

  def initialize(time_value:, lower_bound: 0.00, upper_bound: nil, guess: 10.00)
    @upper_bound = upper_bound || guess
    @lower_bound = lower_bound
    @time_value = time_value.dup
    @time_value.i = guess
    @goal = time_value.fv
    @upper_cap_met = false
    @iteration_count = 0
  end

  def solve!
    while !within_range? && iteration_count < MAX_ITERATIONS
      result = time_value.calc_fv
      adjust_bounds!(result: result)
      time_value.i = new_guess
      self.iteration_count += 1
    end
    # TODO: This will not handle the case where the 20th iteration
    # finds the solution
    return rounded_rate if iteration_count < MAX_ITERATIONS
  rescue FloatDomainError
    return nil
  end

  private

  def within_range?
    (upper_bound - lower_bound).round(PRECISION) <= INTERVAL
  end

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
    time_value.i
  end

  def rounded_rate
    time_value.i.round(2)
  end
end
