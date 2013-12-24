class TimeValue
    
    attr_accessor :n, :i, :pv, :pmt, :fv
    
    def initialize(n, i, pv, pmt, fv)
        @n = n
        @i = i
        @pv = pv
        @pmt = pmt
        @fv = fv
    end
    
    def calcPV()
        i = @i / 100.0
        pvf = @fv / ((1 + i) ** @n)
        pva = (@pmt/i) * (1-(1/((1+i)**@n)))
        @pv = (pvf + pva) * (-1)
        #Round
        @pv = (@pv*100).round / 100.0
    end
    
    def calcFV()
        i = @i / 100.0
        #Growth of initial contribution
        fvp = @pv * ((1 + i) ** @n)
        #Growth of payments
        fva = @pmt * (((1 + i) ** @n)-1) / i
        @fv = (fvp + fva) * (-1)
        #Round
        @fv = (@fv*100).round / 100.0
    end
    
    def calcN()
        i = @i / 100.0
        @n = (Math.log((@pmt - (i * @fv))/(@pmt + (i * @pv)))/Math.log(1 + i))
    end

    def calcPMT()
        i = @i / 100.0
        @pmt = (-i*(@fv+(@pv*((1+i)**n))))/(((1+i)**n)-1)
    end
end
