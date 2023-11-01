# Author: Ian Gregory
# Six arithmetic operations: addition, subtraction,
# multiplication, division, modulo, exponentiation.

require_relative 'primitive'

class Arithmetic
    def initialize(x, y)
        @lval = x
        @rval = y
    end

    def check_type()
        # check left value
        if !(@lval.instance_of?(FloatPrimitive) || @lval.instance_of?(IntegerPrimitive))
            raise "Expecting a numeric value but got: #{@lval}"
        end
        # check right value
        if !(@rval.instance_of?(FloatPrimitive) || @rval.instance_of?(IntegerPrimitive))
            raise "Expecting a numeric value but got: #{@rval}"
        end
    end
end

class Add < Arithmetic
    def evaluate(environment)
        check_type()
        FloatPrimitive.new((@lval.evaluate(environment) + @rval.evaluate(environment)).round(2))
    end

    def to_s()
        "#{@lval} + #{@rval} = "
    end
end

class Sub < Arithmetic
    def evaluate(environment)
        check_type()
        FloatPrimitive.new((@lval.evaluate(environment) - @rval.evaluate(environment)).round(2))
    end

    def to_s()
        "#{@lval} - #{@rval} = "
    end
end

class Mult < Arithmetic
    def evaluate(environment)
        check_type()
        FloatPrimitive.new((@lval.evaluate(environment) * @rval.evaluate(environment)).round(2))
    end

    def to_s()
        "#{@lval} * #{@rval} = "
    end
end

class Div < Arithmetic
    def evaluate(environment)
        check_type()
        FloatPrimitive.new((@lval.evaluate(environment) / @rval.evaluate(environment)).round(2))
    end

    def to_s()
        "#{@lval} / #{@rval} = "
    end
end

class Mod < Arithmetic
    def evaluate(environment)
        check_type()
        FloatPrimitive.new((@lval.evaluate(environment) % @rval.evaluate(environment)).round(2))
    end

    def to_s()
        "#{@lval} % #{@rval} = "
    end
end

class Exp < Arithmetic
    def evaluate(environment)
        check_type()
        FloatPrimitive.new((@lval.evaluate(environment) ** @rval.evaluate(environment)).round(2))
    end

    def to_s()
        "#{@lval} ** #{@rval} = "
    end
end