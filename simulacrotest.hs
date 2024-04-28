import Simulacro
import Test.HUnit

masAmigos = test [
    "una sola tupla" ~: (personaConMasAmigos [("ana","luz")]) ~?= "ana" || "luz"
    "empate con repetidos" ~: (personaConMasAmigos [("ana","luz"),("luz","marcos"),("marcos","maria"),("rita","mel")]) ~?= "luz" || "marcos"
    "empate sin repetidos" ~: (personaConMasAmigos [("ana","luz"),("pato","marcos")]) ~?= "luz" || "marcos" || "pato" || "ana"
    "gana primera posicion" ~: (personaConMasAmigos [("ana","luz"),("ana","marcos"),("marcos","maria"),("rita","mel")]) ~?= "ana"
    "gana segunda posicion" ~: (personaConMasAmigos [("ana","luz"),("pato","ma"),("marcos","m"),("rita","luz")]) ~?= "luz" || "luz"
    ]

run = runTestTT masAmigos