j=1;
pos = 100
feedrate = 10000
percurso = 200
rep = 10

for j in range(rep):
  for i in range(100):
    print ("G1 X%d F%d" % (pos+i, feedrate))
    print ("G1 X%d F%d" % (pos-i, feedrate))
