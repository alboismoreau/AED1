
#Función tipo split, se pueden agregar más parametros de entrada como token 

def no_es_split(linea:str, token:str) -> [str]:
    mis_palabras: list[str] = []
    palabra_actual: str = ""
    for letra in linea:
        if letra != token:
            palabra_actual = palabra_actual + letra
        else:
            if palabra_actual != "":
                mis_palabras.append(palabra_actual)
                palabra_actual = ""
    if palabra_actual != "":
        mis_palabras.append(palabra_actual)
    return mis_palabras

#print(no_es_split("Hola mundo", " "))

#EJERCICIO 19-------------------------------------------------DICT!!

def separar_en_palabras(linea:str) -> str:
    misPalabras:[str] = []
    palabraActual:str = ''

    for l in linea:
         if l != ' ' and l != '\n':
              palabraActual += l
         else:
              misPalabras.append(palabraActual)
              palabraActual = ''
    if palabraActual != '':
         misPalabras.append(palabraActual)
    return misPalabras


def agrupar_por_longitud1(nombre_archivo:str) -> dict:

    archivo = open(nombre_archivo, "r", encoding = 'UTF-8')
    texto:str = archivo.read()
    archivo.close()
    palabras:[str] = separar_en_palabras(texto)
    diccionario:dict[int,int] = {}
    
   
    for palabra in palabras:
        clave:int = len(palabra)
        if clave in diccionario:
            diccionario[clave] += 1
        else:
            diccionario[clave] = 1 
       
    return diccionario


#Voy a hacer la misma pero en vez de recibir un archivo recibe str
#Y pruebo de usar la función no_es_split() de paso

def agrupar_por_longitud(linea: str) -> dict:
    diccionario:dict[int,int] = {}
    palabras:list[str] = no_es_split(linea, " ")

    for palabra in palabras:
        clave:int = len(palabra)
        if clave in diccionario.keys(): 
            diccionario[clave] += 1
        else:
            diccionario[clave] = 1 
       
    return diccionario


#print(agrupar_por_longitud("hola mundo compu"))
#print(agrupar_por_longitud1("archivo.txt"))


#EJERCICIO 20------------------------------------------------------------------

def calcular_promedio_por_estudiante(nombre_archivo_notas:str) -> dict:
     archivo = open(nombre_archivo_notas, "r", encoding = 'UTF-8')
     lineas = archivo.readlines()
     archivo.close()
     diccionario: dict[str,float] = {}

     for linea in lineas:
          linea_ordenadas:[str] = split_linea_csv(linea)
          lu = linea_ordenadas[0] 
          diccionario[lu] = promedio_estudiante(nombre_archivo_notas, lu)

     return diccionario


def promedio_estudiante(nombre_archivo:str, lu:str) -> float:
     archivo = open(nombre_archivo, "r", encoding = 'UTF-8')
     lineas:[str] = archivo.readlines()
     archivo.close()
     sumatoria_notas:float = 0
     cantidad_notas:int = 0

     for linea in lineas:
          l = split_linea_csv(linea) 
          if l[0] == lu:
               sumatoria_notas += float(l[3])
               cantidad_notas += 1

     return (sumatoria_notas / cantidad_notas) 


def split_linea_csv(linea:str) -> [str]:
     elemento = '' 
     res:[str] = []

     for c in linea:
          if c != ',' and c != '\n':
               elemento += c
          else:
               res.append(elemento)
               elemento = ''

     if elemento != '':
          res.append(elemento)

     return res

#print(calcular_promedio_por_estudiante("notas.csv")) 



#EJERCICIO 21------------------------------------------------------------

def palabra_mas_frecuente(nombre_archivo:str) -> str:

    archivo = open(nombre_archivo, "r", encoding = 'UTF-8')
    texto:str = archivo.read()
    archivo.close()
    lista_de_palabras:list[str] = separar_en_palabras(texto)
    diccionario:dict[str, int] = {}

    for palabra in lista_de_palabras:
        if palabra in diccionario.keys():
            diccionario[palabra] += 1
        else:
            diccionario[palabra] = 1

    frecuencia:int = 0
    res:str = ""

    for palabra, n in diccionario.items(): #Prestar atención a esta forma
        if n >= frecuencia:
            frecuencia = n
            res = palabra

    return res

#print(palabra_mas_frecuente("archivo.txt"))

#Para sacar elementos de un diccionario no está permitido usar del() pero si pop(clave)

#EJERCICIO 22---------------------------------------------------------------

from queue import LifoQueue as Pila

historiales: dict = {}

def visitar_sitio(historiales:dict, usuario:str, sitio:str) -> None:
    if usuario in historiales.keys():
        historiales[usuario].put(sitio)
    else:
        historiales[usuario]: Pila[str] = Pila[sitio]
    
    return historiales


#Cambiar la pila por lista para probar con los siguientes casos
#print(visitar_sitio(historiales, "anita", "Sitio1"))
#print(visitar_sitio(historiales, "marcos", "Sitio1"))
#print(visitar_sitio(historiales, "anita", "Sitio3"))
#print(visitar_sitio(historiales, "marcos", "Sitio2"))

def navegar_atras1(historiales:dict, usuario:str) -> None:
    if usuario in historiales.keys():
        p:Pila[str] = historiales[usuario]
        ultimo_sitio:str = p.get()
        sitio_anterior:str = p.get()
        p.put(sitio_anterior)
        p.put(ultimo_sitio)
        p.put(sitio_anterior)

    return historiales

def navegar_atras(historiales:dict, usuario:str) -> None:
    if usuario in historiales.keys():
        p:[str] = historiales[usuario]
        p.append(p[len(p)-2])

    return historiales

#print(navegar_atras(historiales, "anita"))
#print(navegar_atras(historiales, "marcos"))


#EJERCICIO 23------------------------------------------------------------------

inventario: dict = {}

def agregar_producto(inventario:dict, nombre:str, precio:float, cantidad:int) -> None:
    inventario[nombre] : dict[str, float] = {'precio' : precio, 'cantidad': cantidad }  
    return inventario

#print(agregar_producto(inventario, "camisa", 55.5, 10))
#print(agregar_producto(inventario, "pantalon", 89.99, 5))


def actualizar_stock(inventario:dict, nombr:str, cant:int) -> None:
    if nombr in inventario.keys():
        d : dict = inventario[nombr] 
        d['cantidad'] = cant

    return inventario

#print(actualizar_stock(inventario, "camisa", 1))

def actualizar_precios(inventario:dict, nombr:str, prec:float) -> None:
    if nombr in inventario.keys():
        d : dict = inventario[nombr] 
        d['precio'] = prec

    return inventario

#print(actualizar_precios(inventario, "pantalon", 100.00))

def calcular_valor_inventario(inventario:dict) -> float:
    total:int = 0
    for producto in inventario:
        info:dict = inventario[producto] 
        total += info['cantidad'] * info['precio']
    return total

#print(calcular_valor_inventario(inventario))