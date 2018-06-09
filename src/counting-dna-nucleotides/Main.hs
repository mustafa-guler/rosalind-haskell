module Main where

import Data.List
import System.Environment
import BioUtil

-- count number of a nucleotide in a DNA string
count :: Nuc -> Seq -> Int
count x = length . filter (x==) 

-- count all canonical nucleotides in DNA string
all_counts :: Seq -> [Int]
all_counts x =  [    
                    (count A x), 
                    (count C x), 
                    (count G x), 
                    (count T x)
                ]

-- read input and print output
main = do
    args <- fmap head getArgs
    dna <- readFile a
    putStrLn $ intercalate " " $ map show $ all_counts $ dnaSeq $ init dna
