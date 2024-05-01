{-

1) Atajaron Suplentes
problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {
	res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.
	}
}


2) Equipos Válidos
problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {
	(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club
	}
}


3) Porcentaje de goles
problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {
	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares
	}
}

Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como float la división entre dos
numeros de tipo Int.

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b


4) Valla Menos Vencida
problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {|goles| > 0}
	asegura: {
	res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles
	}
}

-}


module Parcial2 where

-- EJERCICIO 1---------------------------------------

atajaronSuplentes :: [(String,String)] -> [Int] -> Int -> Int
atajaronSuplentes _ goles total = total - sumatoria goles

-- Funcion Aux Ej 1

sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- EJERCICIO 2---------------------------------------

equiposValidos :: [(String,String)] -> Bool
equiposValidos l = noHayRepetidos (desentuplar l)

-- Funciones Aux Ej 2

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

-- EJERCICIO 3---------------------------------------------------

porcentajeDeGoles :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeGoles arquero equipos goles = 100 * (division (indiceGoles (indiceArquero arquero equipos) goles) (sumatoria goles))

-- Funciones Aux Ej 3

indiceArquero :: String -> [(String,String)] -> Int
indiceArquero _ [(x,y)] = 0
indiceArquero a ((x,y):xs) | a == y = 0
                           | otherwise = 1 + indiceArquero a xs

indiceGoles :: Int -> [Int] -> Int
indiceGoles n (x:xs) | n == 0 = x
                     | otherwise = indiceGoles (n - 1) xs 

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)


-- EJERCICIO 4 -------------------------------------------------

vallaMenosVencida :: [(String,String)] -> [Int] -> String
vallaMenosVencida [(x,y)] _ = x
vallaMenosVencida equipos goles = indiceValla (indiceMenor goles) equipos 

-- Funciones Aux Ej 4

indiceValla :: Int -> [(String,String)] -> String
indiceValla _ [(x,y)] = x
indiceValla a ((x,y):xs) | a == 0 = x
                         | otherwise = indiceValla (a - 1) xs

indiceMenor :: [Int] -> Int
indiceMenor [x] = 0
indiceMenor (x:xs) | x == menor (x:xs) = 0
                   | otherwise = 1 + indiceMenor xs

menor :: [Int] -> Int
menor [x] = x
menor (x:y:xs) | x <= y = menor (x:xs)
               | otherwise = menor (y:xs)

