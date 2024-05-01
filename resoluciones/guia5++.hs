
-- EJERCICIO 1 

type Punto2D = (Float,Float)

prodInt :: Punto2D -> Punto2D -> Float
prodInt (a,b) (c,d) = a*c + b*d

todoMenor :: Punto2D -> Punto2D -> Bool
todoMenor (a,b) (c,d) = a < c && b < d

distanciaPuntos :: Punto2D -> Punto2D -> Float
distanciaPuntos (a,b) (c,d) = norma (a - c , b - d)

norma :: Punto2D -> Float
norma (a,b) = sqrt (a*a + b*b)

type Coordenada = (Float,Float)

crearPar :: Float -> Float -> Coordenada
crearPar a b = (a,b)


-- EJERCICIO 2

type Año = Int
type EsBisiesto = Bool

bisiesto :: Año -> EsBisiesto
bisiesto n | mod n 4 /= 0 = False
           | mod n 100 == 0 && mod n 400 /= 0 = False
           | otherwise = True


-- EJERCICIO 3

type Coordenada3d = (Float, Float, Float)

distanciaManhattan :: Coordenada3d -> Coordenada3d -> Float
distanciaManhattan (a,b,c) (d,e,f) = sumaTerna (abs (a-d),abs (b-e),abs (c-f))

sumaTerna :: Coordenada3d -> Float
sumaTerna (a,b,c) = a + b + c

-- EJERCICIO 4

type Nombre = String
type ContactosTel = [String]
type Contacto = String

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos s (x:xs) = s == x || enLosContactos s xs

agregarContacto :: Contacto -> ContactosTel -> ContactosTel -- a qué se refiere con "actualiza el telefono?"
agregarContacto contacto lista = contacto : lista

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto _ [] = []
eliminarContacto nombre (l:ls) | nombre == l = ls
                               | otherwise = l : (eliminarContacto nombre ls)


-- EJERCICIO 5


existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker _ [] = False 
existeElLocker identificacion (x:xs) = perteneceALocker identificacion x || existeElLocker identificacion xs

perteneceALocker :: Identificacion -> Locker -> Bool
perteneceALocker identificacion (a,b) = identificacion == a


ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion -- asumo que requiere = { existeElLocker j (x:xs)}
ubicacionDelLocker j (x:xs) | perteneceALocker j x = darUbicacion x 
                            | otherwise = ubicacionDelLocker j xs

darUbicacion :: Locker -> Ubicacion
darUbicacion (x,(a,b)) = b

estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool -- asumo que requiere = { existeElLocker j (x:xs)}
estaDisponibleElLocker ide (x:xs) | perteneceALocker ide x = estaLibre x
                                  | otherwise = estaDisponibleElLocker ide xs

estaLibre :: Locker -> Bool
estaLibre (x,(a,b)) = a == Libre

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers -- asumo que requiere = { existeElLocker j (x:xs)}
ocuparLocker ide (x:xs) | perteneceALocker ide x = (ocupar x) : xs
                        | otherwise = x : (ocuparLocker ide xs)

ocupar :: Locker -> Locker
ocupar (x,(a,b)) = (x,(Ocupado,b))


type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
data Disponibilidad = Libre | Ocupado deriving (Eq, Show)
type Texto = [Char]
