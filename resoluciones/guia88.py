#EJERCICIO 8------------------------------------------------------PILAS!!!!!!!!!!

from queue import LifoQueue as Pila
import random

def generar_nros_azar_pila(cantidad:int, desde:int, hasta:int) -> Pila:
     p = Pila()
     n = cantidad
     while n > 0:
          nro:int = random.randint(desde, hasta)
          p.put(nro)
          n -= 1
     return p


#Función para imprimir pilas

def imprimir_pila(p:Pila[int]) -> None:
    l:[int] = []
    while not p.empty():
         elemento = p.get()
         l.append(elemento)

    res = invertida(l)
    for i in res:
        p.put(i) 

    print(res)
    

def invertida(l:[int]) -> [int]:
    invertida:[int] = []
    i  = len(l) - 1
    while i >= 0:
        invertida.append(l[i])
        i -= 1
    return invertida

#EJERCICIO 9----------------------------------------------------------------
     
def cantidad_elementos_pila(p:Pila[int]) -> int:
     res:int = 0
     copia:Pila[int] = Pila()

     while not p.empty():
          copia.put(p.get())
     
     while not copia.empty():
          copia.get()
          res += 1
     
     while not copia.empty():
          p.put(copia.get())

     return res


mi_pilita:Pila = generar_nros_azar_pila(5, 1, 10)
imprimir_pila(mi_pilita)
 
 #print(cantidad_elementos_pila(mi_pilita))


#EJERCICIO 10--------------------------------------------------------------------------

def buscar_maximo_lista(l:[int]) -> int:
    res:int = 0
    for n in l:
        if n >= res:
            res = n

    return res 

def buscar_maximo(p:Pila) -> int:
 l:[int] = []
 
 while not p.empty():
  elemento = p.get()
  l.append(elemento)

 for i in invertida(l):
     p.put(i)   
       #Para que no me modifique el parámetro de entrada
 

 return buscar_maximo_lista(l)  #No está especificado pero si se le pasa una lista vacía va a devolver res = 0.
 


#EJERCICIO 13------------------------------------------------COLAS!!!

from queue import Queue as Cola

def generar_nros_al_azar_cola(cantidad:int, desde:int, hasta:int) -> Cola:
    n:int = cantidad
    c = Cola()

    while n > 0:
        elemento = random.randint(desde, hasta)
        c.put(elemento)
        n -= 1

    return c
    
