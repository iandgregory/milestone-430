# Author: Ian Gregory
# Class for testing Milestone1

require_relative 'primitive'
require_relative 'environment'
require_relative 'grid'
require_relative 'arithmetic'
require_relative 'logic'
require_relative 'cell'
require_relative 'bitwise'
require_relative 'relational'
require_relative 'casting'
require_relative 'stats'

#########################
puts "\n"
#########################

grid = Grid.new(2, 2)
env = Environment.new(grid)
puts env.get_grid.to_s
exit()

#########################
puts "\n"
#########################

a = IntegerPrimitive.new(100)
puts a.evaluate(env)
b = IntegerPrimitive.new(2)
puts b.evaluate(env)
c = BoolPrimitive.new(true)
puts c.evaluate(env)
d = BoolPrimitive.new(false)
puts d.evaluate(env)
e = StringPrimitive.new("hello world!")
puts e.evaluate(env)
f = FloatPrimitive.new(0.111212)
puts f.evaluate(env)

# couple of bad examples
# w = IntegerPrimitive.new("cats")
# puts w.evaluate(env)
# x = BoolPrimitive.new(100)
# puts x.evaluate(env)
# y = StringPrimitive.new(false)
# puts y.evaluate(env)
# z = BoolPrimitive.new("camel")
# puts z.evaluate(env)
exit()

#########################
puts "\n"
#########################

temp = Add.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Sub.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Mult.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Div.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Mod.new(a, f)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Exp.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"

# couple of bad examples
# temp = Add.new(a, c)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Sub.new(d, e)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Mult.new(d, f)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Div.new(f, c)
# puts temp.to_s + "#{temp.evaluate(env)}"
exit()

#########################
puts "\n"
#########################

temp = And.new(c, d)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Or.new(c, d)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Not.new(d)
puts temp.to_s + "#{temp.evaluate(env)}"

# couple of bad examples
# temp = And.new(c, b)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Or.new(b, f)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp =  Not.new(f)
# puts temp.to_s + "#{temp.evaluate(env)}"
exit()

#########################
puts "\n"
#########################

env.get_grid.setter(0, 0, Mod.new(a, b))
env.get_grid.setter(0, 1, Add.new(a, b))
env.get_grid.setter(1, 1, Exp.new(a, b))
env.get_grid.setter(1, 0, Div.new(a, b))

temp0 = Rvalue.new(0, 0)
temp1 = Rvalue.new(0, 1)
temp2 = Rvalue.new(1, 0)
temp3 = Rvalue.new(1, 1)

puts temp0.to_s + "#{temp0.evaluate(env)}" + "#{temp0.evaluate(env).evaluate(env)}"
puts temp1.to_s + "#{temp1.evaluate(env)}" + "#{temp1.evaluate(env).evaluate(env)}"
puts temp2.to_s + "#{temp2.evaluate(env)}" + "#{temp2.evaluate(env).evaluate(env)}"
puts temp3.to_s + "#{temp3.evaluate(env)}" + "#{temp3.evaluate(env).evaluate(env)}"

temp0 = Lvalue.new(0, 0)
temp1 = Lvalue.new(0, 1)
temp2 = Lvalue.new(1, 0)
temp3 = Lvalue.new(1, 1)

temp = Max.new(temp0, temp3)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Min.new(temp0, temp3)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Mean.new(temp0, temp3)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Sum.new(temp0, temp3)
puts temp.to_s + "#{temp.evaluate(env)}"

exit()

#########################
puts "\n"
#########################

temp = And_Wise.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Or_Wise.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Not_Wise.new(a)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Not_Wise.new(b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Xor_Wise.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Left_Wise.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Right_Wise.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"

# couple of bad examples
# temp = And_Wise.new(c, d)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Or_Wise.new(a, d)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Not_Wise.new(f)
# puts temp.to_s + "#{temp.evaluate(env)}"
exit()

#########################
puts "\n"
#########################

temp = Equals.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Greater_Than.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Greater_Than_Equal.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Less_Than.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Less_Than_Equal.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Not_Equals.new(a, b)
puts temp.to_s + "#{temp.evaluate(env)}"

# couple of bad examples
# temp = Equals.new(a, d)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Greater_Than.new(d, c)
# puts temp.to_s + "#{temp.evaluate(env)}"
exit()

#########################
puts "\n"
#########################

temp = Float_To_Int.new(f)
puts temp.to_s + "#{temp.evaluate(env)}"
temp = Int_To_Float.new(a)
puts temp.to_s + "#{temp.evaluate(env)}"

# couple of bad examples
# temp = Float_To_Int.new(d)
# puts temp.to_s + "#{temp.evaluate(env)}"
# temp = Int_To_Float.new(e)
# puts temp.to_s + "#{temp.evaluate(env)}"
exit()

#########################
puts "\n"
#########################