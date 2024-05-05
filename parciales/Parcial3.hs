{-
1) Porcentaje de Votos Afirmativos [1 punto]
problema porcentajeDeVotosAfirmativos (formulas: seq⟨String x String⟩,votos:seq< Z >,
cantTotalVotos: Z) : R {
requiere: {¬formulasInvalidas(formulas)}
requiere: {|formulas| = |votos|}
requiere: {Todos los elementos de votos son mayores o iguales a 0}
requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
asegura: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las
fórmulas) sobre el total de votos emitidos}


Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la
división entre dos números de tipo Int:
division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)


2) Formulas Inválidas [3 puntos]
problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {
requiere: {True}
asegura: {(res = true) <=> formulas contiene un candidato se propone para presidente y
vicepresidente en la misma fórmula; o algún candidato se postula para presidente o vice en
más de una fórmula }

3) Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R
requiere: {La segunda componente de algún elemento de formulas es vice}
requiere: {¬formulasInvalidas(formulas)}
requiere: {|formulas| = |votos|}
requiere: {Todos los elementos de votos son mayores o iguales a 0}
requiere: {Hay al menos un elemento de votos mayores estricto a 0}
asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
}
Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio
1.


4) Menos Votado [3 puntos]problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
requiere: {¬formulasInvalidas(formulas)}
requiere: {|formulas| = |votos|}
requiere: {Todos los elementos de votos son mayores o iguales a 0}
requiere: {Hay al menos un elemento de votos mayores estricto a 0}
requiere: {|formulas| > 0}
asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los
votos contabilizados en votos}
-}



module Parcial3 where

-- EJERCICIO 1 -----------------------------------------------------

porcentajeDeVotosAfirmativos :: [(String,String)] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativos _ votos total = 100 * (division (sumatoria votos) total)

-- Funciones Aux Ej 1 ^ 3

sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

-- EJERCICIO 2------------------------------------------------------

formulasInvalidas :: [(String,String)] -> Bool
formulasInvalidas l = hayRepetidos (desentuplar l) 
                 

-- Funciones Aux Ej 2

desentuplar :: (Eq t) => [(t,t)] -> [t]
desentuplar [] = []
desentuplar ((x,y):xs) = x : y : desentuplar xs


pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece a (x:xs) | a == x = True
                   | otherwise = pertenece a xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs

-- EJERCICIO 3 ------------------------------------------------------------

porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeVotos vice formulas votos = 100 * (division (indiceVotos (indiceVice vice formulas) votos) (sumatoria votos))

-- Funciones Aux Ej 3

indiceVice :: String -> [(String,String)] -> Int
indiceVice vice ((x,y):xs) | vice == y = 0
                           | otherwise = 1 + indiceVice vice xs

indiceVotos :: Int -> [Int] -> Int
indiceVotos i (x:xs) | i == 0 = x
                     | otherwise = indiceVotos (i - 1) xs

-- EJERCICIO 4-------------------------------------------------------------

menosVotado :: [(String,String)] -> [Int] -> String
menosVotado formulas votos = indicePresi (indiceMenor votos) formulas

-- Funciones Aux Ej 4

indicePresi :: Int -> [(String,String)] -> String
indicePresi i ((x,y):xs) | i == 0 = x
                         | otherwise = indicePresi (i - 1) xs

indiceMenor :: (Ord t) => [t] -> Int
indiceMenor [x] = 0 
indiceMenor (x:xs) | x == menor (x:xs) = 0
                   | otherwise = 1 + indiceMenor xs

menor :: (Ord t) => [t] -> t
menor [x] = x
menor (x:y:xs) | x <= y = menor (x:xs)
               | otherwise = menor (y:xs) 