
#' Compare haplogroup counts in observed population and resampled result
#'
#' Count, from a matrix produced by the 'pick' function, the number of permutations that produced a result equal to or more extreme than the one in the observed population.
#' @param observed A vector of observed absolute frequencies to be compared to the ones produced by repeated resampling by the 'pick' function. This is typically a single column from the input file, i.e., the observed numbers of a set of haplogroups in a (small) sample from a (ancient) population.
#' @param picked A matrix of resampled observations produced by the 'pick' function. 
#'
#' @returns A numeric vector of the number of permutations equal to or more extreme than the observed data.
 #' @export

count.picked <- function(observed, picked) {
	return(apply(cbind(rowSums(observed>=picked), rowSums(observed<=picked)),1, min))
	}

