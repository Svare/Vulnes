from z3 import *
s0 = Int('s[0]')
s1 = Int('s[1]')
s2 = Int('s[2]')

solver = Solver()
solver.add(s0 >= 0)
solver.add(s1 >= 0)
solver.add(s2 >= 0)
solver.add(s0 < 10)
solver.add(s1 < 10)
solver.add(s2 < 10)

solver.add(s0 * s1 > 2)
solver.add(s1 > 5 )
solver.add(s2 < 3)
solver.add(s0+s2 < 4)

print("solving...")
print(solver.check())
print(solver.model())
