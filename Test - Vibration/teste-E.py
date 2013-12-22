distancia_x = 20
feedrate = 100

for i in range(1000000):
  print "G1 E%d F%d" % (distancia_x/2, feedrate)
  print "G1 E%d F%d" % (-distancia_x/2, feedrate)
