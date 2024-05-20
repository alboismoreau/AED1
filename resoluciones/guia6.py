import math

#EJERCICIO 1----------------------------------------------------------

def imprimir_hola_mundo()-> None:
    print("Hola Mundo")

imprimir_hola_mundo()
imprimir_hola_mundo()
print("hola")


def imprimir_un_verso() -> None:
    print("Esto""/n""es""/n""un""/n""verso")

def factorial_de_dos() -> int: 
    return 2 

def raiz_de_dos() -> float:
    return round (math.sqrt(2), 4)

#la formula del perimetro es 2 * pi
def perimetro()-> float:
    return 2 * math.pi


#EJERCICIO 2-----------------------------------------------------------

def imprimir_saludo(nombre: str) -> None:
    print ('Hola' ' ' + nombre)

def raiz_cuadrada_de(numero: float) -> float:
    return round (math.sqrt(numero), 4)

def farenheit_a_celcius(temp_faren: float) -> float:
    return (temp_faren - 32) * 0.555

def imprimir_dos_veces(estribillo: str) -> None:
    print (estribillo * 2)

def es_multiplo(n:int, m: int) -> bool:
    return n % m == 0

def es_par(numero:int) -> bool:
    return es_multiplo(numero, 2)

def cantidad_de_pizzas(comensales:int, min_cant_porciones:int) -> int:
    return math.ceil (comensales * min_cant_porciones / 8) # / es division con decimales, // lo redondea

#EJERCICIO 3---------------------------------------------------------------

def alguno_es_0(numero1:int, numero2:int) -> bool:
    return numero1 == 0 or numero2 == 0 

def ambos_son_0(numero1:int, numero2:int) -> bool:
    return numero1 == 0 and numero2 == 0

def es_nombre_largo(nombre:str) -> bool:
    return 3 <= len(nombre) <= 8

def es_bisiesto(año:int) -> bool:
    return (es_multiplo(año,400)) or (es_multiplo(año,4) and not es_multiplo(año,100))


#EJERCICIO 4----------------------------------------------------------------------

def peso_pino(altura:float) -> float:
    if altura <= 3:
        return 300 * altura 
    else:
        return 900 + 200 * (altura - 3)

def peso_pino2(altura:float) -> float:
    return min(altura,3) * 300 + max(0,altura-3) * 200 #otra forma de hacerlo usando min y max


def es_peso_util(peso:float) -> bool:
    return 400 <= peso <= 1000

def sirve_pino(altura:float) -> bool:
    return es_peso_util(peso_pino(altura))


# EJERCICIO 5------------------------------------------------------------------------

def el_rango(numero:int) -> None:
    if numero < 5:
        print("Menor a 5")
    if 10 <= numero <= 20:
        print("Entre 10 y 20")
    if numero > 20:
        print("Mayor a 20")

def vacaciones(edad:int,sexo:str) -> str:
    if edad < 18 or edad >= 65 and sexo == "M" or edad >= 60 and sexo == "F":
        return "Te vas de vacaciones"
    else:
        return "Agarra la pala"
    

#EJERCICIO 6-----------------------------------------------------------

def imprimir_1_10()-> None:
 x = 1
 while x <= 10: 
     print(x)
 x += 1

def imprimir_pares_10_40()-> None:
    x = 10
    while x <= 40:
        print(x)
        x += 2
    
def imprimir_eco_10_veces()-> None:
    i = 1
    while i <= 10:
        print("Eco")
        i += 1

def cuenta_regresiva(n:int) -> None:
    while n >= 1:
        print(n)
        n -= 1
    print("DESPEGUE")

def viaje_en_el_tiempo(año_partida:int,año_llegada:int) -> None:
    while año_partida > año_llegada:
        print ("Viajó un año al pasado. Estamos en el año: " + str(año_partida - 1))
        año_partida -= 1

def viaje_tiempo_aridtoteles(año_partida:int) -> None:
    while año_partida >= -364:
        print ("Viajó 20 años al pasado. Estamos en el año: " + str(año_partida - 20))
        año_partida -= 20


# EJERCICIO 7-----------------------------------------------------------------------------

def imprimir_1_10_7()-> None:
    for n in range (1,10+1,1):
        print(n)

def imprimir_pares_10_40_7() -> None:
    for n in range(10,40+1,2):
        print(n)

def imprimir_eco_10veces_7()-> None:
    for i in range (1,10+1,1):
        print("Eco")

def cuenta_regresiva_7(n:int)-> None:
    for i in range (n,1-1,-1):
        print(i)
    print("DESPEGUE")

def viaje_tiempo_7(año_partida:int,año_llegada:int)-> None:
    for n in range(año_partida -1, año_llegada-1, -1):
        print("Viajó 1 año al pasado. Estamos en el año: " + str(n))
    
def viaje_aristoteles_7(año_partida:int) -> None:
    for n in range (año_partida - 20, -384, -20):
        print("Viajó 20 años al pasado. Estamos en el año: " + str(n))

# COSAS/APUNTES COPIADOS DE LA CLASE
x:int = peso_pino(10) 
print(x)

def esmultiplo(a:int,b:int):
    res:bool = (a % b == 0) # Se puede definir el resultado, sin nesecidad de un return.

# Se puede meter un if dentro del else como si fuesen guardas.

'''comentar mucho codigo'''

'''completar ej 5(esta en la pc)'''