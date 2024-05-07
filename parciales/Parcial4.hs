{- PRIMER PARCIAL DE PRIMER CUATRIMESTRE 2024

1. Ejercicio 1 (2 puntos)
problema hayQueCodificar (c:Char, mapeo:seq(Char x Char)): Bool{
    requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
    requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
    asegura: {res = True <=> c es igual a la primera componente de alguna tupla de mapeo}
}

2. Ejercicio 2 (2 puntos)
problema cuantasVecesHayQueCodificar (c:Char, frase:seq(Char), mapeo:seq(Char x Char)):Z{
    requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
    requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
    requiere: {|frase|>0}
    requiere: {c pertenece a frase}
    asegura: {res = 0 y hayQueCodificar (c,mapeo) = False} o {res = cantidad de veces que c aparece en frase y hayQueCodificar(c,mapeo)=True}
}

3. Ejercicio 3 (2 puntos)
problema laQueMasHayQueCodificar (frase:seq(Char), mapeo:seq(Char x Char)):Char{
    requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
    requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
    requiere: {|frase|>0}
    requiere: {c pertenece a frase}
    requiere: {existe al menos un c que pertenece a frase y hayQueCodificar(c,mapeo)=True}
    asegura: {res= c donde c es el caracter tal que cuantasVecesHayQueCodificar (c,frase,mapeo) es mayor a cualquier otro caracter perteneciente a frase}
    asegura: {si exite más de un caracter c que cumpla la condicion anterior, devuelve el que aparece primero en frase}
}

4. Ejercicio 4 (3 puntos)
problema codificarFrase (frase:seq(Char),mapeo:seq(Char x Char)):seq(Char){
    requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
    requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
    requiere: {|frase|>0}
    asegura: {|res| = |frase|}
    asegura: { para todo 0<= l < |frase| si hayQueCodificar(frase[l],mapeo)=True entonces res[l] = (mapeo[l])1, para un l tal que 0 <= l < |mapeo| y mapeo[l])0 = frase[l]}
    asegura: { para todo 0<= l < |frase| si hayQueCodificar(frase[l],mapeo)=False entonces res[l] = frase[l]}
}
-}

module Parcial4 where

-- EJERCICIO 1----------------------------------------------------------------

hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c ((x,y):xs) | c == x = True
                             | otherwise = hayQueCodificar c xs

--EJERCICIO 2----------------------------------------------------------------

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo | hayQueCodificar c mapeo = cantidadApariciones c frase
                                          | otherwise = 0 

--Funciones Aux Ej 2

cantidadApariciones :: Char -> [Char] -> Int
cantidadApariciones _ [] = 0
cantidadApariciones c (x:xs) | c == x = 1 + cantidadApariciones c xs
                             | otherwise = cantidadApariciones c xs

--EJERCICIO 3------------------------------------------------------------

laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar [x] mapeo = x
laQueMasHayQueCodificar (x:y:xs) mapeo | cuantasVecesHayQueCodificar x (x:y:xs) mapeo >= cuantasVecesHayQueCodificar y (x:y:xs) mapeo = laQueMasHayQueCodificar (x:xs) mapeo
                                       | otherwise = laQueMasHayQueCodificar (y:xs) mapeo


--EJERCICIO 4------------------------------------------------------------

codificarFrase :: [Char] -> [(Char,Char)] -> [Char] 
codificarFrase frase mapeo = codificarFraseDesde 0 frase mapeo

codificarFraseDesde :: Int -> [Char] -> [(Char,Char)] -> [Char]
codificarFraseDesde n frase mapeo | n > (length frase) - 1 = []
                                  | hayQueCodificar (enesimo n frase) mapeo = fst (indiceMapeo n mapeo) : codificarFraseDesde (n + 1) frase mapeo
                                  | otherwise = (enesimo n frase) : codificarFraseDesde (n + 1) frase mapeo

--Funciones Aux Ej 4

enesimo :: Int -> [Char] -> Char
enesimo _ [c] = c
enesimo n (c:cs) | n == 0 = c
                 | otherwise = enesimo (n - 1) cs

indiceMapeo :: Int -> [(Char,Char)] -> (Char,Char)
indiceMapeo _ [x] = x
indiceMapeo i (x:xs) | i == 0 = x
                     | otherwise = indiceMapeo (i - 1) xs