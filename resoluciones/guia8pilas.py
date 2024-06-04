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

def de_pila_a_lista(p:Pila) -> None:
    l:[int] = []
    while not p.empty():
         elemento = p.get()
         l.append(elemento)

    res = invertida(l)
    for i in res:
        p.put(i) 

    return res
    

def invertida(l:[int]) -> [int]:
    invertida:[int] = []
    i  = len(l) - 1
    while i >= 0:
        invertida.append(l[i])
        i -= 1
    return invertida



#EJERCICIO 9----------------------------------------------------------------
     
def cantidad_elementos_pila(p:Pila) -> int:
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
print(de_pila_a_lista(mi_pilita))
print(cantidad_elementos_pila(mi_pilita))

