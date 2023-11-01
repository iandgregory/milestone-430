# Author: Ian Gregory
# Two casting operators: float-to-int, to int-to-float.

class Casting
    def initialize(x)
        @val = x
    end
end

class Float_To_Int < Casting
    def evaluate(environment)
        if !(@val.instance_of?(FloatPrimitive))
            raise "Expecting a float but got: #{@val}"
        end
        IntegerPrimitive.new(@val.evaluate(environment).to_i)
    end

    def to_s()
        "#{@val} to integer = "
    end
end

class Int_To_Float < Casting
    def evaluate(environment)
        if !(@val.instance_of?(IntegerPrimitive))
            raise "Expecting a float but got: #{@val}"
        end
        FloatPrimitive.new(@val.evaluate(environment).to_f)
    end

    def to_s()
        "#{@val} to float = "
    end
end