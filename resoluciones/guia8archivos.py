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
         else:
              misPalabras.append(palabraActual)
              palabraActual = ''
    if palabraActual != '':
         misPalabras.append(palabraActual)
    return misPalabras


#1.3
def cantidad_apariciones(nombre_archivo:str, palabra:str) -> int:
    archivo = open(nombre_archivo)
    contador:int = 0

    for linea in archivo: 
         contador += cuantas_repeticiones_palabra_en_linea(linea, palabra)
    archivo.close()
    return contador

def cuantas_repeticiones_palabra_en_linea(linea:str, s:str) -> int:
    res = 0
    l = lista_palabras(linea)

    for palabra in l:
         if palabra == s:
              res += 1       
    return res
              

#EJERCICIO 2------------------------------------------------------------------------

def clonar_sin_comentarios(nombre_archivo:str) -> None:
    archivo = open(nombre_archivo, "r", encoding = 'UTF-8')
    nuevas_lineas:[str] = []

    for linea in archivo:
         
         if linea[0] != '#' and linea[0] != ' ':
              nuevas_lineas.append(linea)

         elif linea[0] == ' ':
              if sacar_espacios(linea)[0] != '#':
                      nuevas_lineas.append(linea)
     
     

    archivo_sin_comentarios = open("archivo-sin-comentarios.txt", 'w')
    archivo_sin_comentarios.writelines(nuevas_lineas)
    
    archivo.close()
    archivo_sin_comentarios.close()
    return
    #for l in nuevas_lineas:
         #archivo_sin_comentarios.write(l) #Otra forma de escribir las líneas sin usar writelines()


def sacar_espacios(linea:str) -> str:
    res = ""
    for letra in linea:
         if letra != ' ':
              res += letra
    return res


#EJERCICIO 3---------------------------------------------------------------------------
    
def invertir_lineas(nombre_archivo:str) -> None:
     archivo = open(nombre_archivo)
     lineas = archivo.readlines()
     archivo.close()
     lineas = invertir_lista(lineas)
     reverso = open("reverso.txt", "w", encoding ='UTF-8')
     reverso.writelines(lineas)
     reverso.close()
     return

def invertir_lista(lineas:[str]) -> [str]:
     res:[str] = []
     i = len(lineas) - 1
     while i >= 0:
          res.append(lineas[i])
          i -= 1
     return res

#EJERCICIO 4----------------------------------------------------------------------

def agregar_frase_al_final(nombre_archivo:str, frase:str) -> None:
     archivo = open(nombre_archivo, "a", encoding = 'UTF-8')
     archivo.write(frase)
     archivo.close()
     return

def agregar_frase_al_final2(nombre_archivo:str, frase:str) -> None:
     archivo = open(nombre_archivo, "r", encoding = 'UTF-8')
     lineas = archivo.readlines()
     archivo.close()
     lineas += frase
     archivo = open(nombre_archivo, "w", encoding = 'UTF-8')
     archivo.writelines(lineas)
     archivo.close()
     return


#EJERCICIO 5----------------------------------------------------------------------

def agregar_frase_al_principio(nombre_archivo:str, frase:str) -> None:
     archivo = open(nombre_archivo, "r", encoding = 'UTF-8')
     lineas = archivo.readlines()
     archivo.close()
     lineas_nuevas:[str] = [frase]
     lineas_nuevas += lineas
     archivo = open(nombre_archivo, "w", encoding = 'UTF-8')
     archivo.writelines(lineas_nuevas)
     archivo.close()
     return


#EJERCICIO 6----------------------------------------------------------------------


def lista_palabras_de_archivo(nombre_archivo:str):
     archivo = open(nombre_archivo, "b")
     lineas:[str] = archivo.readlines()
     res:[str] = []
     archivo.close()

     for linea in lineas:
          res.append(palabras_legibles(linea))
     return res

def palabras_legibles(linea:str) -> [str]:
     res:[str] = []
     for palabra in letra:
          if caracteres_validos(palabra):
               res.append(palabra)
     return res

def caracteres_validos(palabra:str) -> bool:
     res:bool = False
     for letra in palabra:
          if letra == '-' or letra == ' ':
               res = True
          elif 'a' <= letra and letra <= 'z' or 'A' <= letra and letra <= 'Z' or '0' <= letra and letra <= '9' :
               res = True
     return res


print(caracteres_validos("jhcvAAVHJGVFJ   ---"))
print(caracteres_validos("jhcvAAVH$$$$???JGVFJ   ---"))     


#EJERCICIO 7--------------------------------------------------------------

def calcular_promedio_por_estudiante(nombre_archivo_notas:str, nombre_archivo_promedios:str) -> None:
     archivo = open(nombre_archivo_notas, "r", encoding = 'UTF-8')
     lineas = archivo.readlines()
     archivo.close()
     linea_nueva:str = ""
     res = []


     for linea in lineas:
          linea_ordenadas:[str] = split_linea_csv(linea)
          lu = linea_ordenadas[0] 
          linea_nueva += lu + "," + str(promedio_estudiante(nombre_archivo_notas, lu)) + '\n'

          if not(pertenece1(res, linea_nueva)):
               res.append(linea_nueva)
          linea_nueva = ""
     
     archivo_destino = open(nombre_archivo_promedios, "w", encoding = 'UTF-8')
     archivo_destino.writelines(res)
     archivo_destino.close()
     print(res)
     print(lineas)
     return

def pertenece1(s:list, e) -> bool: 
    i:int = 0 
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False


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


''' 
    Probar ejecuar en terminal:
    archivo = open("miarchivo.txt")
    contenido = archivo.read()
    contenido
    print(contenido)
    --¿Qué pasa con los saltos de línea?
    archivo.close()
    Hay que cerrarlo y volver a abrirlo para leerlo múltiples veces
    Si no lo cierro puedo tener problemas
    
    '''
