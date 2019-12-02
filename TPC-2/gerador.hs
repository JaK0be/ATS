import Test.QuickCheck

--NovoProp: nome, nif, email,morada -
--NovoCliente:nome,nif,email,morada,X,Y -
     -- X e Y : posicçao onde se encontra
--NovoCarro:tipo,marca,matricula,nif,velocidade media,preço por km, consumo por km, autonomia, X, Y -
     -- X e Y : posicçao onde se encontra
--Aluguer: nif cliente, X destino, Y destino, tipoCombustivel , preferencia -
--Classificar: matricula ou nif (cliente ou prop) , nota (0-100) -

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


namesF = ["Maria","Ana","Sandra","Carla","Sonia","Susana","Paula","Claudia","Patricia","Silvia","Andreia","Joana","Catia","Sara","Tania","Liliana","Ines","Catarina","Mariana","Beatriz","Daniela","Diana","Leonor","Matilde","Carolina","Francisca","Sofia","Rafaela","Adriana","Margarida","Rita","Julia","Mafalda","Benedita","Dulce","Cecilia","Lidia","Flora","Ariana","Vanessa","Filipa","Rute","Jessica","Leticia","Regina","Fatima","Cristiana","Silvana","Isabel","Bruna","Telma","Monica","Raquel","Teresa","Gisela","Cristina","Juliana","Alexandra","Gabriela","Alice","Anabela","Barbara","Laura","Tatiana","Helena","Olga"]
namesM = ["Jose","Nuno","Pedro","Paulo","Joao","Rui","Luis","Carlos","Antonio","Ricardo","Tiago","Bruno","Andre","Diogo","Miguel","Santiago","Jaime","Francisco","Afonso","Rodrigo","Martim","Tomas","Duarte","Gabriel","Hugo","Guilherme","Leonardo","Rafael","Micael","Angelo","Lucas","Salvador","Mateus","Gustavo","Cristiano","Ruben","Salvador","Lourenco","Emanuel","Vasco","Gil","Marco","Daniel","Jorge","Fabio","Nelson","Telmo","Bernardo","Rodolfo","Goncalo","Filipe","Claudio","Eduardo","Edgar","Julio","Fernando","David","Vitor","Alfredo","Helder","Frederico","Henrique","Sergio","Roberto","Artur","Samuel","Alexandre"]
names = namesM ++ namesF

