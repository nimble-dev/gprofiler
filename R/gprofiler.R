
ProfilerStart <- function(filename) {
    .Call('C_ProfilerStart', filename)
}

ProfilerStop <- function() {
    .Call('ProfilerStop')
}

#' Profile the C++ code executed in an expression.
#'
#' This profiles an expression and visualizes the profile in a web browser.
#'
#' This requires the libprofile and pprof tools available via:
#' \code{sudo apt-get install libgoogle-perftools-dev}
#' \code{go get github.com/google/pprof}
#'
#' @export
#' @param expr The expression to be profiled.
#' @param filename An optional filename to write profiling information to.
profile <- function(expr, filename = NULL) {
    if (is.null(filename)) {
        filename <- file.path(tempdir(), 'gprofiler.out')
    }
    ProfilerStart(filename)
    result <- eval(expr)
    ProfilerStop()
    system2('pprof', c('-web', file.path(R.home('bin'), 'R'), filename))
    return(result)
}
