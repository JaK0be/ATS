module Ficha1 where

import Parser
import Prelude hiding ((<*>),(<$>))
import Data.Char

data Exp = AddExp Exp Exp
         | MulExp Exp Exp
         | SubExp Exp Exp
         | DivExp Exp Exp
         | GThen Exp Exp
         | LThen Exp Exp
         | OneExp Exp
         | Var String
         | Const Int

instance Show Exp where
    show = showExp

showExp (AddExp e1 e2) = showExp e1 ++ " + " ++ showExp e2
showExp (SubExp e1 e2) = showExp e1 ++ " - " ++ showExp e2
showExp (MulExp e1 e2) = showExp e1 ++ " * " ++ showExp e2
showExp (DivExp e1 e2) = showExp e1 ++ " / " ++ showExp e2
showExp (GThen e1 e2) = showExp e1 ++ " > " ++ showExp e2
showExp (LThen e1 e2) = showExp e1 ++ " < " ++ showExp e2
showExp (OneExp e1) = "(" ++ showExp e1 ++ ")"
showExp (Const i) = show i
showExp (Var a) = a

------------------------------------------------------
-- 1.1

number = f <$> satisfy isDigit
       <|> g <$> satisfy isDigit <*> number
       where f a = [a]
             g a b = a : b

ident = oneOrMore (satisfy isAlpha)


-------------------------------------------------------
-- 1.2

e :: Exp
e = MulExp (OneExp (AddExp (Var "var") (Const 3))) (Const 5) 


-------------------------------------------------------
--1.3

pexp :: Parser Char Exp
pexp = f <$> pterm
    <|> g <$> pterm <*> symbol '+' <*> pexp
    <|> h <$> pterm <*> symbol '-' <*> pexp
    where f a = a
          g a b c = AddExp a c
          h a b c = SubExp a c

pterm :: Parser Char Exp
pterm = f <$> pfactor
    <|> g <$> pfactor <*> symbol '*' <*> pterm
    <|> h <$> pfactor <*> symbol '/' <*> pterm
    where f a = a
          g a b c = MulExp a c
          h a b c = DivExp a c

pfactor :: Parser Char Exp
pfactor = f <$> number
        <|> g <$> ident
        <|> h <$> symbol '(' <*> pexp <*> symbol ')'
        where f a = Const (read a)
              g a = Var a 
              h a e f = OneExp e

---------------------------------------------------------
-- Parte 2

type Id = [Char]
data Prog = Prog Stats
data Stats = Stats [Stat]
data Stat = While Exp Stats
          | IfThenElse Exp Stats Stats
          | Assign Id Exp

instance Show Prog where
     show = showProg

showProg (Prog sts) = showStats sts

instance Show Stats where
     show = showStats

showStats (Stats l) = showStatsList l

showStatsList [] = ""
showStatsList (st:[]) = showStat st
showStatsList (st:sts) = showStat st ++ ";\n " ++ (showStatsList sts)

instance Show Stat where
     show = showStat

showStat (Assign n e) = n ++ " = " ++ showExp e
showStat (While e sts) = "while (" ++ showExp e ++ ")\n " ++ "{ " ++ showStats sts ++ "}"
showStat (IfThenElse e st1 st2) = "if (" ++ showExp e ++ ")\n then " ++ showStats st1 ++ " else " ++ showStats st2

ex = "if (i+1) then i=1 else i=2"
while = "while (i+1){i=1}"

--------------------------------------------------------------------------------
--1.8
pProg :: Parser Char Prog
pProg = f <$> pStats
    where f a = (Prog a)

pStats :: Parser Char Stats
pStats = Stats <$> succeed []
      <|> f <$> pStat 
      <|> g <$> pStat <*> symbol' ';' <*> pStats
        where f a             = Stats [a]
              g a b (Stats c) = Stats (a:c)

pStat :: Parser Char Stat
pStat =  f <$> ident <*> token "=" <*> pexp 
     <|> g <$> token "while (" <*> pexp <*> symbol' ')' <*> symbol' '{' <*> pStats <*> symbol' '}'
     <|> h <$> token "if ("    <*> pexp <*> token ") then " <*> pStats <*> token " else " <*> pStats
        where f a b c       = (Assign a c)
              g a b c d e f = (While b e)
              h a b c d e f = (IfThenElse b d f)

-------------------------------------------------------------------------------
--1.10
pProg' :: Parser Char Prog
pProg' = f <$> pStats'
    where f a = Prog a

pStats' :: Parser Char Stats
pStats' = Stats <$> separatedBy pStat' (symbol' ';')

pStat' :: Parser Char Stat
pStat' =  f <$> ident <*> token "=" <*> pexp 
     <|> g <$> token "while " <*> enclosedBy (symbol' '(') pexp (symbol' ')') <*> enclosedBy (symbol' '{') pStats' (symbol' '}')
     <|> h <$> token "if " <*> enclosedBy (symbol' '(') pexp (symbol' ')') <*> token " then " <*> pStats' <*> token " else " <*> pStats'
        where f a b c       = (Assign a c)
              g a b c = (While b c)
              h a b c d e f = (IfThenElse b d f)