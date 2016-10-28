import numpy as np
import matplotlib.pyplot as plt
from isindo.etalons import *
from isindo.methods.robust import test


test()

t = np.arange(0,3,0.01)
y = object_os_step(1, t)


plt.figure(1)
plt.plot(t,y)
plt.grid(True)
plt.ylabel('Amplitude')
plt.xlabel('Time (s)')
plt.title("Step response")
plt.draw()
plt.show()


y = object_os_weight(1, t)

plt.figure(2)
plt.plot(t,y)
plt.grid(True)
plt.ylabel('Amplitude')
plt.xlabel('Time (s)')
plt.title("Impulse response")
plt.draw()
plt.show()


