 {- PRIMER PARCIAL HASKELL (1ER CUETRIMESTRE 2024)

1. Ejercicio 1 (2 puntos)
problema aproboMasDeNMaterias : (registro:seq(seq:Char  x seq(Z)), alumno:seq(Char), n:Z): Bool{
    requiere: {No hay nombres de alumnos repetidos en registro}
    requiere: {las notas de registro son todas mayores o iguales a 0 y menores o iguales a 10}
    requiere: {n>0}
    requiere: {alumno se encuentra en registro}
    asegura: {res = True <=> el alumno tiene más de n notas de finales aprobados con mayor o igual a 4 en el registro}
}

2. Ejercicio 2 (2 puntos)
problema buenosAlumnos : (registro:seq(seq:(Char) x seq:(Z))): seq:(seq:(Char)) {
    requiere: {No hay nombres de alumnos repetidos en registro}
    requiere: {las notas de registro son todas mayores o iguales a 0 y menores o iguales a 10}
    asegura: { res es la lista de los nombres de alumnos que están en registro cuyo promedio de notas es mayor o ogual a 8 y no tienen notas menores a 4}
}

3. Ejercicio 3 (2 puntos)
problema mejorPromedio : (registro:seq(seq:(Char) x seq:(Z))): seq:(Char){
    requiere: {No hay nombres de alumnos repetidos en registro}
    requiere: {las notas de registro son todas mayores o iguales a 0 y menores o iguales a 10}
    requiere: {|registro|>0}
    asegura: {res es el nombre del alumno con promedio más alto, si hay más de uno, devuelve el que aparece primero}
}

4. Ejercicio 4 (3 puntos)
problema seGraduoConHonores : (registro: seq:(seq:Char x seq:(Z)), cantidadDeMateriasDeLaCarrera: Z, alumno: Seq:(Char)): Bool{
    requiere: {No hay nombres de alumnos repetidos en registro}
    requiere: {las notas de registro son todas mayores o iguales a 0 y menores o iguales a 10}
    requiere: {cantidadDeMateriasDeLaCarrera > 0}
    requiere: {alumno se encuentra en el registro}
    requiere: {|buenosAlumnos(registro)| > 0}
    asegura: {res=true <=> aproboMasDeNMaterias(registro, alumno, cantidadDeMateriasDeLaCarrera - 1) = true 
              y alumno pertenece al conjunto de buenosAlumnos(registro) y
              el promedio de notas de finales de alumno está a menos (estrictamente) de un punto del mejorPromedio(registro)}
}

-}




module Parcial5 where

-- EJERCICIO 1--------------------------------------------------------------------------

aproboMasDeNMaterias :: [([Char],[Int])] -> [Char] -> Int -> Bool
aproboMasDeNMaterias registro alumno n = (cuantasAprobo (notasAlumno alumno registro)) > n

--Funciones Aux Ej 1 

notasAlumno :: [Char] -> [([Char],[Int])] -> [Int]
notasAlumno nombre ((alumno,notas):xs) | nombre == alumno = notas
                                       | otherwise = notasAlumno nombre xs

cuantasAprobo :: [Int] -> Int 
cuantasAprobo [] = 0
cuantasAprobo (x:xs) | x >= 4 = 1 + cuantasAprobo xs
                       | otherwise = cuantasAprobo xs


-- EJERCICIO 2--------------------------------------------------------------------

buenosAlumnos :: [([Char],[Int])] -> [[Char]]
buenosAlumnos [] = []
buenosAlumnos ((nombre,notas):xs) | promedio notas >= 8 && noHayAplazos notas = nombre : (buenosAlumnos xs)
                                  | otherwise = buenosAlumnos xs

--Funciones Aux Ej 2 ^ 3 ^ 4

promedio :: [Int] -> Float
promedio [] = 0 
promedio notas = division (sumatoria notas) (length notas)

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

noHayAplazos :: [Int] -> Bool
noHayAplazos [] = True
noHayAplazos (x:xs) = x >= 4 && noHayAplazos xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

 
--EJERCICIO 3--------------------------------------------------------------------------------

mejorPromedio :: [([Char],[Int])] -> [Char]
mejorPromedio [(a,n)] = a
mejorPromedio ((a1,n1):(a2,n2):xs) | promedio n1 >= promedio n2 = mejorPromedio ((a1,n1):xs)
                                   | otherwise = mejorPromedio ((a2,n2):xs)

--EJERCICIO 4 ------------------------------------------------------------------------------

seGraduoConHonores :: [([Char],[Int])] -> Int -> [Char] -> Bool
seGraduoConHonores registro cantMaterias alumno = aproboMasDeNMaterias registro alumno (cantMaterias - 1) && pertenece alumno (buenosAlumnos registro) && (promedio (notas (mejorPromedio registro) registro)) - (promedio (notas alumno registro)) < 1 

-- Funcion Aux Ej 4

pertenece :: [Char] -> [[Char]] -> Bool
pertenece _ [] = False
pertenece c (x:xs) | c == x = True
                   | otherwise = pertenece c xs

notas :: [Char] -> [([Char],[Int])] -> [Int]
notas alumno ((a1,n1):xs) | alumno == a1 = n1
                          | otherwise = notas alumno xs
