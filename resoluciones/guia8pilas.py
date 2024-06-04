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
#print(cantidad_elementos_pila(mi_pilita))


#EJERCICIO 10---------------------------------------------------------------
'''
def buscar_maximo_pila(p:Pila(int)) -> int: 
    return buscar_maximo_lista(de_pila_a_lista(p))

def buscar_maximo_lista(l:[int]) -> int: #Asumo que no le vas a pedir el máximo de una pila vacía
    res:int = l[0]
    for n in l:
         if n >= res:
              res = n
    return res

print(buscar_maximo_pila(mi_pilita))

''' #Preguntar por qué esta no me funciona si con colas sí me funciona
         
#EJERCICIO 11-----------------------------------------------------------

def formula_bien_balanceada(formula: str) -> bool:

    p:Pila[str] = Pila()

    for c in formula:
        if c == "(" or c == ")":
            p.put(c)
    
    n: int = 0

    while not p.empty() and n >= 0:
         parentesis = p.get()

         if parentesis == ')':
              n += 1
         elif parentesis == '(':
              n -= 1

    return n == 0
            
'''print(
    formula_bien_balanceada("3*(5*5)-(5-4)"),
    formula_bien_balanceada("7((3/7)"),
    formula_bien_balanceada("(10*(-1)))"),
    formula_bien_balanceada("(4*(-1)))"),
    formula_bien_balanceada("))9+7((")
)
'''
#EJERCICIO 12-----------------------------------------------------------------

def evaluar(formula: str) -> int:
    res: Pila(float) = Pila()
    operando_actual:str = ""


    for i in formula:

        if i != ' ' and i != '+' and i != '-' and i != '*' and i != '/' :
            operando_actual += i

        elif i == ' ' and operando_actual != "":
            numero = float(operando_actual) 
            res.put(numero)
            operando_actual = ""
        
        elif i == '+':
            res.put(res.get() + res.get())
        elif i == "-":
            res.put(-res.get() + res.get())
        elif i == "*":
            res.put(res.get() * res.get())
        elif i == "/":
            res.put((1/res.get()) / res.get())

    return res.get()


#print(evaluar("3 4 + 5 * 2 -"))

