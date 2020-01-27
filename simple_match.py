import re

my_url = "pg=12222222222222222222"

expression = "pg=[0-9]*"

print(re.match(expression, my_url))