# Author: Ian Gregory
# GridKid

class Grid
    def initialize(x, y)
        @grid = Array.new(x) { Array.new(y) }
    end

    def setter(x, y, exp)
        @grid[x][y] = exp
    end

    def getter(x, y)
        @grid[x][y]
    end

    def to_s
        "#{@grid}"
    end
end