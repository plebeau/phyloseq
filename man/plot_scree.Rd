\name{plot_scree}
\alias{plot_scree}
\title{General ordination eigenvalue plotter using ggplot2.}
\usage{
  plot_scree(ordination, title = NULL)
}
\arguments{
  \item{ordination}{(Required). An ordination object. Many
  different classes of ordination are defined by \code{R}
  packages. Ordination classes currently supported/created
  by the \code{\link{ordinate}} function are supported
  here. There is no default, as the expectation is that the
  ordination will be performed and saved prior to calling
  this plot function.}

  \item{title}{(Optional). Default \code{NULL}. Character
  string. The main title for the graphic.}
}
\value{
  A \code{\link{ggplot}} plot object, graphically
  summarizing the ordination result for the specified axes.
}
\description{
  Convenience wrapper for plotting ordination eigenvalues
  (if available) using a \code{ggplot2}-graphic.
}
\examples{
# First load and trim a dataset
data("GlobalPatterns")
GP = prune_taxa(names(sort(taxa_sums(GlobalPatterns), TRUE)[1:50]), GlobalPatterns)
# Test plots (preforms ordination in-line, then makes scree plot)
plot_scree(ordinate(GP, "DPCoA", "bray"))
plot_scree(ordinate(GP, "PCoA", "bray"))
# Empty return with message
plot_scree(ordinate(GP, "NMDS", "bray"))
# Constrained ordinations
plot_scree(ordinate(GP, "CCA", formula=~SampleType))
plot_scree(ordinate(GP, "RDA", formula=~SampleType))
plot_scree(ordinate(GP, "CAP", formula=~SampleType))
# Deprecated example of constrained ordination (emits a warning)
#plot_scree(ordinate(GP ~ SampleType, "RDA"))
plot_scree(ordinate(GP, "DCA"))
plot_ordination(GP, ordinate(GP, "DCA"), type="scree")
}
\seealso{
  \code{\link{plot_ordination}}

  \code{\link{ordinate}}

  \code{\link{distance}}

  \href{http://joey711.github.io/phyloseq/plot_ordination-examples}{phyloseq
  online tutorials}
}

