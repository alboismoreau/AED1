{-

Ejercicio 1 - Votos en Blanco
problema votosEnBlanco(f ormulas : seq < String × String >, votos : seq < Z >, cantT otalV otos : Z) : Z{
requiere : {f ormulasV alidas(f ormulas)}
requiere : {|f ormulas| = |votos|}
requiere : { Todos los elementos de votos son mayores o iguales que 0}
requiere : { La suma de todos los elementos de votos es menor o igual a cantT otalV otos}
asegura : {res es la cantidad de votos emitidos que no correspondieron a niguna de las fórmulas que se presentaron }
}


Ejercicio 2 - Fórmulas Válidas
problema formulasValidas(f ormulas : seq < String × String >) : Bool{
requiere : {T rue}
asegura : {(res = true) ↔ f ormulas no contiene nombres repetidos, es decir que cada candidato está en una única fórmula (no
se puede ser candidato a presidente y a vicepresidente ni en la misma fórmula ni en fórmulas distintas) }
}


Ejercicio 3 - Porcentaje de Votos
problema porcentajeDeVotos(presidente : String, f ormulas : seq < String × String >, votos : seq < Z >) : R{
requiere : {La primera componente de algun elemento de f ormulas es presidente}
requiere : {f ormulasV alidas(f ormulas)}
requiere : {|f ormulas| = |votos|}
requiere : { Todos los elementos de votos son mayores o iguales que 0}
requiere : { Hay al menos un elemento de votos que es mayor estricto que 0}
asegura : {res es el porcentaje de votos que obtuvo la fórmula encabezada por presidente sobre el total de votos afirmativos }
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo
Int:
division :: Int → Int → F loat
division a b = (f romIntegral a) / (f romIntegral b)


Ejercicio 4 - Próximo Presidente
problema proximoPresidente(f ormulas : seq < String × String >, votos : seq < Z >) : String{
requiere : {La primera componente de algun elemento de f ormulas es presidente}
requiere : {f ormulasV alidas(f ormulas)}
requiere : {|f ormulas| = |votos|}
requiere : { Todos los elementos de votos son mayores o iguales que 0}
requiere : { Hay al menos un elemento de votos que es mayor estricto que 0}
requiere : {|f ormulas| > 0}
asegura : {res es el candidato a presidente de f ormulas más votado de acuerdo a los votos contabilizados en votos}
}
-}


module Parcial1 where
    
-- EJERCICIO 1-----------------------------------------------

votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int
votosEnBlanco [] [] a = a 
votosEnBlanco l s a = a - (sumatoria s)


--Funciones Auxiliares Ej 1 

sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--EJERCICIO 2--------------------------------------------

formulasValidas :: [(String,String)] -> Bool
formulasValidas l = noHayRepetidos (desentuplar l)

--Funciones Auxiliares Ej 2

desentuplar :: (Eq t) => [(t,t)] -> [t]
desentuplar [] = []
desentuplar ((x,y):xs) = x : y : (desentuplar xs)

noHayRepetidos :: (Eq t) => [t] -> Bool
noHayRepetidos [] = True
noHayRepetidos (x:xs) | pertenece x xs = False
                      | otherwise = noHayRepetidos xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece a (x:xs) | a == x = True
                   | otherwise = pertenece a xs

-- EJERCICIO 3------------------------------------------

porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeVotos presi formulas votos = (division (cantidadVotos presi formulas votos) (votosAfirmativos votos)) * 100

--Funciones Auxiliares Ej 3

cantidadVotos :: String -> [(String,String)] -> [Int] -> Int
cantidadVotos presi formulas votos = indiceVotos (indiceTupla presi formulas) votos

indiceTupla :: (Eq t) => t -> [(t,t)] -> Int
indiceTupla _ [x] = 0
indiceTupla a ((x,y):xs) | a == x = 0 
                         | otherwise = 1 + (indiceTupla a  xs)

indiceVotos :: Int -> [Int] -> Int
indiceVotos n (x:xs) | n == 0 = x
                     | otherwise = indiceVotos (n - 1) xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

votosAfirmativos :: [Int] -> Int
votosAfirmativos votos = sumatoria votos

-- EJERCICIO 4 -----------------------------------------------------------------

proximoPresidente :: [(String,String)] -> [Int] -> String
proximoPresidente formulas votos = indicePresi (indiceMayor votos) formulas

-- Funciones Auxiliares Ej 4

indiceMayor :: [Int] -> Int
indiceMayor (x:xs) | x == mayor (x:xs) = 0
                   | otherwise = 1 + indiceMayor xs
      
mayor :: [Int] -> Int 
mayor [x] = x
mayor (x:y:xs) | x >= y = mayor (x:xs) 
               | otherwise = mayor (y:xs)

indicePresi :: Int -> [(String,String)] -> String
indicePresi  i (x:xs) | i == 0 = fst x 
                      | otherwise = indicePresi (i - 1) xs