concelhos = ["Abrantes","Agueda","Aguiar da Beira","Alandroal","Albergaria-a-Velha","Albufeira","Alcacer do Sal","Alcanena","Alcobaca","Alcochete","Alcoutim","Alenquer","Alfandega da Fe","Alijo","Aljezur","Aljustrel","Almada","Almeida","Almeirim","Almodovor","Alpiarca","Alter do Chao","Alvaiazere","Alvito","Amadora","Amarante","Amares","Anadia","Angra do Heroismo","Ansiao","Arcos de Valdevez","Arganil","Argamar","Arouca","Arraiolos","Arronches","Arruda dos Vinhos","Aveiro","Avis","Azambuja","Baiao","Barcelos","Barrancos","Barreiro","Batalha","Beja","Belmonte","Benavente","Bombarral","Borba","Boticas","Braga","Braganca","Cabeceiras de Basto","Cadaval","Caldas da Rainha","Calheta(Acores)","Calheta(Madeira)","Camara de Lobos","Caminha","Campo Maior","Cantanhede","Carrazeda de Ansiaes","Carregal do Sal"," Cartaxo","Cascais","Castanheira de Pera","Castelo Branco","Castelo de Paiva","Castelo de Vide","Castro Daire","Castro Marim","Castro Verde","Celorico da Beira","Celorico de Basto","Chamusca","Chaves","Cinfaes","Coimbra","Condeixa-a-Nova","Constancia","Coruche","Corvo","Covilha","Crato","Cuba","Elvas","Entrocamento","Espinho","Esposende","Estarreja","Estremoz","Evora","Fafe","Faro","Felgueiras","Ferreira do Alentejo","Ferreira do Zezere","Figueira da Foz","Figueira de Castelo Rodrigo","Figueiro dos Vinhos","Fornos de Algodres","Freixo de Espada a Cinta","Fronteira","Funchal","Fundao","Gaviao","Gois","Golega","Gondomar","Gouveia","Grandola","Guarda","Guimaraes","Horta","Idanha-a-Nova","Lagoa(Acores)","Lagoa(Algarve)","Lagos","Lajes das Flores"," Laje do Pico","Lamego","Leiria","Lisboa","Loule","Loures","Lourinha","Lousa","Lousada","Macao","Macedo de Cavaleiros","Machico","Madalena","Mafra","Maia","Mangualde","Manteigas","Marco de Canaveses","Marinha Grande","Marvao","Matosinhos","Mealhada","Meda","Melgaco","Mertola","Mesao Frio","Mira","Mirando do Corvo","Miranda do Douro","Mirandela","Mogadouro","Moimenta da Beira","Moita","Moncao","Monchique","Mondim de Basto","Monforte","Montalegre","Montemor-o-Velho","Montemor-o-Novo","Montijo","Mora","Mortagua","Moura","Mourao","Murca","Murtosa","Nazare","Nelas","Nisa","Nordeste","Obidos","Odemira","Odivelas","Oeiras","Oleiros","Olhao da Restauracao","Oliveira de Azemeis","Oliveira de Frades","Oliveira do Bairro","Oliveira do Hospital","Ourem","Ourique","Ovar","Pacos de Ferreira","Palmela","Pampilhosa da Serra","Paredes","Paredes de Coura","Pedrogao Grande","Penacovam","Penafiel","Penalva do Castelo","Penamacor","Penedono","Penela","Peniche","Peso da Regua","Pinhel","Pombal","Ponta Delgada","Ponta do Sol","Ponte da Barca","Ponte de Lima","Ponte de Sor","Portalegre","Portel","Portimao","Porto","Porto de Mos","Porto Moniz","Porto Santo","Povoa de Lanhoso","Povoa de Varzim","Povoacao","Praia da Vitoria","Proenca-a-Nova","Redondo","Reguengos de Monsaraz","Resende","Ribeira Brava","Ribeira de Pena","Ribeira Grande","Rio Maior","Sabrosa","Sabugal","Salvaterra de Magos","Sabta Comba Dao","Santa Cruz","Santa Cruz da Graciosa","Santa Cruz das Flores","Santa Maria da Feira","Santa Marta de Penaguiao","Santana","Santarem","Santiago do Cacem","Santo Tirso","Sao Bras de Alportel","Sao Joao da Madeira","Sao Joao da Pesqueira","Sao Pedro do Sul","Sao Roque do Pico","Sao Vicente","Sardoal","Satao","Seia","Seixal","Sernancelhe","Serpa","Serta","Sesimbra","Setubal","Sever do Vouga","Silves","Sines","Sintra","Sobral de Monte Agraco","Soure","Sousel","Tabua","Tabuaco","Tarouca","Tavira","Terras do Bouro","Tomar","Tondela","Torre de Moncorvo","Torres Novas","Torres Vedras","Trancoso","Trofa","Vagos","Vale de Cambra","Valenca","Valongo","Valpacos","Velas","Vendas Novas","Viana do Alentejo","Viana do Castelo","Vidigueira","Vieira do Minho","Vila de rei","Vila do Bispo","Vila do Conde","Vila do Porto","Vila Flor","Vila Franca de Xira","Vila Franca do Campo","Vila Nova da Barquinha","Vila Nova de Cerveira","Vila Nova de Famalicao","Vila Nova de Foz Coa","Vila Nova de Gaia","Vila Nova de Paiva","Vila Nova de Poiares","Vila Pouca de Aguiar","Vila Real","Vila Real de Santo Antonio","Vilha Velha de Rodao","Vila Verde","Vila Vicosa","Vimioso","Vinhais","Viseu","Vizela","Vouzela"]

email = ["@gmail.com","@hotmail.com","@live.pt"]

