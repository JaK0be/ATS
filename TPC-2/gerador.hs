import Test.QuickCheck
import System.IO

------------------------------------------------------------------------------
-- Definição Dados para geração
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


data NovoProp = NovoProp Nome NIF Email Morada
instance Show NovoProp where
  show = print_np
print_np (NovoProp a b c d) = "NovoProp:" ++ a ++ "," ++ show(b) ++ "," ++ c ++ "," ++ d

data NovoCliente = NovoCliente Nome NIF Email Morada X Y
instance Show NovoCliente where
  show = print_nc
print_nc (NovoCliente a b c d e f) = "NovoCliente:" ++ a ++ "," ++ show(b) ++ "," ++ c ++ "," ++ d ++ "," ++ show(e) ++ "," ++ show(f)

data NovoCarro = NovoCarro Tipo Marca Matricula NIF VMedia PKm CKm Autonomia X Y
instance Show NovoCarro where
  show = print_ncc
print_ncc (NovoCarro a b c d e f g h i j) = "NovoCarro:" ++ show(a) ++ "," ++ b ++ "," ++ c ++ "," ++ show(d) ++ "," ++ show(e) ++ "," ++ show(f) ++ "," ++ show(g) ++ "," ++ show(h) ++ "," ++ show(i) ++ "," ++ show(j)

data Aluguer = Aluguer NIF X Y Tipo Pref
instance Show Aluguer where
  show = print_al
print_al (Aluguer a b c d e) = "Aluguer:" ++ show(a) ++ "," ++ show(b) ++ "," ++ show(c) ++ "," ++ show(d) ++ "," ++ show(e)

data Classificacao1 = Classificacao1 NIF Nota
instance Show Classificacao1 where
  show = print_c1
print_c1 (Classificacao1 a b) = "Classificar:" ++ show(a) ++ "," ++ show(b)

data Classificacao2 = Classificacao2 Matricula Nota
instance Show Classificacao2 where
  show = print_c2
print_c2 (Classificacao2 a b) = "Classificar:" ++ a ++ "," ++ show(b)

------------------------------------------------------------------------------
-- Definição Listas com Nomes,Concelhos e Email para posterior utilização nos geradores
namesF = ["Maria","Ana","Sandra","Carla","Sonia","Susana","Paula","Claudia","Patricia","Silvia","Andreia","Joana","Catia","Sara","Tania","Liliana","Ines","Catarina","Mariana","Beatriz","Daniela","Diana","Leonor","Matilde","Carolina","Francisca","Sofia","Rafaela","Adriana","Margarida","Rita","Julia","Mafalda","Benedita","Dulce","Cecilia","Lidia","Flora","Ariana","Vanessa","Filipa","Rute","Jessica","Leticia","Regina","Fatima","Cristiana","Silvana","Isabel","Bruna","Telma","Monica","Raquel","Teresa","Gisela","Cristina","Juliana","Alexandra","Gabriela","Alice","Anabela","Barbara","Laura","Tatiana","Helena","Olga"]
namesM = ["Jose","Nuno","Pedro","Paulo","Joao","Rui","Luis","Carlos","Antonio","Ricardo","Tiago","Bruno","Andre","Diogo","Miguel","Santiago","Jaime","Francisco","Afonso","Rodrigo","Martim","Tomas","Duarte","Gabriel","Hugo","Guilherme","Leonardo","Rafael","Micael","Angelo","Lucas","Salvador","Mateus","Gustavo","Cristiano","Ruben","Salvador","Lourenco","Emanuel","Vasco","Gil","Marco","Daniel","Jorge","Fabio","Nelson","Telmo","Bernardo","Rodolfo","Goncalo","Filipe","Claudio","Eduardo","Edgar","Julio","Fernando","David","Vitor","Alfredo","Helder","Frederico","Henrique","Sergio","Roberto","Artur","Samuel","Alexandre"]
names = namesM ++ namesF

