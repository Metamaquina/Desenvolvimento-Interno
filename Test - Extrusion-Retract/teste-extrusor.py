import random

extrude=5
retract=2
feedrate_e=100
feedrate_r=10000
cycle=15000

print ("M104 S185")
print ("G91")

for w in range(cycle):
    print ("G1 E%d F%d" % (extrude+random.randint(0, 9), feedrate_e))
    print ("G1 E%d F%d" % (-retract, feedrate_r))
    print ("G4 P%d" % (random.randint(0,1000)))
    print ("G1 E%d F%d" % (retract, feedrate_r))
