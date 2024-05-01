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

