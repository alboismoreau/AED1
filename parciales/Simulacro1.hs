module Simulacro1 where


--EJERCICIO 1----------------------------------------------------------------------------

relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((x,y):xs) | x == y || pertenece (x,y) xs || pertenece (y,x) xs = False
                             | otherwise = relacionesValidas xs

--EJERICIO 2-----------------------------------------------------------------------------

personas :: [(String,String)] -> [String]
personas [] = []
personas ((x,y):xs) | pertenece x (personas xs) && pertenece y (personas xs) = personas xs 
                    | pertenece x (personas xs) = y : (personas xs)
                    | pertenece y (personas xs) = x : (personas xs)
                    | otherwise = x : y : (personas xs)

-- Funciones Auxiliares Ej 1 ^ 2:

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece a (x:xs) | a == x = True
                   | otherwise = pertenece a xs

--EJERCICIO 3 ------------------------------------------------------------------------

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((x,y):xs) | persona == x || persona == y = x : y : amigosDe persona xs
                            | otherwise = amigosDe persona xs

-- EJERCICIO 4-----------------------------------------------------------------------

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos l = masApariciones ( desentuplar l)

-- Funciones Auxiliares Ej 4--------

desentuplar :: (Eq t) => [(t,t)] -> [t]
desentuplar [(a,b)] = [a,b]
desentuplar ((a,b):as) = a : b : (desentuplar as)

cantidadApariciones :: (Eq t) => t -> [t] -> Int
cantidadApariciones _ [] = 0
cantidadApariciones a (x:xs) | a == x = 1 + (cantidadApariciones a xs)
                             | otherwise = cantidadApariciones a xs

masApariciones :: (Eq t) => [t] -> t
masApariciones [x] = x
masApariciones (x:y:xs) | cantidadApariciones x (x:y:xs) >= cantidadApariciones y (x:y:xs) = masApariciones (x:xs)
                        | otherwise = masApariciones (y:xs) 
