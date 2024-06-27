number = 28961
print(number)
for i in range(0,5):
    aux = int(number/10**i)
    d = int(aux%10)
    print(str(aux)+" %10 = "+str(d))