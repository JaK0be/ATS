import Test.QuickCheck

data NovoProp = NovoProp Nome NIF Email Morada deriving Show
data NovoCliente = NovoCliente Nome NIF Email Morada X Y deriving Show
data NovoCarro = NovoCarro Tipo Marca Matricula NIF VMedia PKm CKm Autonomia X Y deriving Show
data Aluguer = Aluguer NIF X Y Tipo Pref deriving Show
data Classificacao1 = Classificacao1 NIF Nota deriving Show
data Classificacao2 = Classificacao2 Matricula Nota deriving Show

type Nome = String
type NIF = Integer
type Email = String
type Morada = String
data Tipo = Gasolina | Eletrico | Hibrido deriving Show
type Marca = String
type Matricula = String
type VMedia = Int
type PKm = Double
type CKm = Double
type Autonomia = Int
data Pref = MaisBarato | MaisPerto deriving Show
type Nota = Int
type X = Double
type Y = Double


nomes = ["Joao","Jose","Pedro","Miguel","Bruno","Carlos","Paulo","Jaime","Ricardo"]


brands = [(1,"Abarth"),(1,"Alfa Romeo"),(1,"Aston Martin"),(5,"Audi"),(1,"Bentley"),(9,"BMW"),(1,"Chevrolet"),(4,"Citroen"),(1,"Dacia"),(1,"DS"),(1,"Ferrari"),(3,"Fiat"),(3,"Ford"),(1,"Honda"),(1,"Hyundai"),(1,"Jaguar"),(1,"Jeep"),(1,"Kia"),(1,"Lamborghini"),(1,"Lancia"),(1,"Land Rover"),(1,"Lexus"),(1,"Maserati"),(2,"Mazda"),(8,"Mercedes-Benz"),(3,"Mini"),(1,"Mitsubishi"),(3,"Nissan"),(3,"Opel"),(6,"Peugeot"),(1,"Porsche"),(8,"Renault"),(1,"Rover"),(1,"Saab"),(4,"Seat"),(1,"Skoda"),(2,"Smart"),(1,"Suzuki"),(1,"Tesla"),(3,"Toyota"),(3,"Volvo"),(6,"Volkswagen")]


{-
totcarros = sum (map (\(x,y) -> x) marcas)

marcas = [(82,"Abarth"),(368,"Alfa Romeo"),(19,"Aston Martin"),(2454,"Audi"),(30,"Bentley"),(5052,"BMW"),(166,"Chevrolet"),(1741,"Citroen"),(148,"Dacia"),(115,"DS"),(54,"Ferrari"),(1942,"Fiat"),(1653,"Ford"),(321,"Honda"),(397,"Hyundai"),(263,"Jaguar"),(175,"Jeep"),(335,"Kia"),(12,"Lamborghini"),(63,"Lancia"),(322,"Land Rover"),(146,"Lexus"),(38,"Maserati"),(384,"Mazda"),(4878,"Mercedes-Benz"),(1099,"Mini"),(392,"Mitsubishi"),(1358,"Nissan"),(2064,"Opel"),(3542,"Peugeot"),(645,"Porsche"),(4861,"Renault"),(16,"Rover"),(26,"Saab"),(1859,"Seat"),(470,"Skoda"),(675,"Smart"),(89,"Suzuki"),(48,"Tesla"),(1126,"Toyota"),(1326,"Volvo"),(2928,"Volkswagen")]

func = map (\(x,y) -> (round((fromRational x)/(fromRational totcarros)*100),y)) marcas

func2 = sum (map (\(x,y) -> x) func)

func3 = length(filter (\(x,y) -> x==0) func)

-}
genTipo :: Gen Tipo
genTipo = frequency [(70, return Gasolina),(25, return Hibrido),(5, return Eletrico)]

genMarca :: Gen Marca
genMarca = frequency (map (\(x,y) -> (x,return y)) brands)

genMatricula :: Gen Matricula
genMatricula = do a <- choose('A','Z')
                  b <- choose('A','Z')
                  c <- choose(0 :: Int,9 :: Int)
                  d <- choose(0 :: Int,9 :: Int)
                  e <- choose(0 :: Int,9 :: Int)
                  f <- choose(0 :: Int,9 :: Int)
                  return $ ([a] ++ [b] ++ "-" ++ show(c) ++ show(d) ++ "-" ++ show(e) ++ show(f))


genNIF :: Gen NIF
genNIF = choose(100000000 :: Integer,999999999 :: Integer)

genVMedia :: Gen VMedia
genVMedia = choose(1 :: Int,100 :: Int)

genPKm :: Gen PKm
genPKm = choose(0.1 :: Double,5.0 :: Double)

genCKm :: Gen CKm
genCKm = choose(0.1 :: Double,0.5 :: Double)

genAutonomia :: Gen Autonomia
genAutonomia = choose(200 :: Int,900 :: Int)

genX :: Gen X
genX = choose(-180.0 :: Double,180.0 :: Double)

genY :: Gen Y
genY = choose(-90.0 :: Double,90 :: Double)

genNovoCarro :: Gen NovoCarro
genNovoCarro = do a <- genTipo
                  b <- genMarca
                  c <- genMatricula
                  d <- genNIF
                  e <- genVMedia
                  f <- genPKm
                  g <- genCKm
                  h <- genAutonomia
                  i <- genX
                  j <- genY
                  return (NovoCarro a b c d e f g h i j)

genPref :: Gen Pref
genPref = frequency[(50,return MaisPerto),(50, return MaisBarato)]


genAluguer :: Gen Aluguer
genAluguer = do a <- genNIF
                b <- genX
                c <- genY
                d <- genTipo
                e <- genPref
                return (Aluguer a b c d e)

genNota :: Gen Nota
genNota = choose (0 :: Int,100 :: Int)

genClassificacao1 :: Gen Classificacao1
genClassificacao1 = do a <- genNIF
                       b <- genNota
                       return (Classificacao1 a b)

genClassificacao2 :: Gen Classificacao2
genClassificacao2 = do a <- genMatricula
                       b <- genNota
                       return (Classificacao2 a b)