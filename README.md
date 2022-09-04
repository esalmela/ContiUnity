# ContiUnity

An R package to test for deviations from population continuity in uniparental haplogroup data by resampling a reference population.

## Description

Population discontinuity may be difficult to detect from genetic data, but the minimum requirement would be to observe differences between population samples that could not be explained by sampling variation alone. ContiUnity tests for this: it takes uniparental haplogroup data from a reference population (typically the one with largest sample size available) and resamples that repeatedly to the size of the other (smaller) population sample(s). This produces an empirical distribution of expected haplogroup frequencies, which the observed haplogroup frequencies in the other (smaller) population(s) are then compared to. The smaller population data could for example originate from a collection of ancient individuals and the reference data from modern individuals of the same area; this is how the package has been used in three publications (see below). Furthermore, the package produces histogram plots of the expected distributions, with the observed data depicted as coloured bars, and indicates which haplogroup frequencies differ nominally significantly from the expectation.

## Input data

The program takes as input data a table of absolute haplogroup frequencies. The table should have a header row with names of populations (these will be used as PDF plot names), and names of haplogroups should be in the first column (these will be used as labels on the PDF plot(s)). The second column should contain haplogroup counts from the reference population that all the other populations, i.e., the remaining columns will be compared to. (NB. The table should contain no summary row; the commands will calculate the total numbers of observations per population internally.)

See example.txt for an example of an input file with 14 haplogroups (haplotypes), one reference population (called REF_TG5) and four populations to test (TG1-TG4).


## How to run


data <- read.table("example.txt", as.is=T, header=T, sep="\t")

test.continuity(data2, )




## Other stuff

Jukka Palon idea
no multiple testing correction
zerofreq on purkkaus


## Getting Started

### Dependencies

* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* ex. Windows 10

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## How to cite


## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)