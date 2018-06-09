module BioUtil where

-- nucleotide type
data Nuc = A | C | G | T
    deriving (Show, Eq)

-- sequence of nucleotides
type Seq = [Nuc]

-- create nucleotide from character
nuc :: Char -> Nuc
nuc 'A' = A
nuc 'G' = G
nuc 'C' = C
nuc 'T' = T
nuc x = error $ "Invalid nucleotide " ++ [x]

dnaSeq :: [Char] -> Seq
dnaSeq x = map nuc x

complement :: Nuc -> Nuc
complement A = T
complement T = A
complement C = G
complement G = C

complementSeq :: Seq -> Seq
complementSeq x = map complement x

reverseComplement :: Seq -> Seq
reverseComplement x = reverse $ complementSeq x
