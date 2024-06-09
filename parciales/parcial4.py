'''
1) Índice de la n-ésima aparición [2 puntos]
Implementar la función ind_nesima_aparicion que dada una secuencia de enteros s, y dos enteros n y elem devuelve 
la posición en la cual elem aparece por n-ésima vez en s. En caso de que elem aparezca menos de n veces en s, devolver -1.

problema ind_nesima_aparicion (in s: seq⟨Z⟩, in n: Z, in elem: Z) : Z {
  requiere: {n>0}
  asegura: {Si el elemento aparece menos de n veces en la secuencia, res= -1 }
  asegura: {Si el elemento aparece al menos n veces en la secuencia, s[res] = elem }
  asegura: {Si el elemento aparece al menos n veces en la secuencia, elem aparece n-1 veces en s entre las posiciones 0 y res-1 }

Por ejemplo, dadas
s = [-1, 1, 1, 5, -7, 1, 3]
n = 2
elem = 1
se debería devolver res = 2
-------------------------------------------------------------------------

2) Mezclar [2 puntos]
Implementar la función mezclar que dadas dos listas s1 y s2 con igual cantidad de elementos devuelva una 
lista con los elementos intercalados. Esto es, las posiciones pares de res tendrán los elementos de s1 y las posiciones 
impares los elementos de s2, respetando el orden original.
problema mezclar (in s1: seq⟨Z⟩, in s2: seq⟨Z⟩) : seq⟨Z⟩ {
  requiere: {|s1| = |s2| }
  asegura: {|res| = 2 * |s1|}
  asegura: {res[2*i] = s1[i] y res[2*i+1] = s2[i], para i entre 0 y |s1|-1}
TIP: realizar la iteración mediante índices y no mediante elementos

Por ejemplo, dadas
s1 = [1, 3, 0, 1]
s2 = [4, 0, 2, 3]
se debería devolver res = [1, 4, 3, 0, 0, 2, 1, 3]

-------------------------------------------------------------------------------
3) A los pingos: resultado carreras [3 puntos]
Implementar la función frecuencia_posiciones_por_caballo que dada la lista de caballos que corrieron las carreras, 
y el diccionario que tiene los resultados del hipódromo en el formato carreras:posiciones_caballos, 
donde carreras es un String y posiciones_caballos es una lista de strings con los nombres de los caballos, 
genere un diccionario de caballos:#posiciones, que para cada caballo devuelva la lista de cuántas veces salió en esa posición.

Tip: para crear una lista con tantos ceros como caballos se puede utilizar la siguiente sintaxis lista_ceros = [0]*len(caballos)
problema frecuencia_posiciones_por_caballo(in caballos: seq⟨String⟩, in carreras: dict⟨String,seq⟨String⟩⟩: dict⟨String,seq⟨Z⟩⟩ {
  requiere: {caballos no tiene repetidos}
  requiere: {Los valores del diccionario carreras son permutaciones de la lista caballos 
  (es decir, tienen exactamente los mismos elementos que caballos, en cualquier orden posible)}
  asegura: {res tiene como claves los elementos de caballos}
  asegura: {El valor en res de un caballo es una lista que indica en la posición i cuántas veces salió ese caballo en la 
  i-ésima posición.}

Por ejemplo, dados
caballos= ["linda", "petisa", "mister", "luck" ]
carreras= {"carrera1":["linda", "petisa", "mister", "luck"],
                  "carrera2":["petisa", "mister", "linda", "luck"]}
se debería devolver res = {"petisa": [1,1,0,0],
                                 p         "mister": [0,1,1,0],
                                          "linda": [1,0,1,0],
                                          "luck": [0,0,0,2]}

----------------------------------------------------------------------------------

4) Matriz capicúa [3 puntos]
Implementar la función matriz_capicua que dada una matriz devuelve True si cada una de sus filas es capicúa. 
Es decir, si cada fila es igual leída de izquierda a derecha o de derecha a izquierda. 
Definimos a una secuencia de secuencias como matriz si todos los elemento de la primera secuencia tienen la misma longitud.

problema matriz_capicua(in m:seq⟨seq⟨Z⟩⟩ ) : Bool {
  requiere: {todos los elementos de m tienen igual longitud (los elementos de m son secuencias)}
  asegura: {(res = true) <=> todos los elementos de m son capicúa}

Por ejemplo, dada la matriz
m = [[1,2,2,1],[-5,6,6,-5],[0,1,1,0]]
se debería devolver res = trued

'''


#EJERCICIO 1-------------------------------------------------------------------------
def ind_nesima_aparicion(s:[int], n:int, elem:int) -> int:
    i:int = 0
    m:int = 0
    res:int = -1
    while m < n and i < len(s):
        if s[i] == elem:
            m += 1
        i += 1
    if m == n:
        res = i - 1
    return res
    
s = [-1, 1, 1, 5, -7, 1, 3]
n = 2
elem = 1
#se debería devolver res = 2
#print(ind_nesima_aparicion(s,n,elem))

#EJERCICIO 2------------------------------------------------------------------------
def mezclar(s1:[int], s2:[int]) -> [int]:
    res: [int] = []
    for i in range(len(s1)):
        res.append(s1[i])
        res.append(s2[i])
    return res

s1 = [1, 3, 0, 1]
s2 = [4, 0, 2, 3]
#se debería devolver res = [1, 4, 3, 0, 0, 2, 1, 3]
#print(mezclar(s1,s2))

#EJERCICIO 3------------------------------------------------------------------------

caballos= ["linda", "petisa", "mister", "luck" ]
carreras= {"carrera1":["linda", "petisa", "mister", "luck"],
                  "carrera2":["petisa", "mister", "linda", "luck"]}
#se debería devolver res = {"petisa": [1,1,0,0],"mister": [0,1,1,0],"linda": [1,0,1,0], "luck": [0,0,0,2]}
def frecuencia_posiciones_por_caballo(caballos:[str], carreras:dict) -> dict:
    res: dict[str,list[int]] = {}
    for caballo in caballos:
            res[caballo] = [0] * len(caballos)
            for carrera in carreras.keys():
                 l = carreras[carrera]
                 for i in range(len(l)):
                      if l[i] == caballo:
                           res[caballo][i] += 1
    return res

#print(frecuencia_posiciones_por_caballo(caballos,carreras))
#Me parece que este tipo de implementación de meter ciclos adentro dde ciclos no pinta nada asi que lo hago de nuevo
#(Tambien tener en cuenta para el punto cuatro de parcial1.py que es igual a este)

#EJERCICIO 4-------------------------------------------------------------------------
def capicua(l:[int]) -> bool:
     i : int = 0
     j : int = len(l) - 1
     res: bool = True
     while i < len(l) and j >= i:
          if l[i] != l[j]:
               res = False
          i += 1
          j -= 1
     return res

def matriz_capicua(m:[[int]]) -> bool:
     res:bool = True
     for fila in m:
          if not(capicua(fila)):
               res = False

     return res

'''
m1 = [[1,2,2,1],[-5,6,6,-5],[0,1,1,0]]
m2 = [[1,2,3,1],[-5,6,6,-5],[0,1,1,0]]
m3 = [[1,2,2,1],[-5,6,6,-5],[0,1,1,1]]
print(matriz_capicua(m1),
      matriz_capicua(m2),
      matriz_capicua(m3))
'''