concelhos = ["Abrantes","Agueda","Aguiar da Beira","Alandroal","Albergaria-a-Velha","Albufeira","Alcacer do Sal","Alcanena","Alcobaca","Alcochete","Alcoutim","Alenquer","Alfandega da Fe","Alijo","Aljezur","Aljustrel","Almada","Almeida","Almeirim","Almodovor","Alpiarca","Alter do Chao","Alvaiazere","Alvito","Amadora","Amarante","Amares","Anadia","Angra do Heroismo","Ansiao","Arcos de Valdevez","Arganil","Argamar","Arouca","Arraiolos","Arronches","Arruda dos Vinhos","Aveiro","Avis","Azambuja","Baiao","Barcelos","Barrancos","Barreiro","Batalha","Beja","Belmonte","Benavente","Bombarral","Borba","Boticas","Braga","Braganca","Cabeceiras de Basto","Cadaval","Caldas da Rainha","Calheta(Acores)","Calheta(Madeira)","Camara de Lobos","Caminha","Campo Maior","Cantanhede","Carrazeda de Ansiaes","Carregal do Sal"," Cartaxo","Cascais","Castanheira de Pera","Castelo Branco","Castelo de Paiva","Castelo de Vide","Castro Daire","Castro Marim","Castro Verde","Celorico da Beira","Celorico de Basto","Chamusca","Chaves","Cinfaes","Coimbra","Condeixa-a-Nova","Constancia","Coruche","Corvo","Covilha","Crato","Cuba","Elvas","Entrocamento","Espinho","Esposende","Estarreja","Estremoz","Evora","Fafe","Faro","Felgueiras","Ferreira do Alentejo","Ferreira do Zezere","Figueira da Foz","Figueira de Castelo Rodrigo","Figueiro dos Vinhos","Fornos de Algodres","Freixo de Espada a Cinta","Fronteira","Funchal","Fundao","Gaviao","Gois","Golega","Gondomar","Gouveia","Grandola","Guarda","Guimaraes","Horta","Idanha-a-Nova","Lagoa(Acores)","Lagoa(Algarve)","Lagos","Lajes das Flores"," Laje do Pico","Lamego","Leiria","Lisboa","Loule","Loures","Lourinha","Lousa","Lousada","Macao","Macedo de Cavaleiros","Machico","Madalena","Mafra","Maia","Mangualde","Manteigas","Marco de Canaveses","Marinha Grande","Marvao","Matosinhos","Mealhada","Meda","Melgaco","Mertola","Mesao Frio","Mira","Mirando do Corvo","Miranda do Douro","Mirandela","Mogadouro","Moimenta da Beira","Moita","Moncao","Monchique","Mondim de Basto","Monforte","Montalegre","Montemor-o-Velho","Montemor-o-Novo","Montijo","Mora","Mortagua","Moura","Mourao","Murca","Murtosa","Nazare","Nelas","Nisa","Nordeste","Obidos","Odemira","Odivelas","Oeiras","Oleiros","Olhao da Restauracao","Oliveira de Azemeis","Oliveira de Frades","Oliveira do Bairro","Oliveira do Hospital","Ourem","Ourique","Ovar","Pacos de Ferreira","Palmela","Pampilhosa da Serra","Paredes","Paredes de Coura","Pedrogao Grande","Penacovam","Penafiel","Penalva do Castelo","Penamacor","Penedono","Penela","Peniche","Peso da Regua","Pinhel","Pombal","Ponta Delgada","Ponta do Sol","Ponte da Barca","Ponte de Lima","Ponte de Sor","Portalegre","Portel","Portimao","Porto","Porto de Mos","Porto Moniz","Porto Santo","Povoa de Lanhoso","Povoa de Varzim","Povoacao","Praia da Vitoria","Proenca-a-Nova","Redondo","Reguengos de Monsaraz","Resende","Ribeira Brava","Ribeira de Pena","Ribeira Grande","Rio Maior","Sabrosa","Sabugal","Salvaterra de Magos","Sabta Comba Dao","Santa Cruz","Santa Cruz da Graciosa","Santa Cruz das Flores","Santa Maria da Feira","Santa Marta de Penaguiao","Santana","Santarem","Santiago do Cacem","Santo Tirso","Sao Bras de Alportel","Sao Joao da Madeira","Sao Joao da Pesqueira","Sao Pedro do Sul","Sao Roque do Pico","Sao Vicente","Sardoal","Satao","Seia","Seixal","Sernancelhe","Serpa","Serta","Sesimbra","Setubal","Sever do Vouga","Silves","Sines","Sintra","Sobral de Monte Agraco","Soure","Sousel","Tabua","Tabuaco","Tarouca","Tavira","Terras do Bouro","Tomar","Tondela","Torre de Moncorvo","Torres Novas","Torres Vedras","Trancoso","Trofa","Vagos","Vale de Cambra","Valenca","Valongo","Valpacos","Velas","Vendas Novas","Viana do Alentejo","Viana do Castelo","Vidigueira","Vieira do Minho","Vila de rei","Vila do Bispo","Vila do Conde","Vila do Porto","Vila Flor","Vila Franca de Xira","Vila Franca do Campo","Vila Nova da Barquinha","Vila Nova de Cerveira","Vila Nova de Famalicao","Vila Nova de Foz Coa","Vila Nova de Gaia","Vila Nova de Paiva","Vila Nova de Poiares","Vila Pouca de Aguiar","Vila Real","Vila Real de Santo Antonio","Vilha Velha de Rodao","Vila Verde","Vila Vicosa","Vimioso","Vinhais","Viseu","Vizela","Vouzela"]

