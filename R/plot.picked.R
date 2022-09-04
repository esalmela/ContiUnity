
#' Plot, from a matrix produced by the pick function, the empirical distributions and the real observation
#'
#' This function plots a histogram of empirical values produced by the 'pick' function and depicts the observed frequency from the sampled (ancient) population of interest by a vertical bar.
#'
#' @param picked The input matrix, produced by the 'pick' function.
#' @param tot_n The total number of observations in the sampled population.
#' @param obs_n The vector of observations in the sampled population.
#' @param text=1:nrow(picked) The vector of haplogroup names. Defaults to a running number.
#' @param probl A logical vector indicating which observations differ significantly from expected; their haplogroup names will be plotted in red in the histograms.
#' @param plot Should the histograms be plotted? Defaults to TRUE. If FALSE, returns the histogram values that could be plotted by hist.
#' @param histcol Plotting colour of the histogram bars. Defaults to gray.
#' @param obscol Plotting colour of the vertical bars for the true observed frequencies. Defaults to red.
#' @param lineheight A plotting parameter for the histograms. Defaults to 0.8.
#' @param textoffsety A plotting parameter for the histograms. Defaults to 0.3.
#' @param main A main title for the plot. Defaults to no title.
#'
#' @returns A set of histogram plots (if plot==T) or a set of values that could be used to plot those histograms (if plot==F).
#' @export plot.picked()
plot.picked <- function(picked, tot_n, obs_n, text=1:nrow(picked), probl=NULL, 
				plot=T, histcol="gray", obscol="red", lineheight=0.8, textoffsety=0.3,  main="") {

	hists <- matrix(NA, nrow(picked), tot_n+1)

	for (i in 1:nrow(picked)) {
		h_i <- hist(picked[i,], plot=F, breaks=(0:(tot_n+1)-0.5))
		hists[i,] <- h_i$counts
	}

	if (plot) {
		yscale <- 0.7/ncol(picked)
		# scale the histogram heights to make y axis handling easier
		# the 0.7 is an arbitrary factor that affects the plot layout (the space between histograms)

		plot(x=0, y=0, type="n", xlim=c(-3.5,(tot_n+0.5)), ylim=c(-nrow(picked),0),
			xaxp=c(0,tot_n,tot_n), yaxt="n", xlab="", ylab="", main=main)

		for (j in 1:nrow(picked)) {
			rect(xleft=(0:tot_n)-0.5, xright=(0:tot_n)+0.5, ybottom=-j, ytop=hists[j,]*yscale-j, col=histcol, border=NA)
			segments(x0=obs_n[j], x1=obs_n[j], y0=-j, y1=-j+lineheight, col=obscol, lwd=2, lend=2)
		}
	textcol <- rep("black", times=length(text))
	textcol <- replace(textcol, probl, "red")
	text(x=-0.5, y=((1:nrow(picked))-textoffsety)*-1, pos=2, cex=0.8, col=textcol, labels=text)
	}

	if (!plot) {return(hists)}

}

