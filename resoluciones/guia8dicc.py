#EJERCICIO 19-----------------------------------DICCIONARIOS!

def agrupar_por_longitud(nombre_archivo:str) -> dict:
    archivo = open(nombre_archivo)
    linea:str = archivo.readline()
    palabras:[str] = []
    diccionario :dict = dict()

    while linea != "":
        palabras + lista_palabras(linea)
    
    for palabra in palabras:
        dict.add(len(palabra):mismo_len(len(palabra), palabras))

#ver como es la sintaxis,,, la idea está, las aux tienen que ser esas
