
#' Resample a reference population (to a smaller size) and count the number of haplogroup observations
#'
#' Pick n2pick items with each element of freqs as the probability of success in turn. Repeat the picking rounds times. For freqs[i]==0, substitute the probability of success by zerofreq.
#' In practice, this answers the question of whether sampling error alone could explain the observed frequency differences; freqs come from the reference population and n2pick is the sample size of the (ancient) population of interest.
#' The parameter zerofreq acknowledges that the reference freqs may be inaccurate; however, all nonzero freqs are assumed correct - i.e., for small reference populations, use a more elegant procedure.
#'
#' @param freqs The vector of relative frequencies observed in the reference population.
#' @param n2pick The number of observations to pick from the reference (with replacement).
#' @param rounds The number of times the picking is to be repeated.
#' @param zerofreq The frequency to be used in the picking for haplogroups (which are observed in the sample populations and) whose observed frequency in the reference population is zero. Defaults to 0.
#'
#' @returns A matrix of the numbers of times that each haplogroup was observed in each resampling. 
#' @export

pick <- function(freqs, n2pick, rounds, zerofreq=0) {

		res <- matrix(NA, length(freqs), rounds)
		
		for (i in 1:length(freqs)) {

			if (freqs[i]==0) {freqs[i] <- zerofreq}

			for (j in 1:rounds) {

				draw_ij <- sample(c(0,1), n2pick, replace=T, prob=c(1-freqs[i],freqs[i]))
				res[i,j] <- sum(draw_ij)
			}
		}
		return(res)
	}

