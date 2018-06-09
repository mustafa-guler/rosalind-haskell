module Main where

import Data.List
import System.Environment
import BioUtil

-- count number of a nucleotide in a DNA string
count :: DNANuc -> DNASeq -> Int
count x = length . filter (x==) 

-- count all canonical nucleotides in DNA string
all_counts :: DNASeq -> [Int]
all_counts x =  [    
                    (count Adna x), 
                    (count Cdna x), 
                    (count Gdna x), 
                    (count Tdna x)
                ]

-- read input and print output
main = do
    args <- fmap head getArgs
    dna <- readFile args
    putStrLn $ intercalate " " $ map show $ all_counts $ dnaSeq $ init dna
