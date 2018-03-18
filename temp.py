import os
import matplotlib.pyplot as plt
import multiprocessing

tempC = []
upTimes = []
plt.ion()
cnt=0

def getUpTIme():
    ut = os.popen("awk '{print $1}' /proc/uptime").readline()
    return ut

def plotNow():
    plt.clf()
    plt.ylim(20,60)
    plt.title(title)
    plt.grid(True)
    plt.ylabel('Temp (C)')
    plt.xlabel('uptime (S)')
    plt.plot(upTimes, tempC, 'rx-')
    plt.show()

numOfCPU = multiprocessing.cpu_count()
title = "temp. vs uptime@Raspberry Pi (" + str(numOfCPU) + " core)"

while True:
    ostemp = os.popen('vcgencmd measure_temp').readline()
    temp = (ostemp.replace("temp=", "").replace("'C\n", ""))
    tempC.append(temp)
    
    ut = getUpTIme()
    upTimes.append(ut)

    print(len(tempC))
    print(temp)
    print("uptime(sec) = "+ut)
    
    if len(tempC)>=200:
        tempC.pop(0)
        upTimes.pop(0)
    
    plotNow()
    plt.pause(1)