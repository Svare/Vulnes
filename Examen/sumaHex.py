
from functools import reduce

l = ["6a","45","53","55","53","2d","65","4e","52","49","51","2d","55","45","70","41","43","2d","48","45","43","4f","66","52","41","4e","43","6f","6a"]
r = map(lambda x: int(x, 16), l)
print(reduce(lambda x,y: x+y, r))