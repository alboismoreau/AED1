
import Parcial1
import Test.HUnit

testFormuValidas = test[
    "lista vacía" ~: (formulasValidas []) ~?= True,
    "mismo elemento" ~: (formulasValidas [("marcos", "maria"), ("ana", "ana")]) ~?= False,
    "misma tupla1" ~: (formulasValidas [("marcos", "maria"), ("maria", "ana")]) ~?= False,
    "misma tupla2" ~: (formulasValidas [("marcos", "maria"), ("ana", "maria")]) ~?= False,
    "valida" ~: (formulasValidas [("marcos", "maria"), ("ana", "Rita")]) ~?= True,
    ]

testMenosVot = test[
    "empate" ~: (menosVotado [("ana", "marcos"), ("maria", "rita")] -> [1, 1]) ~?= "ana" || "maria",
    "gana ana" ~: (menosVotado [("ana", "marcos"), ("maria", "rita")] -> [3, 1]) ~?= "maria",
    "gana maria" ~: (menosVotado [("ana", "marcos"), ("maria", "rita")] -> [1, 1]) ~?= "ana",
    ]