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
porcentajeDeVotos presi formulas votos = division (darCantidadVotos presi formulas votos) (votosAfirmativos votos)

--Funciones Auxiliares Ej 3

darCantidadVotos :: String -> [(String,String)] -> [Int] -> Int
darCantidadVotos presi formulas votos = darElementoVotos (darPosicionTupla presi formulas) votos

--- ACORDATE DE DIVIDIR X 100 FORRA!!!!!!!!


darPosicionTupla :: (Eq t) => t -> [(t,t)] -> Int
darPosicionTupla _ [x] = 0
darPosicionTupla a ((x,y):xs) | a == x = 0 
                              | otherwise = 1 + (darPosicionTupla a  xs)

darElementoVotos :: Int -> [Int] -> Int
darElementoVotos n (x:xs) | n == 0 = x
                          | otherwise = darElementoVotos (n - 1) xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

votosAfirmativos :: [Int] -> Int
votosAfirmativos votos = sumatoria votos

-- EJERCICIO 4 -----------------------------------------------------------------

proximoPresidente :: [(String,String)] -> [Int] -> String
proximoPresidente


posicionMayor :: [Int] -> Int
posicionMayor (x:xs) | mayor x (x:xs) = 0
                     | otherwise = 1 + posicionMayor xs
                     where 
                        mayor :: [Int] -> Int
                        mayor [x] = x
                        mayor (x:y:xs) | x >= y = mayor (x:xs) 
                                       | otherwise = mayor (y:xs)

--COMPLETAR