-- EJERCICIO 1

fibonacci :: Int -> Int 
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- EJERCICIO 2 

parteEntera :: Float -> Int
parteEntera x = truncate x

-- EJERCICIO 3 No usar ni mod ni div

esDivisible :: Int -> Int -> Bool
esDivisible a b | b == 1 || a == 0 = True
                | (a - b) == 0 = True
                | (a - b) > 0 = esDivisible (a - b) b
                | otherwise = False

-- EJERCICIO 4 Suma los primeros n numeros impares

sumaImpares :: Int -> Int
sumaImpares 0 = 0
sumaImpares 1 = 1
sumaImpares n = 2 * n - 1 + sumaImpares (n - 1)

-- EJERCICIO 5 

medioFact :: Int -> Int
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * (medioFact (n-2))

-- EJERCICIO 6 

sumaDigitos :: Int -> Int
sumaDigitos n | n < 10 = n
              | otherwise = (mod n 10) + sumaDigitos (div n 10)

-- EJERCICIO 7

todosDigitosIguales :: Int -> Bool
todosDigitosIguales n | n < 10 = True
                      | mod n 10 == mod (div n 10) 10 = todosDigitosIguales (div n 10)
                      | otherwise = False

-- EJERCICIO 8

cantidadDeDigitos :: Int -> Int
cantidadDeDigitos n | n < 10 = 1 
                    | otherwise = 1 + cantidadDeDigitos (div n 10)

iesimoDigito :: Int -> Int -> Int
iesimoDigito n i = mod (div n (10^(cantidadDeDigitos (n) - i))) 10
