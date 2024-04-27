
module Parcial1 where

    -- Ejercicio 2 BIEN HECHO-----------------------------------------------------------------

    formulasInvalidas :: [(String,String)] -> Bool
    formulasInvalidas l | formulasValidas l == True = False
                    | otherwise = True
    formulasValidas :: [(String,String)] -> Bool
    formulasValidas [] = True
    formulasValidas [x] = noseRepiteElemento x             
    formulasValidas (x:y:xs) | seRepiteElemento x || seRepiteElemento y || seRepiteElemento2 x y = False
                         | otherwise = formulasValidas (x:xs) && formulasValidas (y:xs)
    seRepiteElemento :: (String,String) -> Bool
    seRepiteElemento (a,b) = a == b 

    noseRepiteElemento :: (String,String) -> Bool
    noseRepiteElemento (a,b) = a /= b

    seRepiteElemento2 :: (String,String) -> (String,String) -> Bool
    seRepiteElemento2 (a,b) (c,d) | a==c || a==d || b==c || b==d = False 
                                | otherwise = True


    -- Ejercicio 1 CREO QUE BIEN------------------------------------------------------------------------
   
    division :: Int -> Int -> Float
    division a b = (fromIntegral a) / (fromIntegral b)

    porcentajeDeVotosAfirmativos :: [(String,String)] -> [Int] -> Int -> Float
    porcentajeDeVotosAfirmativos s l n = (porcentajeDeVotosAfirmativosAux s l n ) * 100 

    porcentajeDeVotosAfirmativosAux :: [(String,String)] -> [Int] -> Int -> Float
    porcentajeDeVotosAfirmativosAux _ l n | n == 0 = 0
                                   | otherwise = division (cantidadDeVotosAfirmativos l) n 

    cantidadDeVotosAfirmativos :: [Int] -> Int
    cantidadDeVotosAfirmativos [] = 0 -- me había olvidado de poner en caso de que sea vacía (ver abajo errores del testing)
    cantidadDeVotosAfirmativos [x] = x
    cantidadDeVotosAfirmativos (x:xs) = x + cantidadDeVotosAfirmativos xs

    posicionMenor :: [Int] -> Int
    posicionMenor l = posicionEnteros (menor l) l

    posicionEnteros :: Int -> [Int] -> Int
    posicionEnteros n [x] = 0
    posicionEnteros n (x:xs) | n==x = 0
                         | otherwise = (posicionEnteros n xs) + 1

    menor :: [Int] -> Int
    menor [x] = x
    menor (x:y:xs) | x > y = menor (y:xs)
               | x <= y = menor (x:xs)

    presi :: (String,String) -> String
    presi (a,b) = a

    comePosicionDevuelveTupla :: Int -> [(String,String)] -> (String,String)
    comePosicionDevuelveTupla _ [x] = x
    comePosicionDevuelveTupla n (x:xs) | n==0 = x 
                                   | otherwise = comePosicionDevuelveTupla (n-1) xs

    comeTuplaDevuelvePosicion :: (String,String) -> [(String,String)] -> Int
    comeTuplaDevuelvePosicion tupla [x] = 0 
    comeTuplaDevuelvePosicion tupla (x:xs)| tupla==x = 0
                                      | otherwise = (comeTuplaDevuelvePosicion tupla xs) + 1

    tuplaMenosVotado :: Int -> [(String,String)] -> [Int] -> (String,String)
    tuplaMenosVotado  n formulas votos | comeTuplaDevuelvePosicion (comePosicionDevuelveTupla n formulas) formulas == posicionMenor votos = (comePosicionDevuelveTupla n formulas)
                                   | otherwise = tuplaMenosVotado (n + 1) formulas votos

    menosVotado :: [(String,String)] -> [Int] -> String
    menosVotado formulas votos = presi (tuplaMenosVotado 0 formulas votos) 

--Ejercicio 3------------------------------------------------------------------


    posicionVice ::  String -> [(String,String)] -> Int
    posicionVice s (x:xs) | vicepresidente x == s = 0
                      | otherwise = (posicionVice s xs) + 1

    vicepresidente :: (String,String) -> String
    vicepresidente (a,b) = b

    comePosicionDevuelveEntero :: Int -> [Int] -> Int
    comePosicionDevuelveEntero _ [x] = x
    comePosicionDevuelveEntero n (x:xs) | n == 0 = x
                                    | otherwise = comePosicionDevuelveEntero (n - 1) xs

    cantidadVotos :: [Int] -> Int
    cantidadVotos [x] = x
    cantidadVotos (x:xs) = x + (cantidadVotos xs)

    porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
    porcentajeDeVotos vice formulas votos = (division (comePosicionDevuelveEntero (posicionVice vice formulas) votos) (cantidadVotos votos)) * 100
