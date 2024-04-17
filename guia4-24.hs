-- EJERCICIO 1

fibonacci :: Int -> Int 
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- EJERCICIO 2 

parteEntera :: Float -> Int
parteEntera x = truncate x

parteEntera1 :: Float -> Int
parteEntera1 x | 0 <= x && x <= 1 = 0
               | x >= 1 = parteEntera (x - 1) + 1
               | otherwise = parteEntera (x + 1) - 1


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

-- EJERCICIO 9 

esCapicua' :: Int -> Bool
esCapicua' n = n == inverso n

inverso :: Int -> Int
inverso = read . reverse . show --(no se puede hacer así)
-------------------------

sinPrimeroYultimo :: Int -> Int
sinPrimeroYultimo x = mod (mod x (10^(cantidadDeDigitos x -1))) 10

esCapicua :: Int -> Bool
esCapicua n | n < 10 = True
            | ultimoDigito n == iesimoDigito n 1 = esCapicua (sinPrimeroYultimo n)
            | otherwise = False

---------------------------------------
anteUltimoDigito :: Int -> Int
anteUltimoDigito n = mod (div n 10) 10

ultimoDigito :: Int -> Int
ultimoDigito n = mod n 10



-- EJERCICIO 10 sumatorias

f1 :: Int -> Int
f1 0 = 1
f1 n = 2^n + f1 (n-1)

f2 :: Int -> Int -> Int
f2 1 q = q
f2 n q = q^n + f2 (n -1) q

f3 :: Int -> Int -> Int
f3 n q | n == 1 = q + q^2
       | otherwise = q^(2*n) + q^(2*n - 1) + f3 (n - 1) q 

-- falta f4

-- EJERCICIO 11

eaprox :: Int -> Float
eaprox 0 = 1
eaprox 1 = 1
eaprox n = 1/(fromIntegral (factorial n)) + eaprox (n - 1)

factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1 
factorial n = n * (factorial (n - 1))


-- EJERCICIO 12

sucesion :: Int -> Float
sucesion 0 = 1
sucesion 1 = 2
sucesion n = 2 + 1/(fromIntegral(n - 1)) + sucesion (n - 1)

raizDosAprox :: Int -> Float
raizDosAprox n = sucesion (n - 1)

-- EJERCICIO 13

sumatoriaExt :: Int -> Int -> Int
sumatoriaExt 1 m = 1
sumatoriaExt n m = sumatoriaInterna n m + sumatoriaExt (n - 1) m

sumatoriaInterna :: Int -> Int -> Int
sumatoriaInterna n 1 = n
sumatoriaInterna n j = n ^ j + sumatoriaInterna n (j -1)

-- EJERCICIO 14

sumaPotencias :: Int -> Int -> Int -> Int
sumaPotencias q n m | n == 1 = q ^ (1 + m) + sumaPotenciasAux q n m
                    | otherwise = sumaPotenciasAux q n m + sumaPotencias q (n - 1) m

sumaPotenciasAux :: Int -> Int -> Int -> Int
sumaPotenciasAux q n m | m == 1 = q  ^ (n + 1)
                       | otherwise = q  ^ (n + m) + sumaPotenciasAux q n (m - 1)


-- EJERCICIO 15

sumaRacionales :: Int -> Int -> Float
sumaRacionales n m | m == 1 = fromIntegral(n) + sumaRacionalesAux (n - 1) m 
                   | otherwise = sumaRacionales n (m - 1) + sumaRacionalesAux n m 

sumaRacionalesAux :: Int -> Int -> Float
sumaRacionalesAux n m | n == 1 = (fromIntegral n)/(fromIntegral m)
                      | otherwise = (fromIntegral n)/(fromIntegral m) + sumaRacionalesAux (n - 1) m
                   


--  EJERCICIO 16 

menorDivisor :: Int -> Int
menorDivisor n = menorDivisorDesde n 2

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde n desde | mod n desde == 0 = desde
                          | otherwise = menorDivisorDesde n (desde + 1)


esPrimo :: Int -> Bool
esPrimo n = menorDivisor n == n


sonCoprimos :: Int -> Int -> Bool -- si tienen un divisor común mayor a 1
sonCoprimos n m | esPrimo n || esPrimo m = True 
                | n >= m && mod n (menorDivisor m) == 0 = False
                | n < m && mod m (menorDivisor n) == 0 = False
                | otherwise = True


nesimoPrimo :: Int -> Int
nesimoPrimo 1 = 2
nesimoPrimo n = siguientePrimo (nesimoPrimo (n-1) + 1)

siguientePrimo :: Int -> Int
siguientePrimo n | esPrimo n = n 
                 | otherwise = siguientePrimo (n + 1)


-- EJERCICIO 17






-- EJERCICIO 18

mayorDigitoPar :: Int -> Int
mayorDigitoPar x | x < 10 && esInpar x = -1
                 | x < 10 && esPar x = x
                 | esPar (ultimoDigito x) = (mayor (mayorDigitoPar (div x 10)) (ultimoDigito x))
                 | otherwise = (mayorDigitoPar (div x 10))

mayor :: Int -> Int -> Int
mayor x y | x > y = x
          | otherwise = y

esInpar :: Int -> Bool
esInpar x = mod x 2 == 1 


esPar :: Int -> Bool
esPar x = mod x 2 == 0 

-- EJERCICIO 19

esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos x = (esSumaInicialDePrimosAux x 2)
 
esSumaInicialDePrimosAux :: Int -> Int -> Bool
esSumaInicialDePrimosAux x y | y > x = False
                             | x - y == 0 = True
                             | otherwise = esSumaInicialDePrimosAux (x-y) (primoCercanoMasGrande (y+1))
 

primoCercanoMasGrande :: Int -> Int 
primoCercanoMasGrande x | esPrimo x = x
                        | otherwise = primoCercanoMasGrande (x+1) 

-- EJERCICIO 21

pitagorasBool :: Int -> Int -> Int -> Bool
pitagorasBool x y z = (x*x + y*y) <= z*z


pitagorasXfijo :: Int -> Int -> Int -> Int
pitagorasXfijo x y z | y < 0 = 0
                     | pitagorasBool x y z = 1 + pitagorasXfijo x (y-1) z
                     | otherwise = 0 + pitagorasXfijo x (y-1) z
