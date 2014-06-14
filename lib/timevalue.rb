class TimeValue
    
    attr_accessor :n, :i, :pv, :pmt, :fv
    
    def initialize(n = 0, i = 0, pv = 0.0, pmt = 0.0, fv = 0.0)
        @n = n
        @i = i.to_f
        @pv = pv.to_f
        @pmt = pmt.to_f
        @fv = fv.to_f
    end
    
    def calc_pv()
        i = @i / 100.0
        pvf = @fv / ((1 + i) ** @n)
        pva = (@pmt/i) * (1-(1/((1+i)**@n)))
        @pv = (pvf + pva) * (-1)
        #Round
        @pv = (@pv*100).round / 100.0
    end
    
    def calc_fv()
        i = @i / 100.0
        #Growth of initial contribution
        fvp = @pv * ((1 + i) ** @n)
        #Growth of payments
        fva = @pmt * (((1 + i) ** @n)-1) / i
        @fv = (fvp + fva) * (-1)
        #Round
        @fv = (@fv*100).round / 100.0
    end
    
    def calc_n()
        i = @i / 100.0
        @n = (Math.log((@pmt - (i * @fv))/(@pmt + (i * @pv)))/Math.log(1 + i)).round(0)
    end

    def calc_pmt()
        i = @i / 100.0
        @pmt = (-i*(@fv+(@pv*((1+i)**n))))/(((1+i)**n)-1)
    end
end
