# Author: Ian Gregory
# Three logical operations: and, or, not.

require_relative 'primitive'

class Logic
    def initialize(x, y = BoolPrimitive.new(false))
        @lval = x
        @rval = y
    end

    def check_type()
        if !(@lval.instance_of?(BoolPrimitive) && @rval.instance_of?(BoolPrimitive))
            raise "Expecting [true, false] but got: #{@lval} and #{@rval}"
        end
    end
end

class And < Logic
    def evaluate(environment)
        check_type()
        BoolPrimitive.new(@lval.evaluate(environment) && @rval.evaluate(environment))
    end

    def to_s()
        "#{@lval} && #{@rval} = "
    end
end

class Or < Logic
    def evaluate(environment)
        check_type()
        BoolPrimitive.new(@lval.evaluate(environment) || @rval.evaluate(environment))
    end

    def to_s()
        "#{@lval} || #{@rval} = "
    end
end

class Not < Logic
    def evaluate(environment)
        check_type()
        BoolPrimitive.new(!@lval.evaluate(environment))
    end

    def to_s()
        "!#{@lval} = "
    end
end