
module Parser where 

import Prelude hiding ((<*>),(<$>))

infixl 2 <|>
infixl 3 <*>

type Parser s r = [s] -> [(r , [s])]

symbola :: Parser Char Char
symbola [] = []
symbola (x:xs) = if x == 'a' then [('a',xs)]
                 else []

symbol :: Eq a => a -> Parser a a
symbol s []                 = []
symbol s (x:xs) | s == x    = [(s,xs)]
                | otherwise = []

satisfy :: (s -> Bool) -> Parser s s
satisfy p []                  = []
satisfy p (x:xs) | p x        = [(x,xs)]
                 | otherwise = []


token :: Eq s => [s] -> Parser s [s]
token t [] = []
token t inp = if   take (length t) inp == t 
              then [(t,drop (length t) inp)]
              else []

token' a = (\ a b -> a) <$>  token a <*> spaces

succeed :: r -> Parser s r
succeed r inp = [ ( r , inp) ]

(<|>) :: Parser s a -> Parser s a -> Parser s a
(p <|> q) inp = p inp ++ q inp

pS =   token "while"
  <|>  token "for"

{-
(<*>)::Parser s a-> Parser s b-> Parser s (a,b)
(p <*> r) inp = [ ((x,y),ys)
                | (x,xs)  <- p inp
                , (y,ys)  <- r xs
		        ]
-}

(<$>) :: (a -> r) -> Parser s a -> Parser s r
(f <$> p) inp = [ (f v , xs)
                | (v   , xs)  <- p inp
                ]
{-
pS' =   f <$> (symbol 'a' <*> symbol 'b' <*> symbol 'c')
    <|> g <$> (symbol 'd')
  where f ((a,b),c) = [a,b,c]
        g d         = [d]
-}

(<*>) :: Parser s (a -> b) 
      -> Parser s a 
      -> Parser s b
(p <*> r) inp = [ (f v ,ys)
                | (f   ,xs)  <- p inp
                , (  v ,ys)  <- r xs
                ]
pS' =  f <$> symbol 'a' <*> symbol 'b' <*> symbol 'c'
   <|> g <$> symbol 'd'
  where f a b c  = [a,b,c]
        g d      = [d]


oneOrMore p =  sf1 <$> p <*> oneOrMore p
           <|> sf2 <$> p
  where sf1 x xs = x : xs
        sf2 x = [x]


--1.5
zeroOrMore :: Parser s r -> Parser s [r]
zeroOrMore p = sf <$> p <*> zeroOrMore p
             <|> succeed []
  where sf x xs = x : xs

--1.6

spaces = zeroOrMore 
          (satisfy (\x -> x `elem` [' ','\t','\n']))

symbol' a = (\ a b -> a) <$>  symbol a <*> spaces

--1.7
oneOrMore' p = sf <$> p <*> zeroOrMore p
  where sf x xs = x : xs

--1.9
separatedBy :: Parser s a -> Parser s b -> Parser s [a]
separatedBy x y = f <$> x
                <|> g <$> x <*> y <*> separatedBy x y 
                where f a = [a]
                      g b c d = b:d

enclosedBy :: Parser s a -> Parser s b -> Parser s c -> Parser s b
enclosedBy x y z = f <$> x <*> y <*> z
                where f x y z = y

--1.11
followedby :: Parser s a -> Parser s b -> Parser s [a]
followedby a b = f <$> a <*> b
                <|> g <$> a <*> b <*> followedby a b
            where f a b = [a]
                  g a b c = a:c 

block :: Parser s a -> Parser s b -> Parser s r -> Parser s f -> Parser s [r]
block a b c d = enclosedBy a (followedby c b) d