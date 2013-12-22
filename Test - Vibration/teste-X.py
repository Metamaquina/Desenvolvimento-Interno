distancia_x1 = 95
distancia_x2 = 105
feedrate = 10000

for i in range(100):
  print "G1 X%d F%d" % (distancia_x1, feedrate)
  print "G1 X%d F%d" % (distancia_x2, feedrate)
