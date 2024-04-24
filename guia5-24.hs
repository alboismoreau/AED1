
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
mismosElementos l s = mismosElementosAux  l s && mismosElementosAux s l

mismosElementosAux :: (Eq t) => [t] -> [t] -> Bool
mismosElementosAux [] [] = True
mismosElementosAux l s = pertenece (head s) l && mismosElementosAux (tail s) l 
--la idea está bien pero hay algo mal pensado en los casos bases que hace que no funcione

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
sacarBlancosRepetidos [x] = [x]
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


primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs) | x == ' ' = []
                      | otherwise = x : (primeraPalabra xs)

sacarPrimeraPalabra :: [Char] -> [Char]
sacarPrimeraPalabra [] = []
sacarPrimeraPalabra (x:xs) | x == ' ' = xs
                           | otherwise = sacarPrimeraPalabra xs


palabras :: [Char] -> [[Char]]
palabras [] = []
palabras l = (primeraPalabra ( eliminaBlancosIniFinal ( sacarBlancosRepetidos l))):(palabras (sacarPrimeraPalabra l))


palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = palabraMasLargaAux (eliminaBlancosIniFinal (sacarBlancosRepetidos xs))

palabraMasLargaAux :: [Char] -> [Char]
palabraMasLargaAux xs | sacarPrimeraPalabra xs == [] = primeraPalabra xs
                      | length (primeraPalabra xs) > length (palabraMasLargaAux (sacarPrimeraPalabra xs)) = primeraPalabra xs
                      | otherwise = palabraMasLargaAux (sacarPrimeraPalabra xs) 

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [[x]] = [x]
aplanarConBlancos (x:xs) = eliminaBlancosIniFinal( x ++ [' '] ++ aplanarConBlancos xs)

aplanarConNBlancos :: [[Char]] -> Int -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos [[x]] _ = [x]
aplanarConNBlancos (x:xs) n = eliminaBlancosIniFinal( x ++ nBlancos n ++ aplanarConBlancos xs)

nBlancos :: Int -> [Char]
nBlancos 0 = []
nBlancos n = [' '] ++ nBlancos (n - 1)

-- EJERCICIO 5 

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada l = sumaAcumulada (principio l) ++ [sumaTodos l]

sumaTodos :: (Num t) => [t] -> t
sumaTodos [] = 0
sumaTodos (x:xs) = x + sumaTodos xs

descomponerEnPrimos :: [Int] -> [[Int]] --Por ejemplo descomponerEnPrimos [2, 10, 6] es [[2], [2, 5], [2, 3]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = descomponerElemento x : descomponerEnPrimos xs

descomponerElemento :: Int -> [Int]
descomponerElemento x | x == 1 = []
                      | otherwise = menorDivisor x : descomponerElemento (div x (menorDivisor x)) 

menorDivisor :: Int -> Int
menorDivisor n = menorDivisorDesde n 2 

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde n desde | mod n desde == 0 = desde
                          | otherwise = menorDivisorDesde n (desde + 1)