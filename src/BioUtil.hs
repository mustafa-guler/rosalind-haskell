module BioUtil where

----------------------------------------------------------------------------------
-- DNA Definitions
----------------------------------------------------------------------------------
data DNANuc = Adna | Cdna | Gdna | Tdna
    deriving (Eq)
type DNASeq = [DNANuc]

-- create DNA nucleotide from Char
dnaNuc      ::  Char -> DNANuc
dnaNuc 'A'  =   Adna
dnaNuc 'G'  =   Gdna
dnaNuc 'C'  =   Cdna
dnaNuc 'T'  =   Tdna
dnaNuc x    =   error $ "Invalid DNA nucleotide " ++ [x]

-- create DNA sequence from String
dnaSeq :: String -> DNASeq
dnaSeq x = map dnaNuc x

instance Show DNANuc where
    show a = case a of  Adna -> "A"
                        Cdna -> "C"
                        Gdna -> "G"
                        Tdna -> "T"

----------------------------------------------------------------------------------
-- RNA Definitions
----------------------------------------------------------------------------------
data RNANuc = Arna | Crna | Grna | Urna
type RNASeq = [RNANuc]

-- create RNA nucleotide from Char
rnaNuc      ::  Char -> RNANuc
rnaNuc 'A'  =   Arna
rnaNuc 'G'  =   Grna
rnaNuc 'C'  =   Crna
rnaNuc 'U'  =   Urna
rnaNuc x    =   error $ "Invalid RNA nucleotide " ++ [x]

-- create RNA sequence from String
rnaSeq :: String -> RNASeq
rnaSeq x = map rnaNuc x

instance Show RNANuc where
    show a = case a of  Arna -> "A"
                        Crna -> "C"
                        Grna -> "G"
                        Urna -> "U"
----------------------------------------------------------------------------------
-- complementable type class, allows finding of canonical complement of a nucletide
----------------------------------------------------------------------------------
class Complementable a where
    -- complement of one nucleotide
    complement          ::  a   ->  a

instance Complementable DNANuc where
    complement Adna = Tdna
    complement Tdna = Adna
    complement Cdna = Gdna
    complement Gdna = Cdna

instance Complementable RNANuc where
    complement Arna = Urna
    complement Urna = Arna
    complement Crna = Grna
    complement Grna = Crna

-- apply complement over a whole sequence
seqComplement :: Complementable a => [a] -> [a] 
seqComplement x = map complement x

-- standard reverse complement
revComplement :: Complementable a => [a] -> [a] 
revComplement x = reverse $ seqComplement x


----------------------------------------------------------------------------------
-- converting between RNA and DNA
----------------------------------------------------------------------------------
toRNA :: DNASeq -> RNASeq
toRNA [] = []
toRNA (x:xs) = (case x of   Adna -> Arna
                            Cdna -> Crna
                            Gdna -> Grna
                            Tdna -> Urna) : toRNA xs

toDNA :: RNASeq -> DNASeq
toDNA [] = []
toDNA (x:xs) = (case x of   Arna -> Adna
                            Crna -> Cdna
                            Grna -> Gdna
                            Urna -> Tdna) : toDNA xs
