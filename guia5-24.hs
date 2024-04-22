
-- EJERCICIO 1

longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

longitud' :: [t] -> Int
longitud' l = length l

ultimo :: [t] -> t
ultimo [x] = x
ultimo l = ultimo( tail l ) 

principio :: [t] -> [t]
principio [] = []
principio [x] = []
principio (x:xs) = [x] ++ principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso [x] = [x]
reverso (x:xs) = reverso xs ++ [x] 

--EJERCICIO 2

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False 
pertenece y (x:xs) = y == x || pertenece y xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (x:y:xs) = (x == y) && todosIguales (y:xs)

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) = not( pertenece x xs) && todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:y:xs) = (pertenece x (y:xs)) || (pertenece y (x:xs) && hayRepetidos(y:xs))

quitar :: (Eq t) => t -> [t] -> [t] -- elimina la primera aparicion 
quitar _ [] = []
quitar a (x:xs) | a == x = xs
                | otherwise = [x] ++ (quitar a xs)

quitarTodos :: (Eq t) => t -> [t] -> [t] -- elimina todas las apariciones
quitarTodos _ [] = []
quitarTodos a (x:xs) | a == x = quitarTodos a xs
                     | otherwise = [x] ++ (quitarTodos a xs)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs) | pertenece x xs = eliminarRepetidos xs
                         | otherwise = eliminarRepetidos [x] ++ eliminarRepetidos xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] [x] = True
mismosElementos [x] l = pertenece x l 
mismosElementos l s | pertenece (head(eliminarRepetidos s)) l = mismosElementos (tail s) l && mismosElementos s l
                    | otherwise = False -- ARREGLAR

capicua :: (Eq t) => [t] -> Bool
capicua l = reverso l == l

-- EJERCICIO 3

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [x] = x 
productoria [] = 0
productoria (x:xs) = x * productoria xs 

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:y:xs) | x >= y = maximo (x:xs)  
                | otherwise = maximo (y:xs)

sumarN :: Int -> [Int] -> [Int]
sumarN _ [] = []
sumarN n [x] = [x+n]
sumarN n (x:xs) = [x+n] ++ sumarN n xs 

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero l = sumarN (head l) l

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo l = sumarN (ultimo l) l

pares :: [Int] ->  [Int] -- Deja solo pares en el mismo orden
pares [] = []
pares (x:xs) | esPar x = [x] ++ pares xs 
             | otherwise = pares xs
             where esPar :: Int -> Bool
                   esPar n = mod n 2 == 0
    
multiplosDeN :: Int ->  [Int] ->  [Int] -- Deja solo multiplos de n en el mismo orden
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | esMultiplo x n = [x] ++ multiplosDeN n xs 
                      | otherwise = multiplosDeN n xs
                      where esMultiplo :: Int -> Int -> Bool
                            esMultiplo a b = mod a b == 0

ordenar :: [Int] -> [Int] -- ordena en forma creciente
ordenar [] = []
ordenar (x:xs) | x == maximo (x:xs) = ordenar xs ++ [x]
               | otherwise = ordenar (xs ++ [x]) 

-- EJERCICIO 4

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:y:xs) | x == y && x == ' ' = sacarBlancosRepetidos (y:xs)
                               | otherwise = x : (sacarBlancosRepetidos (y:xs))

eliminaBlancosPrincipio ::  [Char] -> [Char]
eliminaBlancosPrincipio [] = []
eliminaBlancosPrincipio l | head(l) == ' ' = tail l
                          | otherwise = l 

eliminaBlancosIniFinal ::  [Char] -> [Char]
eliminaBlancosIniFinal [] = []
eliminaBlancosIniFinal l | ultimo(l) == ' ' = principio (eliminaBlancosPrincipio l)
                      | otherwise = eliminaBlancosPrincipio l

contarBlancos :: [Char] -> Int
contarBlancos [] = 0
contarBlancos (x:xs) | x == ' ' = 1 + contarBlancos xs 
                     | otherwise = contarBlancos xs

contarPalabras :: [Char] -> Int
contarPalabras l = (contarBlancos l) + 1

palabras :: [Char] -> [[Char]]
