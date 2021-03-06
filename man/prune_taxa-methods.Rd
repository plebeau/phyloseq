\name{prune_taxa}
\alias{prune_taxa}
\alias{prune_taxa,character,otu_table-method}
\alias{prune_taxa,character,phylo-method}
\alias{prune_taxa,character,phyloseq-method}
\alias{prune_taxa,character,sample_data-method}
\alias{prune_taxa,character,taxonomyTable-method}
\alias{prune_taxa,character,XStringSet-method}
\alias{prune_taxa,logical,ANY-method}
\alias{prune_taxa,NULL,ANY-method}
\title{Prune unwanted OTUs / taxa from a phylogenetic object.}
\usage{
  prune_taxa(taxa, x)
}
\arguments{
  \item{taxa}{(Required). A character vector of the taxa in
  object x that you want to keep -- OR alternatively -- a
  logical vector where the kept taxa are TRUE, and length
  is equal to the number of taxa in object x. If
  \code{taxa} is a named logical, the taxa retained are
  based on those names. Make sure they are compatible with
  the \code{taxa_names} of the object you are modifying
  (\code{x}).}

  \item{x}{(Required). A phylogenetic object, including
  \code{phylo} trees, as well as all phyloseq classes that
  represent taxa. If the function \code{\link{taxa_names}}
  returns a non-\code{NULL} value, then your object can be
  pruned by this function.}
}
\value{
  The class of the object returned by \code{prune_taxa}
  matches the class of the argument, \code{x}.
}
\description{
  An S4 Generic method for removing (pruning) unwanted
  OTUs/taxa from phylogenetic objects, including
  phylo-class trees, as well as native phyloseq package
  objects. This is particularly useful for pruning a
  phyloseq object that has more than one component that
  describes OTUs. Credit: the \code{phylo}-class version is
  adapted from
  \href{http://cran.at.r-project.org/web/packages/picante/index.html}{prune.sample}.
}
\examples{
data("esophagus")
esophagus
plot(sort(taxa_sums(esophagus), TRUE), type="h", ylim=c(0, 50))
x1 = prune_taxa(taxa_sums(esophagus) > 10, esophagus)
x2 = prune_taxa(names(sort(taxa_sums(esophagus), TRUE))[1:9], esophagus)
identical(x1, x2)
}
\seealso{
  \code{\link{prune_samples}}

  \href{http://cran.at.r-project.org/web/packages/picante/index.html}{prune.sample}
}

