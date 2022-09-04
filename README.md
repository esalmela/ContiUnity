# ContiUnity

An R package to test for deviations from population continuity in uniparental haplogroup data by resampling a reference population.

## Description

Population discontinuity may be difficult to detect from genetic data, but the minimum requirement would be to observe differences between population samples that could not be explained by sampling variation alone. ContiUnity tests for this: it takes uniparental haplogroup data from a reference population (typically the one with largest sample size available) and resamples that repeatedly to the size of the other (smaller) population sample(s). This produces an empirical distribution of expected haplogroup frequencies, which the observed haplogroup frequencies in the other (smaller) population(s) are then compared to. The smaller population data could for example originate from a collection of ancient individuals and the reference data from modern individuals of the same area; this is how the package has been used in three publications (see below). Furthermore, the package produces histogram plots of the expected distributions, with the observed data depicted as coloured bars, and indicates which haplogroup frequencies differ nominally significantly from the expectation.

## Input data

The program takes as input data a table of absolute haplogroup frequencies. The table should have a header row with names of populations (these will be used as PDF plot names), and names of haplogroups should be in the first column (these will be used as labels on the PDF plot(s)). The second column should contain haplogroup counts from the reference population that all the other populations, i.e., the remaining columns will be compared to. (NB. The table should contain no summary row; the commands will calculate the total numbers of observations per population internally.)

See example.txt for an example of an input file with 14 haplogroups [haplotypes], one reference population (called REF_TG5) and four populations to test (TG1-TG4). The dataset originates from Heino et al. 2022.

## How to run

Download the R package (or copy-paste the code of the four functions into your R). You can use the input file example.txt to test how to run the program:
```
data <- read.table("example.txt", as.is=T, header=T, sep="\t")
# read in the example data

test.continuity(data)
# or test.continuity(data, perms=10000, signf=0.05) if you want to change the main parameters easily later
```

Running these two commands should create and save into the active working directory four PDF plots, reproducing the result from Figure 4 in Heino et al. 2022.


## Other stuff

no multiple testing correction
zerofreq on purkkaus



```
code blocks for commands
```

## How to cite

R package ContiUnity v.1.x (github.com/esalmela/ContiUnity; Översti et al. 2019)



## Version History

* 1.0
    * Initial Release

## License

This project is licensed under the GPL v3 License.

## Acknowledgments

The original idea for this sampling approach was suggested by Dr. Jukka Palo in ca. 2017.

## References

Matti T. Heino, Tommi Nyman, Jukka U. Palo, Jenni Harmoinen, Mia Valtonen, Małgorzata Pilot, Sanni Översti, Elina Salmela, Mervi Kunnasranta, A. Rus Hoelzel, Minna Ruokonen, Jouni Aspi. Museum specimens of a landlocked pinniped reveal recent loss of genetic diversity and unexpected population connections. bioRxiv 2022.05.19.492422; doi: https://doi.org/10.1101/2022.05.19.492422 

Översti S, Majander K, Salmela E, Salo K, Arppe L, Belskiy S, Etu-Sihvola H, Laakso V, Mikkola E, Pfrengle S, Putkonen M, Taavitsainen JP, Vuoristo K, Wessman A, Sajantila A, Oinonen M, Haak W, Schuenemann VJ, Krause J, Palo JU, Onkamo P. Human mitochondrial DNA lineages in Iron-Age Fennoscandia suggest incipient admixture and eastern introduction of farming-related maternal ancestry. Sci Rep. 2019; 9(1):16883. doi: 10.1038/s41598-019-51045-8.