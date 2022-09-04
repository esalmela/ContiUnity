
#' Test whether the haplogroup distributions in small samples are compatible with that in a larger reference sample
#'
#' This function resamples a reference population 'perms' times, and compares the resulting empirical distribution to the observed number of haplogroups in one or more (smaller) samples from other (potentially ancient) populations. The result for each tested population is plotted into one PDF figure, with histograms showing the empirical distributions based on the resampling, vertical bars depicting the observed haplogroup frequencies in the tested population, and red colour of haplogroup names indicating those whose frequency differs nominally significantly from the expectation.
#'
#' @param freq Input matrix of haplogroup observations. 1st row is a header with population names (these will be used as PDF plot names). Each remaining row corresponds to one haplogroup. 1st column has haplogroup names (to be used as histogram titles on the plots). 2nd column has haplogroup observations (absolute frequencies) from a reference population, and from 3rd column onwards each column has the corresponding observations for other (smaller, potentially ancient) populations.
#' @param perms How many times should the resampling be repeated (with replacement). Defaults to 10000.
#' @param signf The nominal significance to use for marking the haplogroups that differ from expected. Defaults to 0.05. This is treated as two-tailed, so threshold is half of the given probability value at either end of the distribution.
#' @param plotTF Should the resulting plots be plotted? Defaults to TRUE.
#'
#' @returns A set of PDF plots in the active working directory (if plotTF==T, the default).
#' @export
test.continuity <- function (freq, perms=10000, signf=0.05, plotTF=T) {

	# 1. Calculate nil to be later used as zero-freq,
	#    i.e., in a reference sample of this size, how large could the real, underlying frequency of a haplogroup be
	#    so that there is still a 5% chance of not having observed the haplogroup in the reference sample.

	nil <- 1 - exp(1) ^ (log(0.05) / (sum(freq[,2])))


	# 2. Pick from the reference column (perms times) the number of observations seen in each sample column,
	#    compare to the observed distribution & record which haplogroups differ (two-tailed test, no multiple testing correction),
	#    and plot empirical distribution and observations for each haplogroup and sample column (unless plotTF==FALSE).

	refcol <- freq[,2]/sum(freq[,2])
	# relative frequencies in the reference column


	for (i in 3:ncol(freq)) {
	# for each sample column

		n.col <- sum(freq[,i])
	
		picked <- pick(refcol, n.col, perms, nil)
		obs <- freq[,i]

		probl <- which(count.picked(obs, picked) < 0.5 * signf * perms)
		# these haplogroups differ significantly and should be plotted in red

		pdf(paste("Haplogroup_resampling_",colnames(freq)[i],".pdf", sep=""))
			plot.picked(picked, n.col, freq[,i], main=colnames(freq)[i], text=freq[,1], probl=probl, plot=plotTF)
		dev.off()
	}

}