brands = [(1,"Abarth"),(1,"Alfa Romeo"),(1,"Aston Martin"),(5,"Audi"),(1,"Bentley"),(9,"BMW"),(1,"Chevrolet"),(4,"Citroen"),(1,"Dacia"),(1,"DS"),(1,"Ferrari"),(3,"Fiat"),(3,"Ford"),(1,"Honda"),(1,"Hyundai"),(1,"Jaguar"),(1,"Jeep"),(1,"Kia"),(1,"Lamborghini"),(1,"Lancia"),(1,"Land Rover"),(1,"Lexus"),(1,"Maserati"),(2,"Mazda"),(8,"Mercedes-Benz"),(3,"Mini"),(1,"Mitsubishi"),(3,"Nissan"),(3,"Opel"),(6,"Peugeot"),(1,"Porsche"),(8,"Renault"),(1,"Rover"),(1,"Saab"),(4,"Seat"),(1,"Skoda"),(2,"Smart"),(1,"Suzuki"),(1,"Tesla"),(3,"Toyota"),(3,"Volvo"),(6,"Volkswagen")]

-------------------------------

genNome :: Gen Nome
genNome = elements names

genMorada :: Gen Morada
genMorada = elements concelhos

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

genEmail :: Integer -> Gen Email
genEmail x = do a <- elements email
                return $ (show(x) ++ a)

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

genPref :: Gen Pref
genPref = frequency[(50,return MaisPerto),(50, return MaisBarato)]

genNota :: Gen Nota
genNota = choose (0 :: Int,100 :: Int)

-----------------------------------------------

genNovoProp :: Gen NovoProp
genNovoProp = do a <- elements names
                 b <- genNIF
                 c <- genEmail b
                 d <- elements concelhos
                 return (NovoProp a b c d)

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

genNovoCliente :: Gen NovoCliente
genNovoCliente = do a <- genNome
                    b <- genNIF
                    c <- genEmail b
                    d <- elements concelhos
                    e <- genX
                    f <- genY
                    return (NovoCliente a b c d e f)

genAluguer :: Gen Aluguer
genAluguer = do a <- genNIF
                b <- genX
                c <- genY
                d <- genTipo
                e <- genPref
                return (Aluguer a b c d e)

genClassificacao1 :: Gen Classificacao1
genClassificacao1 = do a <- genNIF
                       b <- genNota
                       return (Classificacao1 a b)

genClassificacao2 :: Gen Classificacao2
genClassificacao2 = do a <- genMatricula
                       b <- genNota
                       return (Classificacao2 a b)


{-
totcarros = sum (map (\(x,y) -> x) marcas)

marcas = [(82,"Abarth"),(368,"Alfa Romeo"),(19,"Aston Martin"),(2454,"Audi"),(30,"Bentley"),(5052,"BMW"),(166,"Chevrolet"),(1741,"Citroen"),(148,"Dacia"),(115,"DS"),(54,"Ferrari"),(1942,"Fiat"),(1653,"Ford"),(321,"Honda"),(397,"Hyundai"),(263,"Jaguar"),(175,"Jeep"),(335,"Kia"),(12,"Lamborghini"),(63,"Lancia"),(322,"Land Rover"),(146,"Lexus"),(38,"Maserati"),(384,"Mazda"),(4878,"Mercedes-Benz"),(1099,"Mini"),(392,"Mitsubishi"),(1358,"Nissan"),(2064,"Opel"),(3542,"Peugeot"),(645,"Porsche"),(4861,"Renault"),(16,"Rover"),(26,"Saab"),(1859,"Seat"),(470,"Skoda"),(675,"Smart"),(89,"Suzuki"),(48,"Tesla"),(1126,"Toyota"),(1326,"Volvo"),(2928,"Volkswagen")]

func = map (\(x,y) -> (round((fromRational x)/(fromRational totcarros)*100),y)) marcas

func2 = sum (map (\(x,y) -> x) func)

func3 = length(filter (\(x,y) -> x==0) func)

-}

{-
gera :: Gen a -> IO a
gera y = generate y                   

main = do
    let result = genNovoCarro --qsort [1, 3, 2]
    return (generate result)
-}