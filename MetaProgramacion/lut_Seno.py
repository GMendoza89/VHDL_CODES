import numpy as np
import math as mt
import os
from matplotlib import pyplot as plt

__version__ = '0.1.0'
__author__ = 'Gustavo D Mendoza Pinto'
__license__ = "Apache License 2.0. https://www.apache.org/licenses/LICENSE-2.0"

# Definimos parametros de cuantificación
N = 12
D = 2**N
#definimos numero de bits en formato e.f
E = 2
F = 16
G = E + F

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
Y = np.empty((D,G),int)
for i in range(0,D):
    # Ajuste a entero Normalizado
    Auxiliar = signal[i]*2**F
    #Valor absoluto para la binarización entera
    if Auxiliar < 0:
        Auxiliar = mt.floor(2**G + Auxiliar)
    else:
        Auxiliar = mt.floor(Auxiliar)
    #Binarizacion
    for j in range(G-1,-1,-1):
        Y[i,j] = Auxiliar%2
        Auxiliar = mt.floor(Auxiliar/2)

#Creación del Archivo VHDL
    # NOmbre del archivo de salida
oFile = open("LUT_SIN.vhd","w") 
## LLenado del comienzo de la tabla
oFile.write("-- Tabla de consulta de Datos\n")
oFile.write("-- \n")
oFile.write("-- Diseño Lógico\n")
oFile.write("-- Gustavo David Mendoza Pinto\n")
oFile.write("\n")
oFile.write("LIBRARY IEEE; \n")
oFile.write("USE IEEE.std_logic_1164.all; \n")
oFile.write("Entity LUT_SIN is \n")
oFile.write("\t port(\n")
# Definición del argumento X
oFile.write("\t\t X : in  std_logic_vector("+str(N-1)+" downto 0);\n")
# Definición del argumeto Y
oFile.write("\t\t Y : out std_logic_vector("+str(G-1)+" downto 0));\n")
oFile.write("END LUT_SIN; \n")
#Comienzo de la Arquitectura
oFile.write("Architecture TABLE of LUT_SIN is \n")
oFile.write("BEGIN \n")
oFile.write("\t process(X) \n")
oFile.write("\t begin \n")
oFile.write("\t\t case X is \n")
for i in range(0,D):
    oFile.write("\t\t\t when \"")
    #binarizacion del argumento
    for j in range(0,N):
        oFile.write(str(X[i,j]))
    oFile.write("\" => Y <= \"")
    #binarizacion del Argumento Y
    for j in range(0,G):
        oFile.write(str(Y[i,j]))
    oFile.write("\"; -- Argumento "+str(i)+ "( "+ str(argument[i]) +" Radianes)" +" Función "+str(signal[i])+"\n")
#fin del archivo VHDL
oFile.write("\t\t\t when others => null; \n")
oFile.write("\t\t end case; \n")
oFile.write("\t end process; \n")
oFile.write("END TABLE; \n")
oFile.close()
#Banco de pruebas de la funcion seno
oFile = open("TB_LUT_SIN.vhd","w")
oFile.write("-- Banco de pruebas de Tabla de consulta de Datos\n")
oFile.write("-- \n")
oFile.write("-- Diseño Lógico\n")
oFile.write("-- Gustavo David Mendoza Pinto\n")
oFile.write("\n")
oFile.write("LIBRARY IEEE; \n")
oFile.write("USE IEEE.std_logic_1164.all; \n")
oFile.write("Entity TB_LUT_SIN is \n")
oFile.write("\t\n")
oFile.write("END TB_LUT_SIN; \n")

oFile.write("Architecture Simulation of TB_LUT_SIN is \n")
oFile.write("\tComponent LUT_SIN\n")
oFile.write("\t\t port(\n")
# Definición del argumento X
oFile.write("\t\t\t X : in  std_logic_vector("+str(N-1)+" downto 0);\n")
# Definición del argumeto Y
oFile.write("\t\t\t Y : out std_logic_vector("+str(G-1)+" downto 0));")
oFile.write("\n\tend Component; \n")
oFile.write("\t signal X : std_logic_vector("+str(N-1)+" downto 0);\n")
oFile.write("\t signal Y : std_logic_vector("+str(G-1)+" downto 0)\n;")
oFile.write("BEGIN \n")
oFile.write("\t\t SIMBLK00: LUT_SIN PORT MAP(X,Y);\n")
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
  



