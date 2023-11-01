# Author: Ian Gregory
# Four primitives: integers, floats, booleans, and strings.
# https://stackoverflow.com/questions/9816878/how-do-ruby-programmers-do-type-checking
# https://stackoverflow.com/questions/3028243/how-to-check-if-a-ruby-object-is-a-boolean

class Primitive
    attr_accessor :primitive

    def initialize(primitive)
        @primitive = primitive
    end

    def to_s()
        "#{@primitive.inspect}"
    end
end

class IntegerPrimitive < Primitive
    def evaluate(environment)
        raise "Expecting an Integerbut got: #{to_s()}" unless @primitive.instance_of?(Integer)
        @primitive
    end
end

class FloatPrimitive < Primitive
    def evaluate(environment)
        raise "Expecting a Float but got: #{to_s()}" unless @primitive.instance_of?(Float) || @primitive.instance_of?(Integer)
        @primitive
    end
end

class BoolPrimitive < Primitive
    def evaluate(environment)
        raise "Expecting a Boolean but got: #{to_s()}" unless [true, false].include? @primitive
        @primitive
    end
end

class StringPrimitive < Primitive
    def evaluate(environment)
        raise "Expecting a String but got: #{to_s()}" unless @primitive.instance_of?(String)
        @primitive
    end
end
