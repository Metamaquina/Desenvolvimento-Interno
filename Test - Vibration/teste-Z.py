print "G21 ; set units to millimeters"
print "G90 ; back to absolute coordinates"

print "G0 X100 Y100 Z50 F7000 ;"

print "G91 ; switch to relative coordinates"

distancia = 10
feedrate = 100
coordenada = "X"


for i in range(1000000):
  print "G1 %s%d F%d ;" % (coordenada, distancia/2, feedrate)
  print "G1 %s%d F%d ;" % (coordenada, -distancia/2, feedrate)
