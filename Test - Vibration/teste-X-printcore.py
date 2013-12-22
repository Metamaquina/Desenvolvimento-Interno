import time, getopt, sys
import platform, os
import printcore

p=printcore.printcore('/dev/ttyACM0',115200)

p.connect()
print("hey")
p.send_now("G1 X95 F10000")

#k = python teste.py > teste.gcode
