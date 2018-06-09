# Rosalind Haskell

Solutions to various [Rosalind](http://rosalind.info/) problems
using [Haskell](https://www.haskell.org/). The more generalizable portions 
are moved into the `BioUtil.hs` module.

To add problem solutions run:

```bash
$ ./add-problem <rosalind url>
```

This will create a `Main.hs` file in a subdirectory in the `src` directory.
Example:

```bash
$ ./add-problem http://rosalind.info/problems/dna/
$ ls src
BioUtil.hs
counting-dna-nucleotides
$ ls src/counting-dna-nucleotides
Main.hs
```

To build a solution:
```bash
$ build-problem <url>
```

To run a solution:
```bash
$ run-problem <url> <rosalind input txt file>
```

The output will be printed to stdout.

## [Counting DNA Nucleotides](http://rosalind.info/problems/dna/)



### Problem
A string is simply an ordered collection of symbols selected from
some alphabet and formed into a word; the length of a string is
the number of symbols that it contains.
An example of a length 21 DNA string (whose alphabet contains the symbols 'A', 'C', 'G', and 'T') is "ATGCTTCAGAAAGGTCTTACG."
Given: A DNA string $s$ of length at most 1000 nt.
Return: Four integers (separated by spaces) counting the respective number of times that the
symbols 'A', 'C', 'G', and 'T' occur in $s$.

### Sample Dataset
AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC


### Sample Output
20 12 17 21


## [Transcribing DNA into RNA](http://rosalind.info/problems/rna/)



### Problem
An RNA string is a string formed from the alphabet containing 'A', 'C', 'G', and 'U'.
Given a DNA string $t$ corresponding to a coding strand, its transcribed RNA string $u$
is formed by replacing all occurrences of 'T' in $t$ with 'U' in $u$.
Given: A DNA string $t$ having length at most 1000 nt.
Return: The transcribed RNA string of $t$.

### Sample Dataset
GATGGAACTTGACTACGTAAATT


### Sample Output
GAUGGAACUUGACUACGUAAAUU



