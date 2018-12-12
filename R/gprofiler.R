
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
profile <- function(expr, prof_filename = NULL,
                    fmt = c("pdf", "svg", "dot"),
                    out_filename = tempfile("gp", fileext = paste0(".", fmt))) {
    fmt <- match.arg(fmt)
    if (is.null(prof_filename)) {
        prof_filename <- file.path(tempdir(), 'gprofiler.out')
    }
    ProfilerStart(prof_filename)
    result <- eval(expr)
    ProfilerStop()
    args <- c(paste0("--", fmt),
              file.path(R.home('bin'), 'Rscript'),
              prof_filename)
    # Visualize profiling data, if possible.
    if (nchar(Sys.which('pprof'))) {
        system2('pprof', args, stdout = out_filename)
    } else if (nchar(Sys.which('google-pprof'))) {
        system2('google-pprof', args, stdout = out_filename)
    } else {
        cat('See profile data in ', prof_filename, '\n')
        return(invisible(result))
    }
    message("Results saved in: ", out_filename)
    invisible(result)
}
