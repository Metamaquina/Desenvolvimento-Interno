import time, getopt, sys, platform, os, printcore, itertools
p=printcore.printcore('/dev/ttyACM0',115200)

p.connect()

time.sleep(5)

amplitude=1
posicao = 0
feedrate = 10000
percurso = 200

while True:
  f=open('teste.gcode')
  for line in f.readlines():
    time.sleep(0.05)
    print(line)
    p.send(line)



