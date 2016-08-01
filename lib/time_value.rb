# frozen_string_literal: true
require 'solver'

class TimeValue
  attr_accessor :n, :i, :pv, :pmt, :fv

  def initialize(n: 0, i: 0, pv: 0.0, pmt: 0.0, fv: 0.0)
    @n = n
    @i = i.to_f
    @pv = pv.to_f
    @pmt = pmt.to_f
    @fv = fv.to_f
  end

  # Base formula, ordinary annuity: -PV = [FV/((1+i)^n)] +
  # (PMT/i)*[1-(1/(1+i)^n)]
  # rubocop:disable Metrics/AbcSize
  def calc_pv
    i = @i / 100.0
    # Initial contribution
    pvf = @fv / ((1 + i)**@n)
    # Present value of annuity
    pva = (@pmt / i) * (1 - (1 / ((1 + i)**@n)))
    @pv = -1 * (pvf + pva)
    # Round
    @pv = (@pv * 100).round / 100.0
  end
  # rubocop:enable Metrics/AbcSize

  def calc_fv
    i = @i / 100.0
    # Growth of initial contribution
    fvp = @pv * ((1 + i)**@n)
    # Growth of payments
    fva = @pmt * (((1 + i)**@n) - 1) / i
    @fv = -1 * (fvp + fva)
    # Round
    @fv = (@fv * 100).round / 100.0
  end

  def calc_n
    i = @i / 100.0
    numerator = Math.log((@pmt - (i * @fv)) / (@pmt + (i * @pv)))
    denominator = Math.log(1 + i)
    @n = (numerator / denominator).round(0)
  end

  # rubocop:disable Metrics/AbcSize
  def calc_pmt
    i = @i / 100.0
    numerator = (-i * (@fv + (@pv * ((1 + i)**n))))
    denominator = (((1 + i)**n) - 1)
    @pmt = numerator / denominator
    @pmt = (@pmt * 100).round / 100.0
  end
  # rubocop:enable Metrics/AbcSize

  def calc_i
    solver = Solver.new(time_value: self, lower_bound: 0.00, guess: 10.00)
    solver.solve!
  end
end
