# Author: Ian Gregory
# Six relational operations: equals, not equals, 
# less than, less than or equal to, greater than, 
# and greater than or equal to.

class Relational
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

class Equals < Relational
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) == @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} == #{@rval} = "
    end
end

class Not_Equals < Relational
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) != @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} != #{@rval} = "
    end
end

class Less_Than < Relational
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) < @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} < #{@rval} = "
    end
end

class Less_Than_Equal < Relational
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) <= @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} <= #{@rval} = "
    end
end

class Greater_Than < Relational
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) > @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} > #{@rval} = "
    end
end

class Greater_Than_Equal < Relational
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) >= @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} >= #{@rval} = "
    end
end