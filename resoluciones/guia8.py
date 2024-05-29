#EJERCICIO 1-------------------------------------------------------------------------------

def imprimir_archivo(nombre_archivo:str) -> int:
    archivo = open(nombre_archivo)
    contenido = archivo.read()
    print(contenido)

#1.1
    
def contar_lineas(nombre_archivo:str) -> int:
    archivo = open(nombre_archivo)
    lineas:int = 0
    
    while archivo.readline() != '':
            lineas += 1


    archivo.close()
    return lineas

#1.2
def existe_palabra(palabra:str, nombre_archivo:str) -> bool:
    archivo = open(nombre_archivo)
    
    for linea in archivo:
         if palabra in lista_palabras(linea):
              return True
    return False

    
def lista_palabras(linea:str) -> str:
    misPalabras = []
    palabraActual = ''

    for l in linea:
         if l != ' ' and l != '\n':
              palabraActual += l
         elif palabraActual != ' ':
              misPalabras.append(palabraActual)
              palabraActual = ''
    if palabraActual != '':
         misPalabras.append(palabraActual)
    return misPalabras


#1.3
def cantidad_apariciones(nombre_archivo:str, palabra:str) -> int:

    archivo = open(nombre_archivo)
    contador:int = 0
    linea = archivo.readline()


    while linea != '':
         for i in range(len(linea)):
              if palabra == linea[i]:
                   contador += 1
         linea = archivo.readline()
    
    archivo.close()
    return contador

#arreglar esta



    



    ''' 
    Probar ejecuar en terminal:
    archivo = open("miarchivo.txt")
    contenido = archivo.read()
    contenido
    print(contenido)
    --¿Què pasa con los saltos de línea?
    archivo.close()
    Hay que cerrarlo y volver a abrirlo para leerlo múltiplesz veces
    Si no lo cierro puede tener problemas
    
    '''