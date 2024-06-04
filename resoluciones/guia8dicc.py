#EJERCICIO 19-----------------------------------DICCIONARIOS!
'''
def agrupar_por_longitud(nombre_archivo:str) -> dict:

    archivo = open(nombre_archivo, "r", encoding = 'UTF-8')
    linea:str = archivo.readline()
    palabras:List[str] = []
    apariciones:List[(int, int)] = []

    while linea != "":
        palabras + lista_palabras(linea)

    archivo.close()
    
    for palabra in palabras:
        apariciones.append(len(palabra), mismo_largo(len(palabra), palabras))
    
    res: dict = dict(apariciones)
    return res


def mismo_largo(largo:int, palabras:[str]) -> int:
    res:int = 0
    for  palabra in palabras:
        if len(palabra) == largo:
            res += 1
    return res


def lista_palabras(linea:str) -> [str]:
    palabra_actual:str = ""
    mis_palabras:List[str] = []

    for c in linea:
        if c != '\n' and c != ' ':
            palabra_actual += c

        elif c == ' ':
            mis_palabras.append(palabra_actual)
            palabra_actual = ""

    if palabra_actual != '':
         mis_palabras.append(palabra_actual)

    return mis_palabras

'''

# print(separar_palabras("Hola mundo", " "))
def agrupar_por_longitud(linea: str) -> dict((int,int)):
    res:dict[int,int] = dict()
    # a partir del texto, creamos una lista de palabras
    palabras:list[str] = separar_palabras(linea, " ")
    for palabra in palabras:
        longitud:int = len(palabra)
        if longitud in res.keys():
            res[longitud] = res[longitud] + 1
        else:
            res[longitud] = 1   
       
    return res

# {4: ["Hola"], 5: ["mundo", "compu"]}
def agrupar_por_longitud2(linea: str) -> dict(int,list[str]):
    res:dict[int,list[str]] = dict()
    # a partir del texto, creamos una lista de palabras
    palabras:list[str] = separar_palabras(linea, " ")
    for palabra in palabras:
        longitud:int = len(palabra)
        if longitud in res.keys():
            res[longitud].append(palabra)
        else:
            res[longitud] = [palabra]
    return res

print(agrupar_por_longitud("Hola mundo compu"))
print(agrupar_por_longitud2("Hola mundo compu"))


#EJERCICIO 22----------------------------------------------------------
from queue import LifoQueue as Pila

historiales : dict(str, Pila[str]) = {}

def visitar_sitio(historiales: dict(str,Pila[str]), usuario:str, sitio:str) -> None:
    if usuario not in historiales:
        historiales[usuario] = Pila()
    historiales[usuario].put(sitio)