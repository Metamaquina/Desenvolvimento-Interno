j=1;
posicao = 0
feedrate = 10000
percurso = 200

for i in range(percurso):
  posicao = posicao+1
  print ("G1 X%d F%d" % (posicao+j, feedrate))
  print ("G1 X%d F%d" % (posicao-j, feedrate))

posicao = 200

for i in range(percurso):
  posicao = posicao-1
  print ("G1 X%d F%d" % (posicao-j, feedrate))
  print ("G1 X%d F%d" % (posicao+j, feedrate))
