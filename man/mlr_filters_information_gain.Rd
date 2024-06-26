% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FilterInformationGain.R
\name{mlr_filters_information_gain}
\alias{mlr_filters_information_gain}
\alias{FilterInformationGain}
\title{Information Gain Filter}
\description{
Information gain filter calling
\code{\link[FSelectorRcpp:information_gain]{FSelectorRcpp::information_gain()}} in package \CRANpkg{FSelectorRcpp}. Set
parameter \code{"type"} to \code{"gainratio"} to calculate the gain ratio, or set to
\code{"symuncert"} to calculate the symmetrical uncertainty (see
\code{\link[FSelectorRcpp:information_gain]{FSelectorRcpp::information_gain()}}). Default is \code{"infogain"}.

Argument \code{equal} defaults to \code{FALSE} for classification tasks, and to
\code{TRUE} for regression tasks.
}
\examples{
if (requireNamespace("FSelectorRcpp")) {
  ## InfoGain (default)
  task = mlr3::tsk("sonar")
  filter = flt("information_gain")
  filter$calculate(task)
  head(filter$scores, 3)
  as.data.table(filter)

  ## GainRatio

  filterGR = flt("information_gain")
  filterGR$param_set$values = list("type" = "gainratio")
  filterGR$calculate(task)
  head(as.data.table(filterGR), 3)

}

if (mlr3misc::require_namespaces(c("mlr3pipelines", "FSelectorRcpp", "rpart"), quietly = TRUE)) {
  library("mlr3pipelines")
  task = mlr3::tsk("spam")

  # Note: `filter.frac` is selected randomly and should be tuned.

  graph = po("filter", filter = flt("information_gain"), filter.frac = 0.5) \%>>\%
    po("learner", mlr3::lrn("classif.rpart"))

  graph$train(task)

}
}
\seealso{
\itemize{
\item \link[mlr3pipelines:mlr_pipeops_filter]{PipeOpFilter} for filter-based feature selection.
\item \link[mlr3misc:Dictionary]{Dictionary} of \link[=Filter]{Filters}: \link{mlr_filters}
}

Other Filter: 
\code{\link{Filter}},
\code{\link{mlr_filters}},
\code{\link{mlr_filters_anova}},
\code{\link{mlr_filters_auc}},
\code{\link{mlr_filters_boruta}},
\code{\link{mlr_filters_carscore}},
\code{\link{mlr_filters_carsurvscore}},
\code{\link{mlr_filters_cmim}},
\code{\link{mlr_filters_correlation}},
\code{\link{mlr_filters_disr}},
\code{\link{mlr_filters_find_correlation}},
\code{\link{mlr_filters_importance}},
\code{\link{mlr_filters_jmi}},
\code{\link{mlr_filters_jmim}},
\code{\link{mlr_filters_kruskal_test}},
\code{\link{mlr_filters_mim}},
\code{\link{mlr_filters_mrmr}},
\code{\link{mlr_filters_njmim}},
\code{\link{mlr_filters_performance}},
\code{\link{mlr_filters_permutation}},
\code{\link{mlr_filters_relief}},
\code{\link{mlr_filters_selected_features}},
\code{\link{mlr_filters_univariate_cox}},
\code{\link{mlr_filters_variance}}
}
\concept{Filter}
\section{Super class}{
\code{\link[mlr3filters:Filter]{mlr3filters::Filter}} -> \code{FilterInformationGain}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-FilterInformationGain-new}{\code{FilterInformationGain$new()}}
\item \href{#method-FilterInformationGain-clone}{\code{FilterInformationGain$clone()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="calculate"><a href='../../mlr3filters/html/Filter.html#method-Filter-calculate'><code>mlr3filters::Filter$calculate()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="format"><a href='../../mlr3filters/html/Filter.html#method-Filter-format'><code>mlr3filters::Filter$format()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="help"><a href='../../mlr3filters/html/Filter.html#method-Filter-help'><code>mlr3filters::Filter$help()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="print"><a href='../../mlr3filters/html/Filter.html#method-Filter-print'><code>mlr3filters::Filter$print()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-FilterInformationGain-new"></a>}}
\if{latex}{\out{\hypertarget{method-FilterInformationGain-new}{}}}
\subsection{Method \code{new()}}{
Create a FilterInformationGain object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FilterInformationGain$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-FilterInformationGain-clone"></a>}}
\if{latex}{\out{\hypertarget{method-FilterInformationGain-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FilterInformationGain$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