email = ["@gmail.com","@hotmail.com","@live.pt"]

brands = [(1,"Abarth"),(1,"Alfa Romeo"),(1,"Aston Martin"),(5,"Audi"),(1,"Bentley"),(9,"BMW"),(1,"Chevrolet"),(4,"Citroen"),(1,"Dacia"),(1,"DS"),(1,"Ferrari"),(3,"Fiat"),(3,"Ford"),(1,"Honda"),(1,"Hyundai"),(1,"Jaguar"),(1,"Jeep"),(1,"Kia"),(1,"Lamborghini"),(1,"Lancia"),(1,"Land Rover"),(1,"Lexus"),(1,"Maserati"),(2,"Mazda"),(8,"Mercedes-Benz"),(3,"Mini"),(1,"Mitsubishi"),(3,"Nissan"),(3,"Opel"),(6,"Peugeot"),(1,"Porsche"),(8,"Renault"),(1,"Rover"),(1,"Saab"),(4,"Seat"),(1,"Skoda"),(2,"Smart"),(1,"Suzuki"),(1,"Tesla"),(3,"Toyota"),(3,"Volvo"),(6,"Volkswagen")]

------------------------------------------------------------------------------
-- Geradores de Tipos

-- Gerador Nomes
genNome :: Gen Nome
genNome = elements names

-- Gerador Moradas(Concelhos)
genMorada :: Gen Morada
genMorada = elements concelhos

-- Gerador Tipos de Combustão
genTipo :: Gen Tipo
genTipo = frequency [(70, return Gasolina),(25, return Hibrido),(5, return Eletrico)]

-- Gerador Marcas de Carros
genMarca :: Gen Marca
genMarca = frequency (map (\(x,y) -> (x,return y)) brands)

-- Gerador Matrículas
genMatricula :: Gen Matricula
genMatricula = do a <- choose('A','Z')
                  b <- choose('A','Z')
                  c <- choose(0 :: Int,9 :: Int)
                  d <- choose(0 :: Int,9 :: Int)
                  e <- choose(0 :: Int,9 :: Int)
                  f <- choose(0 :: Int,9 :: Int)
                  return $ ([a] ++ [b] ++ "-" ++ show(c) ++ show(d) ++ "-" ++ show(e) ++ show(f))

