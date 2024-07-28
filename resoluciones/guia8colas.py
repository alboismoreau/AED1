
#EJERCICIO 13------------------------------------------------COLAS

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
#función para imprimir colas

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
    elementos:list(int) = list(range(100)) 
    random.shuffle(elementos)

    for elemento in elementos:
        secuencia.put(elemento)
    return secuencia

#print(de_cola_a_lista(armar_secuencia_bingo2()))

def jugar_carton_de_bingo(carton:[int], bolillero:Cola(int)) -> int:
    res:int = 0
    n:int = len(carton)
    while n > 0:
        bolilla:int = bolillero.get()
        if pertenece1(carton, bolilla): 
            n -= 1
        res += 1
    return res 

    

#b = armar_secuencia_bingo2()
#print(de_cola_a_lista(b))
#mi_carton = [1, 2, 3, 4]
#print(jugar_carton_de_bingo(mi_carton, b))


#EJERCICIO 17------------------------------------------------------------------

def n_pacientes_urgentes1(c:Cola([int,str,str])) -> int:
    lista_de_espera:[(int, str, str)] = []

    while not c.empty():
        lista_de_espera.append(c.get())
    
    for terna in lista_de_espera:
        c.put(terna)

    res:int = 0
    for terna in lista_de_espera:
        if terna[0] == 1 or terna[0] == 2 or terna[0] == 3:
            res += 1

    return res

# Se puede hacer más facil de esta forma sin necesidad de definir una lista
# Pero tener en cuenta de que así modifica el parámetro de entrada (cola)

def n_pacientes_urgentes2(c: Cola((int,str,str))) -> int:
    res:int = 0
    while not c.empty():
        terna = fila.get()
        if terna[0] == 1 or terna[0] == 2 or terna[0] ==  3:
            res += 1
    return res


#EJERCICIO 18------------------------------------------------------------

def atencion_a_clientes(c:Cola((str,int,bool,bool))) -> Cola((str,int,bool,bool)):

    fila:list[(str,int,bool,bool)] = []
    prioridad:list[(str,int,bool,bool)] = []
    preferencial:list[(str,int,bool,bool)] = []
    notiene:list[(str,int,bool,bool)] = []

    while not c.empty():
        cliente = c.get()
        fila.append(cliente)

    for i in fila:
        c.put(i)
    
    for cliente in fila:
        if cliente[2]:
            prioridad.append(cliente)
        elif cliente[3]:
            preferencial.append(cliente)
        else:
            notiene.append(cliente)

    lista_final:list[(str,int,bool,bool)] = prioridad + preferencial + notiene
    cola_final:Cola((str,int,bool,bool)) = Cola()

    for cliente in lista_final:
        cola_final.put(cliente)

    return cola_final
    

    
