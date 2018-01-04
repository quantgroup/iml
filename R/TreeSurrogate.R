
tree.surrogate = function(f, X, sample.size=100){
  TreeSurrogate$new(f=f, X=X, sample.size=sample.size)
}

## Craven, M. W., & Shavlik, J. W. (1996).
## Extracting tree-structured representations of trained neural networks.
## Advances in Neural Information Processing Systems, 8, 24–30.
## Retrieved from citeseer.ist.psu.edu/craven96extracting.html
# TODO: Implement/search plot funciton with ggplot or overwrite Experiment$plot()
TreeSurrogate = R6Class('TreeSurrogate',
  inherit = Experiment,
  public = list(
    intervene = function(){self$X.sample},
    aggregate = function(){
      dat = cbind(y.hat = private$Q.results, self$X.design)
      partykit::ctree(y.hat ~ ., data = dat)
    },
    plot = function(){
      self$run()
      plot(private$results)
    },
    initialize = function(f, X, sample.size){
      super$initialize(f, X)
      self$sample.size = sample.size
    }
  ),
  private = list(

  )
)