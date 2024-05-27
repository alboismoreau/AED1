#6)
def es_palindromo(texto:str) -> bool:
    if texto == inversa1(texto):
       res = True
    else:
       res = False
    return res 

def inversa1(texto:str) -> str:
    invertida:str = ""
    i  = len(texto) - 1
    while i >= 0:
        invertida += texto[i]
        i -= 1
    return invertida

def inversa2(texto:str) -> str:
    invertida:str = ""
    for i in range(len(texto) -1 , 0 - 1 , -1):
        invertida += texto[i]
    return invertida


#7)

def fortaleza1(contraseña:str) -> bool:
    res:str = "AMARILLO"

    tiene_minuscula:bool = False
    tiene_mayuscula:bool = False
    tiene_numero:bool = False

    for letra in contraseña:
        if 'a' <= letra <= 'z':
            tiene_minuscula = True
        if 'A' <= letra <= 'Z':
            tiene_mayuscula = True
        if '0' <= letra <= '9':
            tiene_numero = True


    if  tiene_mayuscula and tiene_minuscula and tiene_numero:
        res = "VERDE"
    elif len(contraseña) < 5: # fijarse que es el elif
        res = "ROJA"
     
    return res


'''
Esta es otra opcion con funciones auxiliares pero no conviene porque:
-Nunca hay que repetir código
-Tarda mucho más en procesarse
Si hiciese una función que compacte las tres auxiliares en una sola,
no estaría repitiendo código pero tarda lo mismo en procesarse.

También para usar el código ASCII se podría hacer usando la funcion ord('caracter')
'''

def fortaleza2(contraseña:str) -> str:
    if len(contraseña) < 5:
      return 'ROJA'
    elif tiene_minuscula(contraseña) and tiene_mayuscula(contraseña) and tiene_numero(contraseña):
      return 'VERDE'
    else:
      return'AMARILLA'


def tiene_minuscula(contraseña:str) -> bool:
    res = False
    for letra in contraseña:
        if 'a' <= letra <= 'z':
            res = True
    return res

def tiene_mayuscula(contraseña:str) -> bool:
    res = False
    for letra in contraseña:
        if 'A' <= letra <= 'Z':
            res = True
    return res

def tiene_numero(contraseña:str) -> bool:
    res = False
    for letra in contraseña:
        if '0' <= letra <= '9':
            res = True
    return res



#8) ambas funcionan, me quedo con la primera

def cuenta_bancaria1(lista_operaciones:[(chr,int)]) -> int:
    saldo:int = 0 
    for tupla in lista_operaciones:
        if tupla[0] == 'I':
            saldo += tupla[1]
        if tupla[0] == 'R':
            saldo -= tupla[1]

    return saldo

def cuenta_bancaria2(lista_operaciones:[(chr,int)]) -> int:
    saldo:int = 0
    i = 0
    while i < len(lista_operaciones):
        if lista_operaciones[i][0] == 'I':
            saldo += lista_operaciones[i][1]
        if lista_operaciones[i][0] == 'R':
            saldo -= lista_operaciones[i][1]
        i += 1

    return saldo



#9) 
def tres_vocales_distintas1(palabra:str) -> bool:
    n = 0
    for letra in palabra:
        if letra == 'a' or 'A':
            n += 1
        if letra == 'e' or 'E':
            n += 1
        if letra == 'i' or 'I':
            n += 1
        if letra == 'o' or 'O':
            n += 1
        if letra == 'u' or 'U':
            n += 1
    return n >= 3 # CORREGIR ESTA

def tres_vocales_distintas2(palabra:str) -> bool:
   tieneA = 0
   tieneE = 0
   tieneI = 0
   tieneO = 0
   tieneU = 0

   for letra in palabra:
      if letra == 'A' or 'a':
         tieneA = 1
      if letra == 'E' or 'e':
         tieneE = 1
      if letra == 'I' or 'i':
         tieneI = 1
      if letra == 'O' or 'o':
         tieneO = 1
      if letra == 'U' or 'u':
         tieneU = 1
   return tieneA + tieneE + tieneI + tieneO + tieneU >= 3



''' Asegurarse de que los tipos esten correctos:
        -m mypy ."nombre del archivo
        pip3 install mypy (Instalar en linux)
        para ejecutarlo: python3 -m mypy Archivo_python.py
        Usar codigo ASCII para el ej 1.7 (ver diapos de clase practica del 27)'''