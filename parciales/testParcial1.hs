import Parcial1 
import Test.HUnit 


test1 = test [
  "componentes repetidas" ~: (formulasValidas [("ana", "ana")]) ~?= False,
  "tupla repetida" ~: (formulasValidas [("ana", "pedro"), ("ana", "pedro")]) ~?= False,
  "tupla repetida invertida" ~: (formulasValidas [("ana", "pedro"), ("pedro", "ana")]) ~?= False,
  "todas diferentes" ~: (formulasValidas [("ana", "peiu"), ("lucas", "carlos")]) ~?= True
  ]
test2 = test [
  "20 por ciento" ~: (porcentajeDeVotos "ana" [("ana", "peiu"), ("mica", "carlos")] [20, 50, 30]) ~?= 20
  ]
test3 = test [
  "5 votos en blanco" ~: (votosEnBlanco [("ana", "peiu"), ("mica", "carlos")] [1, 2, 7] 15) ~?= 5,
  "0 votos en blanco" ~: (votosEnBlanco [("ana", "peiu"), ("mica", "carlos")] [1, 2, 7] 10) ~?= 0
  ]
test4 = test [
  "gana primero" ~: (proximoPresidente [("ana", "peiu"), ("mica", "carlos")] [40, 2]) ~?= "ana",
  "gana ultimo" ~: (proximoPresidente [("ana", "peiu"), ("mica", "carlos")] [4, 20]) ~?= "mica",
  "empate de dos" ~: (proximoPresidente [("ana", "peiu"), ("mica", "carlos"), ("juan", "flor")] [40, 100, 100]) ~?= "mica",
  "empate de tres" ~: (proximoPresidente [("ana", "peiu"), ("mica", "carlos"), ("juan", "flor")] [100, 100, 100]) ~?= "ana"
  ]
