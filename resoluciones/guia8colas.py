
#EJERCICIO 13------------------------------------------------COLAS!!!

import random
from queue import Queue as Cola

def generar_nros_al_azar_cola(cantidad:int, desde:int, hasta:int) -> Cola:
    n:int = cantidad
    c = Cola()

    while n > 0:
        elemento = random.randint(desde, hasta)
        c.put(elemento)
        n -= 1

    return c

#Hago esta función que para algo va a servir más adelante    
def de_cola_a_lista(c:Cola) -> list:
    l:list = []
    while not c.empty():
        elemento = c.get()
        l.append(elemento)
    
    for i in l:
        c.put(i)

    return invertida(l)


def invertida(l:[int]) -> [int]:
    invertida:[int] = []
    i  = len(l) - 1
    while i >= 0:
        invertida.append(l[i])
        i -= 1
    return invertida
    

mi_colita = generar_nros_al_azar_cola(5, 1, 10)
print(de_cola_a_lista(mi_colita))

#EJERCICIO 14----------------------------------------------------------

def cantidad_elementos_cola(c:Cola) -> int:
    copia:list = []
    res:int = 0
    while not c.empty():
        elemento = c.get()
        copia.append(elemento)
        res += 1
    
    for i in copia:
        c.put(i)
    
    return res

print(cantidad_elementos_cola(mi_colita))



#EJERCICIO 15---------------------------------------------------------

def buscar_maximo_lista(l:[int]) -> int: 
    res:int = l[0]
    for n in l:
        if n >= res:
            res = n

    return res 

def buscar_maximo_cola(c:Cola(int)) -> int:
    l = de_cola_a_lista(c)
    return buscar_maximo_lista(l)

print(buscar_maximo_cola(mi_colita))

#EJERCICIO 16----------------------------------------------------------

def pertenece1(s:list, e) -> bool: 
    i:int = 0 
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False

def de_lista_a_cola(l:list) -> Cola():
    c = Cola()
    for i in range (len(l) - 1, 0 - 1, -1):
        c.put(l[i])
    return c

def armar_secuencia_bingo1() -> Cola(int):  # fijarse si hay una implementacion menos trabajosa 
    
    l:[int] = []

    while len(l) < 100:
       num = random.randint(0,99)
       if not pertenece1(l,num):
           l.append(num)

    return de_lista_a_cola(l) 

# Claramente había una implementación más práctica usando random.shuffle()

def armar_secuencia_bingo2() -> Cola(int):
    secuencia: Cola = Cola()
    elementos:list(int) = list(range(100)) # Pero se puede usar range()? igualmente sería una lista del 0 al 99
    random.shuffle(elementos)

    for elemento in elementos:
        secuencia.put(elemento)
    return secuencia

print(de_cola_a_lista(armar_secuencia_bingo2()))

