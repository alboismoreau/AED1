import Parcial4
import Test.HUnit

test1 = test [
    "no hay que codificar" ~: ( hayQueCodificar 'h' [('a','b'), ('c','d'), ('e','f')]) ~?= False,
    "no hay que codificar y coincide con segunda" ~: ( hayQueCodificar 'd' [('a','b'), ('c','d'), ('e','f')]) ~?= False,
    "hay que codificar primera" ~: ( hayQueCodificar 'a' [('a','b'), ('c','d'), ('e','f')]) ~?= True,
    "hay que codificar segunda" ~: ( hayQueCodificar 'c' [('a','b'), ('c','d'), ('e','f')]) ~?= True,
    "hay que codificar tercera" ~: ( hayQueCodificar 'e' [('a','b'), ('c','d'), ('e','f')]) ~?= True
    ]

test2 = test [
    "0 veces" ~: (cuantasVecesHayQueCodificar 'h' ['h', 'e', 'z'] [('a','h'), ('c','d'), ('e','f')]) ~?= 0,
    "1 vez" ~: (cuantasVecesHayQueCodificar 'e' ['x', 'e', 'z'] [('a','b'), ('c','d'), ('e','f')]) ~?= 1,
    "2 veces" ~: (cuantasVecesHayQueCodificar 'e' ['x', 'e', 'e'] [('a','b'), ('l','d'), ('e','f')]) ~?= 2,
    "3 veces" ~: (cuantasVecesHayQueCodificar 'e' ['e', 'e', 'e'] [('f','b'), ('k','d'), ('e','f')]) ~?= 3
    ]

test3 = test [
    "empate de 2" ~: (laQueMasHayQueCodificar ['h', 'e', 'z'] [('a','h'), ('h','d'), ('e','f')]) ~?= 'h',
    "empate de 3" ~: (laQueMasHayQueCodificar ['h', 'e', 'z'] [('z','h'), ('h','d'), ('e','f')]) ~?= 'h',
    "empate de 2 con cero veces" ~: (laQueMasHayQueCodificar ['h', 'e', 'z'] [('a','h'), ('x','d'), ('p','f')]) ~?= 'h',
    "primera" ~: (laQueMasHayQueCodificar ['h', 'e', 'z', 'h'] [('a','h'), ('h','d'), ('e','f'), ('h','g')]) ~?= 'h',
    "segunda" ~: (laQueMasHayQueCodificar ['h', 'e', 'z', 'e'] [('a','h'), ('h','d'), ('e','f'), ('h','g')]) ~?= 'e',
    "tercera" ~: (laQueMasHayQueCodificar ['h', 'e', 'z', 'z'] [('a','h'), ('h','d'), ('z','f'), ('h','g')]) ~?= 'z'
    ]

test4 = test [
    "no hay que codificar ninguna" ~: (codificarFrase ['x', 'y', 'z'] [('a','h'), ('h','d'), ('e','f')]) ~?= ['x', 'y', 'z'],
    "hay que codificar todas desordenadas" ~: (codificarFrase ['x', 'y', 'z'] [('y','h'), ('z','d'), ('x','f')]) ~?= ['y', 'z', 'x'],
    "hay que codificar todas ordenaditas" ~: (codificarFrase ['x', 'y', 'z'] [('x','h'), ('y','d'), ('z','f')]) ~?= ['x', 'y', 'z'], 
    "codificar solo primera" ~: (codificarFrase ['x', 'y', 'z'] [('a','h'), ('x','d'), ('e','f')]) ~?= ['a', 'y', 'z'],
    "codificar solo ultima" ~: (codificarFrase ['x', 'y', 'z'] [('z','h'), ('h','d'), ('e','f')]) ~?= ['x', 'y', 'e']
    ]