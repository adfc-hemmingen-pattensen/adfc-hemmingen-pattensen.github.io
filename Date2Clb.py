# -*- coding: utf-8 -*-

"""

Created on Tue Oct 11 09:54:52 2016

 

@author: sji2Hi

"""


import os

def addToClipBoard(text):
    command = 'echo ' + text.strip() + '| clip'
    os.system(command)


from datetime import datetime
from datetime import timedelta

i = datetime.now()
printtime = False
 
from msvcrt import getch

print("<enter>=add to Clipboard || arrow left=-1d right=+1d up=+7d down=-7d || t=toggel time || i=insert 4 digits for HHmm")
if printtime:
    print(i.strftime('%Y-%m-%d-%a_%Hh%M'))
else:
    print(i.strftime('%Y-%m-%d-%a'))
 

while True:
    key = ord(getch())
    #print(key)
    if key == 27: #ESC
        break
    elif key == 13: #Enter
        break
    elif (key == 116): #"t"
        if printtime:
            printtime = False
        else:
            printtime = True
            
    elif (key == 105): #"i"
        time_input = raw_input("Please enter the time in HHmm format: ")
        i = i.replace(hour=int(time_input[0:2]), minute=int(time_input[2:4]))
        print(i.strftime('%Y-%m-%d-%a_%Hh%M'))
        printtime = True
        
    elif key == 224: #Special keys (arrows, f keys, ins, del, etc.)
        key = ord(getch())
        #print(key)
        if key == 77: #right arrow
            printtime = False
            i += timedelta(days=1)
        elif key == 75: #left arrow
            printtime = False
            i -= timedelta(days=1)
        if key == 72: #right arrow
            printtime = False
            i += timedelta(days=7)
        elif key == 80: #left arrow
            printtime = False
            i -= timedelta(days=7)

    if printtime:
        print(i.strftime('%Y-%m-%d-%a_%Hh%M'))
    else:
        print(i.strftime('%Y-%m-%d-%a'))
 
# Get Key Numbers
#while True:
# print(ord(getch()))
 
#example
if printtime:
    print("Final: %s"% (i.strftime('%Y-%m-%d-%a_%Hh%M')))
    addToClipBoard(i.strftime('%Y-%m-%d-%a_%Hh%M'))
else:
    print("Final: %s"% (i.strftime('%Y-%m-%d-%a')))
    addToClipBoard(i.strftime('%Y-%m-%d-%a'))
 
#output: 2016-10-10_23h32

