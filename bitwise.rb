# Author: Ian Gregory
# Six bitwise operations: and, or, xor, not, left shift, and right shift.

require_relative 'primitive'

class Bitwise
    def initialize(x, y = IntegerPrimitive.new(1))
        @lval = x
        @rval = y
    end

    def check_type()
        if !(@lval.instance_of?(IntegerPrimitive) && @rval.instance_of?(IntegerPrimitive))
            raise "Expecting integers but got: #{@lval} and #{@rval}"
        end
    end
end

class And_Wise < Bitwise
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) & @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} & #{@rval} = "
    end
end

class Or_Wise < Bitwise
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) | @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} | #{@rval} = "
    end
end

class Not_Wise < Bitwise
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(~@lval.evaluate(environment))
    end

    def to_s
        "~#{@lval} = "
    end
end

class Xor_Wise < Bitwise
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) ^ @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} ^ #{@rval} = "
    end
end

class Left_Wise < Bitwise
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) << @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} << #{@rval} = "
    end
end

class Right_Wise < Bitwise
    def evaluate(environment)
        check_type()
        IntegerPrimitive.new(@lval.evaluate(environment) >> @rval.evaluate(environment))
    end

    def to_s
        "#{@lval} >> #{@rval} = "
    end
end