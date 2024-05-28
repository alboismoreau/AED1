
import random

#EJERCICIO 1---------------------------------------

#1.1

def pertenece1(s:list, e) -> bool: # lo dejo sin tipos para usarla como aux más adelante
    i:int = 0 
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False

def pertenece2(s:[int], e:int) -> bool:
    for i in range(0,len(s),1):
        if s[i] == e:
            return True
    return False

#1.2

def divide_a_todos1(s:[int], e:int) -> bool:
    for i in range(0, len(s), 1):
        if (not(s[i] % e == 0)):
            return False
    return True


def divide_a_todos2(s:[int], e:int) -> bool:
    i:int = 0
    while i < len(s):
        if (not(s[i] % e == 0)):
            return False
        i += 1
    return True

#1.3

def suma_total1(s:[int]) -> int:
    res = 0 
    for i in range(0,len(s)):
        res = res + s[i]
    return res
        
def suma_total2(s:[int]) -> int:
    res = 0
    i = 0
    while i < len(s):
        res += s[i]
        i += 1
    return res

def suma_total3(s:[int]) -> int:
    res = 0
    i = 0
    while i < len(s):
        res = res + s[i]
        i += 1
    return res

#1.4        
def ordenados2(s:[int]) -> bool:
    i = 0
    while (i < len(s)-1):
        if (not(s[i] <= s[i + 1])):
            return False
        i += 1
    return True
    

def ordenados3(s:[int]) -> bool:
    indice: int = 0 
    while indice < len(s) - 1 and s[indice] <= s[indice +1]:
      indice += 1
    return indice == len(s) -1


#1.5 

def hay_palabras_largas1(lista:[str]) -> bool:
    for i in range(0,len(lista)):
        if len(lista[i]) > 7:
            return True
    return False
    

def hay_palabras_largas2(lista:[str]) -> bool:
    i:int = 0 
    while i < len(lista):
        if len(lista[i]) > 7:
            return True
        i += 1
    return False

#1.6

def es_palindromo(texto:str) -> bool:
    if texto == inversa1(texto):
       res = True
    else:
       res = False
    return res 

def inversa1(texto:str) -> str:
    invertida:str = ""
    i  = len(texto) - 1
    while i >= 0:
        invertida += texto[i]
        i -= 1
    return invertida

def inversa2(texto:str) -> str:
    invertida:str = ""
    for i in range(len(texto) -1 , 0 - 1 , -1):
        invertida += texto[i]
    return invertida


#1.7

def fortaleza1(contraseña:str) -> bool:
    res:str = "AMARILLO"

    tiene_minuscula:bool = False
    tiene_mayuscula:bool = False
    tiene_numero:bool = False

    for letra in contraseña:
        if 'a' <= letra <= 'z':
            tiene_minuscula = True
        if 'A' <= letra <= 'Z':
            tiene_mayuscula = True
        if '0' <= letra <= '9':
            tiene_numero = True


    if  tiene_mayuscula and tiene_minuscula and tiene_numero:
        res = "VERDE"
    elif len(contraseña) < 5: 
        res = "ROJA"
     
    return res


'''
Esta es otra opcion con funciones auxiliares pero no conviene porque:
-Nunca hay que repetir código
-Tarda mucho más en procesarse
Si hiciese una función que compacte las tres auxiliares en una sola,
no estaría repitiendo código pero tarda lo mismo en procesarse.

También para usar el código ASCII se podría hacer usando la funcion ord('caracter')
'''

def fortaleza2(contraseña:str) -> str:
    if len(contraseña) < 5:
      return 'ROJA'
    elif tiene_minuscula(contraseña) and tiene_mayuscula(contraseña) and tiene_numero(contraseña):
      return 'VERDE'
    else:
      return'AMARILLA'


def tiene_minuscula(contraseña:str) -> bool:
    res = False
    for letra in contraseña:
        if 'a' <= letra <= 'z':
            res = True
    return res

def tiene_mayuscula(contraseña:str) -> bool:
    res = False
    for letra in contraseña:
        if 'A' <= letra <= 'Z':
            res = True
    return res

def tiene_numero(contraseña:str) -> bool:
    res = False
    for letra in contraseña:
        if '0' <= letra <= '9':
            res = True
    return res



#1.8 ambas funcionan, me quedo con la primera

def cuenta_bancaria1(lista_operaciones:[(chr,int)]) -> int:
    saldo:int = 0 
    for tupla in lista_operaciones:
        if tupla[0] == 'I':
            saldo += tupla[1]
        if tupla[0] == 'R':
            saldo -= tupla[1]

    return saldo

def cuenta_bancaria2(lista_operaciones:[(chr,int)]) -> int:
    saldo:int = 0
    i = 0
    while i < len(lista_operaciones):
        if lista_operaciones[i][0] == 'I':
            saldo += lista_operaciones[i][1]
        if lista_operaciones[i][0] == 'R':
            saldo -= lista_operaciones[i][1]
        i += 1

    return saldo


#1.9

def tres_vocales_distintas(palabra:str) -> bool:
    tieneA:int = 0
    tieneE:int = 0 
    tieneI:int = 0
    tieneO:int = 0
    tieneU:int = 0
    for letra in palabra:
        if letra == 'a' or letra == 'A':
            tieneA = 1
        if letra == 'e' or letra == 'E':
            tieneE = 1
        if letra == 'i' or letra == 'I':
            tieneI = 1
        if letra == 'o' or letra == 'O':
            tieneO = 1
        if letra == 'u' or letra == 'U':
            tieneU = 1
    return tieneU + tieneO + tieneI + tieneE + tieneA >= 3

        