-- Gerador Emails
genEmail :: Integer -> Gen Email
genEmail x = do a <- elements email
                return $ (show(x) ++ a)

-- Gerador NIFs
genNIF :: Gen NIF
genNIF = choose(100000000 :: Integer,999999999 :: Integer)

-- Gerador Velocidade Média
genVMedia :: Gen VMedia
genVMedia = choose(1 :: Int,100 :: Int)

-- Gerador Preço/Km
genPKm :: Gen PKm
genPKm = choose(0.1 :: Double,5.0 :: Double)

-- Gerador Custo/Km
genCKm :: Gen CKm
genCKm = choose(0.1 :: Double,0.5 :: Double)

-- Gerador Autonomia
genAutonomia :: Gen Autonomia
genAutonomia = choose(200 :: Int,900 :: Int)

-- Gerador Latitude
genX :: Gen X
genX = choose(-180.0 :: Double,180.0 :: Double)

-- Gerador Longitude
genY :: Gen Y
genY = choose(-90.0 :: Double,90 :: Double)

-- Gerador Preferência de Viagem
genPref :: Gen Pref
genPref = frequency[(50,return MaisPerto),(50, return MaisBarato)]

-- Gerador Nota de avaliação
genNota :: Gen Nota
genNota = choose (0 :: Int,100 :: Int)

-- Gerador de um Proprietário
genNovoProp :: Gen NovoProp
genNovoProp = do a <- elements names
                 b <- genNIF
                 c <- genEmail b
                 d <- elements concelhos
                 return (NovoProp a b c d)

-- Gerador de um Carro
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

-- Gerador de um Cliente
genNovoCliente :: Gen NovoCliente
genNovoCliente = do a <- genNome
                    b <- genNIF
                    c <- genEmail b
                    d <- elements concelhos
                    e <- genX
                    f <- genY
                    return (NovoCliente a b c d e f)

-- Gerador de Alugueres
genAluguer :: Gen Aluguer
genAluguer = do a <- genNIF
                b <- genX
                c <- genY
                d <- genTipo
                e <- genPref
                return (Aluguer a b c d e)

-- Gerador de Reviews(NIF)
genClassificacao1 :: Gen Classificacao1
genClassificacao1 = do a <- genNIF
                       b <- genNota
                       return (Classificacao1 a b)

-- Gerador de Reviews(Matrículas)
genClassificacao2 :: Gen Classificacao2
genClassificacao2 = do a <- genMatricula
                       b <- genNota
                       return (Classificacao2 a b)

------------------------------------------------------------------------------
-- Gerador Dados
gerador :: Show a => String -> Gen a -> Int -> IO()
gerador file g val =
  do cases <- generate (sequence [ resize n g | n <- [0,1..(val-1)] ])
     mapM_ ((appendFile file).((++)['\n']).(show)) cases

----------------------------------------------
-- Função Main
main :: IO()
main = do putStrLn "Nome do Ficheiro onde os dados serão armazenados: "
          file <- getLine
          putStrLn "Número de Proprietários a gerar: "
          a <- getLine
          putStrLn "Número de Clientes a gerar: "
          b <- getLine
          putStrLn "Número de Carros a gerar: "
          c <- getLine
          putStrLn "Número de Alugueres a gerar: "
          d <- getLine
          putStrLn "Número de Classificações a gerar: "
          e <- getLine
          let nnp = (read a :: Int)
          let nnc = (read b :: Int)
          let nncc = (read c :: Int)
          let nna = (read d :: Int)
          let nc1 = (read e :: Int)
          let nc2 = div nc1 2
          f <- appendFile file "Logs"
          g <- gerador file genNovoProp nnp
          h <- gerador file genNovoCliente nnc
          i <- gerador file genNovoCarro nncc
          j <- gerador file genAluguer nna
          k <- gerador file genClassificacao1 nc2
          gerador file genClassificacao2 nc2