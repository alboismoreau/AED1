

doubleMe :: Int -> Int
doubleMe x = x + x

signo :: Int -> Int
signo x | x > 0 = 1
        | x < 0 = -1
        | otherwise = 0 

-- EJERCICIO 1

f :: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

h :: Int -> Int
h x = f (g x)

k :: Int -> Int
k x = g (f x)

-- EJERCICIO 2

absoluto :: Int -> Int
absoluto n | n >= 0 = n
           | otherwise = (-n)

absolutoo :: Int -> Int
absolutoo n = abs n        -- no usar

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto n m | absoluto n >= absoluto m = absoluto n
                   | otherwise = absoluto m

algunoEs0 :: Int -> Int -> Bool
algunoEs0 n m | n == 0 || m == 0 = True
              | otherwise = False

algunoEs0pm :: Int -> Int -> Bool
algunoEs0pm n m = n == 0 || m == 0

ambosSon0 :: Int -> Int -> Bool
ambosSon0 n m | n == 0 && m == 0 = True
              | otherwise = False

ambosSon0pm :: Int -> Int -> Bool
ambosSon0pm n m = n == 0 && m == 0

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo a b = (a <= 3 && b <= 3) || (a > 7 && b > 7) || (3 < a  && a <= 7 && 3 < b && b <= 7)

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c | esIgual a b && esIgual a c = a
                    | esIgual a b || esIgual b c = a + c
                    | esIgual a c = a + b
                    | otherwise = a + b + c
                    where esIgual :: Int -> Int -> Bool
                          esIgual a b = a == b
                    

maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c | a >= b && a >= c = a 
              | b >= c && b >= a = b 
              | otherwise = c

esMultiploDe :: Int -> Int -> Bool
esMultiploDe a b = mod a b == 0

digitoUnidades :: Int -> Int
digitoUnidades n = mod n 10 

digitoDecenas :: Int -> Int
digitoDecenas n = div (mod n 100) 10

-- EJERCICIO 3 a tiene que ser multiplo de b

estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b = mod a b == 0

-- EJERCICIO 4 

prodInt :: (Float,Float) -> (Float,Float) -> Float
prodInt (a,b) (c,d) = a * c + b * d

todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor (a,b) (c,d) = a < c && b < d

distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos (a,b) (c,d) = norma (a - c , b - d)

norma :: (Float,Float) -> Float
norma (a,b) = sqrt (a*a + b*b)

sumaTerna :: (Float,Float,Float) -> Float
sumaTerna (a,b,c) = a + b + c

sumarSoloMultiplos :: (Int,Int,Int) -> Int -> Int
sumarSoloMultiplos (a,b,c) n = sumarSoloMultiplosAux a n + sumarSoloMultiplosAux b n + sumarSoloMultiplosAux c n

sumarSoloMultiplosAux ::  Int -> Int -> Int
sumarSoloMultiplosAux a n | esMultiploDe a n = a 
                          | otherwise = 0

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (a,b,c) | mod a 2 == 0 = 0
                     | mod b 2 == 0 = 1
                     | mod c 2 == 0 = 2
                     | otherwise = 4

crearPar :: (Eq t) => t -> t -> (t,t)
crearPar a b = (a,b)

invertir :: (Eq t) => (t,t) -> (t,t)
invertir (a,b) = (b,a)

-- EJERCICIO 5 

f' :: Int -> Int
f' n | n <= 7 = n * n
     | n > 7 = 2 * n - 1

g' :: Int -> Int
g' n | mod n 2 == 0 = div n 2
     | otherwise = 3 * n + 1

todosMenores :: (Int,Int,Int) -> Bool
todosMenores (a,b,c) = (f' a > g' a) && (f' b > g' b) && (f' c > g' c)

-- EJERCICIO 6 

bisiesto :: Int -> Bool
bisiesto n | mod n 4 /= 0 = False
           | mod n 100 == 0 && mod n 400 /= 0 = False
           | otherwise = True

-- EJERCICIO 7 

distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = sumaTerna (abs (a-d),abs (b-e),abs (c-f))

-- EJERCICIO 8

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos a = (mod a 10) + div (mod a 100) 10

comparar :: Int -> Int -> Int
comparar  a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
              | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = (-1)
              | otherwise = 0

-- EJERCICIO 9 

f1 :: Float -> Float
f1 n | n == 0 = 1
     | otherwise = 0 --  Si es 0 devuelve 1, si es distinto de 0 devuelve 0

f2 :: Float -> Float
f2 n | n == 1 = 15
     | n == -1 = -15 -- Multiplica x 15 


f3 :: Float -> Float
f3 n | n <= 9 = 7
     | n >= 3 = 5 -- Si n es menor o igual a 7 

f4 :: Float -> Float -> Float
f4 x y = ( x + y )/2 -- saca promedio

f5 :: ( Float , Float ) -> Float
f5 (x , y ) = ( x + y )/2 -- saca el promedio de los elementos de la tupla

f6 :: Float -> Int -> Bool
f6 a b = truncate a == b -- truncate pasa de Float a Int (sin decimales). Se fija si a y b tienen el mismo valor.