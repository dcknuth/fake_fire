import board
import neopixel
import signal
from time import sleep
from random import choice

class GracefulKiller:
  kill_now = False
  def __init__(self):
    signal.signal(signal.SIGINT, self.exit_gracefully)
    signal.signal(signal.SIGTERM, self.exit_gracefully)
    signal.signal(signal.SIGHUP, self.exit_gracefully)

  def exit_gracefully(self, signum, frame):
    self.kill_now = True



num_pix = 150 #Number of LEDs
# Define our light string object
pixels = neopixel.NeoPixel(board.D21, num_pix, brightness=0.5, auto_write=False)

# Try just setting every light to a equal chance of
#  black, red, yellow, orange, black, half-red, half-yellow and half-orange 

if __name__ == '__main__':
  killer = GracefulKiller()
  while not killer.kill_now:
    for x in range(0, num_pix):
      # Black, Red, Yellow or Orange
      r = choice([(0,0,0), (255,0,0), (255,255,0), (255,165,0),
                (150,0,0), (165,78,0), (0,0,0), (165,165,0)])
      pixels[x] = r
    sleep(0.1)
    pixels.show()

  #Turn all LEDs black for exit
  for x in range(0, num_pix):
    pixels[x] = (0,0,0)
  pixels.show()
  exit(0)
