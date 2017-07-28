# gprofiler

A wrapper around the
[Google perftools profiler](https://github.com/gperftools/gperftools) and
[pprof](https://github.com/google/pprof) visualizer.

## Installation

### Step 1. Install Prerequisites

Ubuntu Linux
```sh
sudo apt-get install libgoogle-perftools-dev
sudo apt-get install golang-go                # In case you don't have go installed.
export GOPATH=$HOME/go                        # Probably add this to your .bash_profile.
go get github.com/google/pprof
```

OS X
```sh
TODO(fritzo) Figure out how to set up on OS X.
```

Windows is not supported by this profiling tool.

### Step 2. Install the R Package

```r
library(devtools)
devtools::install_github('nimble-dev/gprofiler')
```

## Usage

```r
library(gprofiler)

profile(my_expensive_function(100000))   # On commpletion, shows results in a web browser.
```
