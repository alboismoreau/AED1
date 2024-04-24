
--EJERCICIO 1 RELACIONES VALIDAS
relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas [x] = mismoElementoTupla x
relacionesValidas (x:y:xs) = mismoElementoTupla x && not( mismaTupla x y) && relacionesValidas (y:xs) 

mismoElementoTupla :: (String,String) -> Bool
mismoElementoTupla (a,b) = a /= b

mismaTupla :: (String,String) -> (String,String) -> Bool
mismaTupla (a,b) (c,d) = (a==c && b==d) || (a==d && b==c) 

-- EJERCICIO 2 PERSONAS

personas :: [(String,String)] -> [String]
personas [] = []
personas (x:xs) = sacaRepetidos ( (personasAux x ) ++ personas xs )

personasAux :: (String,String) -> [String]
personasAux (a,b) = [a, b] 

sacaRepetidos :: [String] -> [String]
sacaRepetidos [] = []
sacaRepetidos (x:xs) | pertenece x xs = sacaRepetidos xs
                     | otherwise = x : (sacaRepetidos xs) 

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece a [x] = a == x
pertenece a (x:xs) = a == x || pertenece a xs



-- EJERCICIO 3 AMIGOS DE

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe persona [x] | perteneceTupla persona x = personasAux x
                     | otherwise = []
amigosDe persona (x:xs) | perteneceTupla persona x = (personasAux x) ++ (amigosDe persona xs)
                        | otherwise = amigosDe persona xs 

perteneceTupla :: String -> (String,String) -> Bool
perteneceTupla x (a,b) = x==a || x==b

-- EJERCICIO 4 PERSONA C MAS AMIGOS

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos l = masRepeticiones (elementos l)


masRepeticiones :: [String] -> String
masRepeticiones [x] = x
masRepeticiones (x:y:xs) | cantidadRepeticiones (x:y:xs) x >= cantidadRepeticiones (x:y:xs) y = masRepeticiones (x:xs)
                         | otherwise = masRepeticiones (y:xs)
                         

cantidadRepeticiones :: [String] -> String -> Int
cantidadRepeticiones [] _ = 0
cantidadRepeticiones (x:xs) a | a == x = 1 + cantidadRepeticiones xs a
                              | otherwise = cantidadRepeticiones xs a

elementos :: [(String,String)] -> [String]
elementos [] = []
elementos (x:xs) = (personasAux x) ++ elementos xs 