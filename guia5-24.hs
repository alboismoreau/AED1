
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

--mismosElementos :: (Eq t) => [t] -> [t] -> Bool
--mismosElementos l s 