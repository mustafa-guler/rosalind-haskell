module Main where

import System.Environment
import BioUtil
import Data.List

main = do
    args <- fmap head getArgs;
    dna <- readFile args
    putStrLn $ intercalate "" $ map show $ toRNA $ dnaSeq $ init dna
