# Author: Ian Gregory
# Four statistical functions: max, min, mean, and sum.

require_relative 'cell'

class Stats
    def initialize(x, y)
        @lval = x
        @rval = y
    end

    def check_type()
        if !(@lval.instance_of?(Lvalue) && @rval.instance_of?(Lvalue))
            raise "Expecting an Lvalue but got: #{@lval} and #{@rval}"
        end
    end

    def get_values(environment)
        beg = @lval.evaluate(environment)
        stp = @rval.evaluate(environment)
        vals = []

        (stp[0] - beg[0] + 1).times do |i|
            (stp[1] - beg[1] + 1).times do |j|
              vals.push(environment.get_grid.getter(i, j).evaluate(environment))
            end
        end

        rets = []
        (vals.length).times do |i|
            rets.push(vals[i].evaluate(environment))
        end

        return rets
    end
end

class Max < Stats
    def evaluate(environment)
        check_type()
        get_values(environment).max
    end

    def to_s()
        "MAX (#{@lval}, #{@rval}) = "
    end
end

class Min < Stats
    def evaluate(environment)
        check_type()
        get_values(environment).min
    end

    def to_s()
        "MIN (#{@lval}, #{@rval}) = "
    end
end

class Mean < Stats
    def evaluate(environment)
        check_type()
        arr = get_values(environment)
        (arr.sum / arr.size).round(2)
    end

    def to_s()
        "MEAN (#{@lval}, #{@rval}) = "
    end
end

class Sum < Stats
    def evaluate(environment)
        check_type()
        (get_values(environment).sum).round(2)
    end

    def to_s()
        "SUM (#{@lval}, #{@rval}) = "
    end
end