# EJERCICIO 2---------------------------------------------------------------------

#2.1
def cero_en_posicion_par_inout(l:[int]) -> None:
    for i in range(len(l)):
        if l[i] % 2 == 0:
            l[i] = 0
    return l 

#2.2
def cero_en_posicion_par_in(l:[int]) -> [int]:
    output:[int] = []
    for i in range(len(l)):
        if l[i] % 2 == 0:
            output.append(0)
        else:
            output.append(l[i]) 
    return output


#2.3
def sacar_vocales(l:[chr]) -> [chr]:
    output:[chr] = []
    vocales = ['a','e','i', 'o', 'u', 'A','E', 'I', 'O', 'U']

    for i in range(len(l)):
        if not(pertenece1(vocales, l[i] )):
            output.append(l[i])

    return output


#2.4
def reemplaza_vocales(s:[chr]) -> [chr]:
    res:[chr] = []
    vocales = ['a','e','i', 'o', 'u', 'A','E', 'I', 'O', 'U']
    for i in range(len(s)):
        if pertenece1(vocales , s[i] ):
            res.append('_')
        else:
            res.append(s[i])
    return res # checkear esta

#2.5
def da_vuelta_str(s:[chr]) -> [chr]:
    res:[chr] = []
    for i in range (len(s) - 1, 0 - 1, -1):
        res.append(s[i])
    
    return res

#2.6
def eliminar_repetidos(s:[chr]) -> [chr]:
    res:[chr] = []
    for i in range(len(s)):
        if not(pertenece1(res, s[i] )):
            res.append(s[i])
    return res 


#EJERCICIO 3--------------------------------------------------------------------

def aprobado(notas:[int]) -> int:
    if todas_mayores_a_4(notas) and promedio(notas) >= 7:
        res = 1
    elif todas_mayores_a_4(notas) and 4 <= promedio(notas) < 7:
        res = 2
    elif not( todas_mayores_a_4(notas)) or promedio(notas) < 4:
        res = 3
    return res


def todas_mayores_a_4(notas:[int]) -> bool:
    for n in notas:
        if n >= 4:
            return True
        return False

def promedio(notas:[int]) -> int:
    suma = 0 
    for i in range(len(notas)):
        suma += notas[i]
    return (suma / len(notas))


#EJERCICIO 4-----------------------------------------------------------------------

#4.1
def lista_estudiantes() -> [str]:

    res:[str] = []
    nombre:str = ""

    while nombre != "Listo":
        nombre = input("Ingrese nombre del alumno: ")

        if nombre != "Listo":
            res.append(nombre)
        
    return res

#4.2
def historial_sube() -> [(str,int)]:

    monto:int = 0
    operacion:str = ""
    saldo:int = 0
    historial:[(str,int)] = []

    while operacion != "X":
        operacion = input("Ingresar operacion. 'C' (cargar), 'D' (descontar), 'X' (finalizar programa): ")

        if operacion == "C":
            monto = int(input("Ingrese monto a acreditar: "))
            saldo += monto
            historial.append((operacion,monto))

        elif operacion == "D":
            monto = int(input("Ingrese monto a descontar: "))
            saldo -= monto
            historial.append((operacion,monto))

        elif operacion == "X":
            print("Tu saldo es de " + str(saldo) + " pesos")
            print("Historial de operaciones:")
            return historial


#4.3
def siete_y_medio()-> [(str,int)]:

    total:float = 0
    opcion:str = ""
    historial:[int] = []
    numero:float = 0

    while opcion != "X" and total < 7.5:

        opcion = input("Presione 'C' para sacar una carta o 'X' para plantarse: ")

        if opcion == "C":
            numero = random.choice([1, 2, 3, 4, 5, 6, 7, 10, 11, 12])
            print("Sacaste un: " + str(numero))

            if numero < 10: 
                total += numero
            else:
                total += 0.5
            print("Total: "+ str(total))
            
            historial.append(numero)
        
    if opcion == "X":
        print("Usted se planta con " + str(total) + " puntos")
        print("Historial: ")
        return historial
        
    if total >= 7.5:
        print("Usted pierde")
        print("Historial: ")
        return historial


#EJERCICIO 5--------------------------------------------------------------------

#5.1, 5.2
def pertenece_a_cada_uno_version_1(s:[[int]], e:int) -> [bool]:
    res:[bool] = []
    for i in s:
        res.append(pertenece1(i, e))
    return res


#5.3
def es_matriz(s:[[int]]) -> bool:
    for i in range(len(s)):
        if len(s[0]) != len(s[i]):
            return False
        if len(s[0]) < 1:
            return False
    return True


#5.4 
def filas_ordenadas(matriz:[[int]], res:[bool]) -> None:
    res:[bool] = []
    for fila in matriz:
        res.append( ordenados2(fila))
    print(res)


#5.5
import numpy as np
def elevarMatriz(dimension:int, potencia:int)-> [[int]]:
    matriz = np.random.randint(0, 10, (dim,dim))

    return np.linalg.matrix_power(matriz, potencia)

