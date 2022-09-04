# ContiUnity

An R package to test for deviations from population continuity in uniparental haplogroup data by resampling a reference population.

## Description

Population discontinuity may be difficult to detect from genetic data, but the minimum requirement would be to observe differences between population samples that could not be explained by sampling variation alone. ContiUnity tests for this: it takes uniparental haplogroup data from a reference population (typically the one with largest sample size available) and resamples that repeatedly to the size of the other (smaller) population sample(s). This produces an empirical distribution of expected haplogroup frequencies, which the observed haplogroup frequencies in the other (smaller) population(s) are then compared to. The smaller population data could for example originate from a collection of ancient individuals and the reference data from modern individuals of the same area; this is how the package has been used in three publications (see below). Furthermore, the package produces histogram plots of the expected distributions, with the observed data depicted as coloured bars, and indicates which haplogroup frequencies differ nominally significantly from the expectation.

## Input data

The program takes as input data a table of absolute haplogroup frequencies. The table should have a header row with names of populations (these will be used as PDF plot names), and names of haplogroups should be in the first column (these will be used as labels on the PDF plot(s)). The second column should contain haplogroup counts from the reference population that all the other populations, i.e., the remaining columns will be compared to. (NB. The table should contain no summary row; the commands will calculate the total numbers of observations per population internally.)

See example.txt for an example of an input file with 14 haplogroups [haplotypes], one reference population (called REF_TG5) and four populations to test (TG1-TG4). The example dataset originates from Heino et al. 2022.

## How to run

Download the R package (or copy-paste the code of the four functions into your R). You can use the input file example.txt to test how to run the program:
```
data <- read.table("example.txt", as.is=T, header=T, sep="\t")
# read in the example data

test.continuity(data)
# or test.continuity(data, perms=10000, signf=0.05) if you want to change the main parameters easily later
```

Running these two commands should create and save into the active working directory four PDF plots, reproducing the result from Figure 4 in Heino et al. 2022.

### Parameters

The function test.continuity has three parameters:

perms	This is the number of resampling permutations to run. Default is 10,000.
signf		This is the threshold for nominal significance in the comparison. Default is 0.05.
plotTF	Logical: Should the PDF histograms be plotted or not. Default is TRUE (plot). 

## Disclaimers and details

This package is only meant as a first-pass, quick-and-dirty test of population (dis)continuity: if differences in populations' haplogroup frequency distributions do not exceed what would be expected by chance from sampling-related deviations, there obviously is little to explain in terms of discontinuity.

The approach makes several simplifying assumptions. First of all, it tests for each haplogroup in each population sample separately, but it makes no correction for this multiple testing. In other words, the significance threshold given by the parameter 'signf' is nominal. It could naturally be adjusted to take into account the number of haplogroup-wise tests. Alternatively, the observed number of significant tests could be compared to the expected number of significant tests given the nominal p-value.

If a haplogroup is relatively rare, it could be missing from the reference population sample by mere chance. To account for such cases, the 'test.continuity' function does not use zero as its frequency for the resampling. Instead, it calculates the frequency at which there would be a 5% chance of missing the haplogroup in a sample of the same size as the reference sample, and uses this as the resampling frequency. Thus, it tries to compensate for the sampling error present in the reference population haplogroup frequencies. Notably, however, it only takes this into account for the zero-frequency haplogroups; for all other haplogroups, sampling error in the reference population haplogroup frequencies is ignored.

The significance threshold given by the 'signf' parameter is that of a two-tailed test. Therefore, for example the value of 0.05 (the default) means that the 'test.continuity' function looks for those cases where the observed haplogroup count is among the highest or lowest 2.5% of the empirical distribution.

## How to cite

R package ContiUnity v.1.x (github.com/esalmela/ContiUnity; Översti et al. 2019)

The approach has been used in three publications: Översti et al. 2019, Guevara et al. 2020, and Heino et al. 2022. The two former ones do not name the program explicitly, but I wish you could still primarily cite Översti et al. 2019 where the approach was first introduced - and where citations will weigh the most on my list of publications. :-) 

## Version History

* 1.0
    * Initial Release

## License

This project is licensed under the GPL v3 License.

## Acknowledgments

The original idea for this sampling approach was suggested by Dr. Jukka Palo in ca. 2017.

## References

Översti S, Majander K, Salmela E, Salo K, Arppe L, Belskiy S, Etu-Sihvola H, Laakso V, Mikkola E, Pfrengle S, Putkonen M, Taavitsainen JP, Vuoristo K, Wessman A, Sajantila A, Oinonen M, Haak W, Schuenemann VJ, Krause J, Palo JU, Onkamo P. (2019) Human mitochondrial DNA lineages in Iron-Age Fennoscandia suggest incipient admixture and eastern introduction of farming-related maternal ancestry. Sci Rep. 9(1):16883. doi: https://doi.org/10.1038/s41598-019-51045-8

Guevara EK, Palo JU, Översti S, King JL, Seidel M, Stoljarova M, et al. (2020) Genetic assessment reveals no population substructure and divergent regional and sex-specific histories in the Chachapoyas from northeast Peru. PLoS ONE 15(12): e0244497. https://doi.org/10.1371/journal.pone.0244497

Matti T. Heino, Tommi Nyman, Jukka U. Palo, Jenni Harmoinen, Mia Valtonen, Małgorzata Pilot, Sanni Översti, Elina Salmela, Mervi Kunnasranta, A. Rus Hoelzel, Minna Ruokonen, Jouni Aspi. (2022) Museum specimens of a landlocked pinniped reveal recent loss of genetic diversity and unexpected population connections. bioRxiv preprint 2022.05.19.492422; doi: https://doi.org/10.1101/2022.05.19.492422

