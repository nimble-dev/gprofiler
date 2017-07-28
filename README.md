# gprofiler

A wrapper around Google's
[perftools profiler](https://github.com/gperftools/gperftools) and
[pprof](https://github.com/google/pprof) visualizer.

## Installation

### 1. Install `google-perftools` and `pprof`

Ubuntu Linux
```sh
sudo apt-get install libgoogle-perftools-dev

sudo apt-get install golang-go    # In case you don't have go installed.
export GOPATH=$HOME/go            # Add this to your .bash_profile.
export PATH=$PATH:$GOPATH/bin     # Add this to your .bash_profile.
go get github.com/google/pprof
```

OS X
```sh
brew install google-perftools

brew install binutils                                        # For gobjdump.
sudo ln -s /usr/local/bin/gobjdump /usr/local/bin/objdump    # Needed by pprof.

brew install go --cross-compile-common    # In case you don't have go installed.
export GOPATH=$HOME/go                    # Add this to your .bash_profile.
export PATH=$PATH:$GOPATH/bin             # Add this to your .bash_profile.
go get github.com/google/pprof
sudo mv /usr/local/bin/pprof /usr/local/bin/pprof.pl  # Ignore the older pprof.
```

### 2. Install the `gprofiler` R Package

```r
library(devtools)
devtools::install_github('nimble-dev/gprofiler')
```

## Usage

```r
library(gprofiler)
profile(my_expensive_function(100000))   # On completion, shows results in a web browser.
```
