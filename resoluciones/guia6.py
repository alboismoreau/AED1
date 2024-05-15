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
        return 300 * altura #hacerlo usando min y max
    else:
        return 900 + 200 * (altura - 3)
    
def es_peso_util(peso:float) -> bool:
    return 400 <= peso <= 1000

def sirve_pino(altura:float) -> bool:
    return es_peso_util(peso_pino(altura))


# COSAS/APUNTES COPIADOS DE LA CLASE
x:int = peso_pino(10) 
print(x)

def esmultiplo(a:int,b:int):
    res:bool = (a % b == 0) # Se puede definir el resultado, sin nesecidad de un return.

# Se puede meter un if dentro del else como si fuesen guardas.