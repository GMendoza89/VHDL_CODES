
import numpy as np
import math as mt
import os
from matplotlib import pyplot as plt

#the Seven segment display
#
#       a
#      ----
#   f |    | b
#     | g  |
#      ----
#   e |    | c
#     |    |
#      ----
#        d
#

def decimal2SevenSegCC(number):
    match number:
        case -1:
            return [0,0,0,0,0,0,1]
        case 0:   # a,b,c,d,e,f,gpy
            return [1,1,1,1,1,1,0]
        case 1:
            return [0,1,1,0,0,0,0]
        case 2: 
            return [1,0,0,1,1,0,1]
        case 3:
            return [1,1,1,1,0,0,1]
        case 4:
            return [0,1,1,0,0,1,1]
        case 5:
            return [1,0,1,1,0,1,1]
        case 6:
            return [0,0,1,1,1,1,1]
        case 7:
            return [1,1,1,0,0,0,1]
        case 8:
            return [1,1,1,1,1,1,1]
        case 9: 
            return [1,1,1,0,0,1,1]
        case 10: 
            return [0,0,0,0,0,0,0]

def decimal2SevenSegAC(number):
    match number:
        case -1:
            return [1,1,1,1,1,1,0]
        case 0:   # a,b,c,d,e,f,g
            return [0,0,0,0,0,0,1]
        case 1:
            return [1,0,0,1,1,1,1]
        case 2: 
            return [0,1,1,0,0,1,0]
        case 3:
            return [0,0,0,0,1,1,0]
        case 4:
            return [1,0,0,1,1,0,0]
        case 5:
            return [0,1,0,0,1,0,0]
        case 6:
            return [1,1,0,0,0,0,0]
        case 7:
            return [0,0,0,1,1,1,0]
        case 8:
            return [0,0,0,0,0,0,0]
        case 9: 
            return [0,0,0,1,1,0,0]
        case 10:
            return [1,1,1,1,1,1,1]
        

