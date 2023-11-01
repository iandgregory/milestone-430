# Author: Ian Gregory
# Cell lvalues: a cell reference whose address is what matters.
# Cell rvalues: a cell reference whose value is what matters.

require_relative 'environment'

class Cell
    def initialize(x, y)
        @x = x
        @y = y
    end
end

class Lvalue < Cell
    def evaluate(environment)
        return @x, @y
    end

    def to_s()
        "(#{@x}, #{@y})"
    end
end

class Rvalue < Cell
    def evaluate(environment)
        environment.get_grid.getter(@x, @y)
    end

    def to_s()
        "(#{@x}, #{@y}) = "
    end
end