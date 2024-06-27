import numpy as np
import math as mt
import os
from matplotlib import pyplot as plt
import SevenSeg

__version__ = '0.1.0'
__author__ = 'Gustavo D Mendoza Pinto'
__license__ = "Apache License 2.0. https://www.apache.org/licenses/LICENSE-2.0"

# Definimos parametros de cuantificación
N = 10
D = 2**N
#definimos el numero de display
numOfFloatDisplay = 4
numOfDisplay = 2 + numOfFloatDisplay
#creamos el arreglo para los display
# display = np.array((numOfDisplay,7),np.int8)
display = []

displayPins = numOfDisplay*7

#Calculo de la funcion cuantisada
signal = []     #Señal a generar
argument = []  # argumento de entrada - solo para mostrar en la grafica
for i in range(0,D):
    signal.append(np.sin(2*i*np.pi/D))
    argument.append(2*i*np.pi/D)

#Generamos gráfica de la función
fig, signalPlot = plt.subplots()
signalPlot.plot(argument,signal)
signalPlot.set_title('Gráfica de la señal', loc = "left", fontdict = {'fontsize':14, 'fontweight':'bold', 'color':'tab:blue'})
signalPlot.set_xlabel("Radianes", fontdict = {'fontsize':14, 'fontweight':'bold', 'color':'tab:blue'})
signalPlot.set_ylabel("Amplitud")
plt.savefig('Señal Generada.png')
plt.show()

#binarizacion por teorema del complemento
#oFile = open("Binarizacion argumento.txt","w")
X = np.empty((D,N),int)
for i in range(0,D):
    Auxiliar = i
    array = np.empty((1,N),int)
    for j in range(0,N):
        array[0,j] = Auxiliar%2
        Auxiliar = mt.floor(Auxiliar/2)
    X[i] = np.flip(array[0])

#Binarización de la función en complemento a 2
Y = np.empty((D,displayPins),int)
for i in range(0,D):
    # Ajuste a entero Normalizado
    display.clear()
    if signal[i]<0:
        display.append(SevenSeg.decimal2SevenSegCC(-1)) 
    else:
        display.append(SevenSeg.decimal2SevenSegCC(10))
    display.append(SevenSeg.decimal2SevenSegCC(int(signal[i])))
    for k in range(1,numOfFloatDisplay+1):
        displayFloatInt = int(np.absolute(signal[i]*10**k))
        d = int(displayFloatInt%10)
        display.append(SevenSeg.decimal2SevenSegCC(d))
    # print(display)
    for l in range(0,numOfDisplay):
        for m in range(0,7):
            # print(display[j][k])
            Y[i,l*7+m]=display[l][m]

#Creación del Archivo VHDL
    # NOmbre del archivo de salida
oFile = open("LUT_SIN_7SEG.vhd","w") 
## LLenado del comienzo de la tabla
oFile.write("-- Tabla de consulta de Datos\n")
oFile.write("-- \n")
oFile.write("-- Diseño Lógico\n")
oFile.write("-- Gustavo David Mendoza Pinto\n")
oFile.write("\n")
oFile.write("LIBRARY IEEE; \n")
oFile.write("USE IEEE.std_logic_1164.all; \n")
oFile.write("Entity LUT_SIN_7SEG is \n")
oFile.write("\t port(\n")
# Definición del argumento X
oFile.write("\t\t X : in  std_logic_vector("+str(N-1)+" downto 0);\n")
# Definición del argumeto Y
oFile.write("\t\t Y : out std_logic_vector("+str(displayPins-1)+" downto 0));\n")
oFile.write("END LUT_SIN_7SEG; \n")
#Comienzo de la Arquitectura
oFile.write("Architecture TABLE of LUT_SIN_7SEG is \n")
oFile.write("BEGIN \n")
oFile.write("\t process(X) \n")
oFile.write("\t begin \n")
oFile.write("\t\t case X is \n")
for i in range(0,D):
    display.clear()
    oFile.write("\t\t\t when \"")
    #binarizacion del argumento
    for j in range(0,N):
        oFile.write(str(X[i,j]))
    oFile.write("\" => Y <= \"")
    #binarizacion del Argumento Y
    for j in range(0,displayPins):
        oFile.write(str(Y[i,j]))
    oFile.write("\"; -- Argumento "+str(i)+ "( "+ str(argument[i]) +" Radianes)" +" Función "+str(signal[i])+"\n")
#fin del archivo VHDL
oFile.write("\t\t\t when others => null; \n")
oFile.write("\t\t end case; \n")
oFile.write("\t end process; \n")
oFile.write("END TABLE; \n")
oFile.close()
#Banco de pruebas de la funcion seno
oFile = open("TB_LUT_SIN_7SEG.vhd","w")
oFile.write("-- Banco de pruebas de Tabla de consulta de Datos\n")
oFile.write("-- \n")
oFile.write("-- Diseño Lógico\n")
oFile.write("-- Gustavo David Mendoza Pinto\n")
oFile.write("\n")
oFile.write("LIBRARY IEEE; \n")
oFile.write("USE IEEE.std_logic_1164.all; \n")
oFile.write("Entity TB_LUT_SIN_7SEG is \n")
oFile.write("\t\n")
oFile.write("END TB_LUT_SIN_7SEG; \n")

oFile.write("Architecture Simulation of TB_LUT_SIN_7SEG is \n")
oFile.write("\tComponent LUT_SIN_7SEG\n")
oFile.write("\t\t port(\n")
# Definición del argumento X
oFile.write("\t\t\t X : in  std_logic_vector("+str(N-1)+" downto 0);\n")
# Definición del argumeto Y
oFile.write("\t\t\t Y : out std_logic_vector("+str(displayPins-1)+" downto 0));")
oFile.write("\n\tend Component; \n")
oFile.write("\t signal X : std_logic_vector("+str(N-1)+" downto 0);\n")
oFile.write("\t signal Y : std_logic_vector("+str(displayPins-1)+" downto 0)\n;")
oFile.write("BEGIN \n")
oFile.write("\t\t SIMBLK00: LUT_SIN_7SEG PORT MAP(X,Y);\n")
oFile.write("\t process \n")
oFile.write("\t begin \n")
for i in range(0,D):
    oFile.write("\t\t\t X <=\"")
    #binarizacion del argumento
    for j in range(0,N):
        oFile.write(str(X[i,j]))
    oFile.write("\";\n")
    #binarizacion del Argumento Y
    oFile.write("\t\t\t wait for 20 ns;\n")
#fin del archivo VHDL

oFile.write("\t end process; \n")
oFile.write("END SIMULATION; \n")