#include <Rinternals.h>

// This is defined externally in gperftools/google/profiler.h:
extern "C" void ProfilerStart(const char* filename);

extern "C" SEXP C_ProfilerStart(SEXP filename) {
    ProfilerStart(CHAR(STRING_ELT(filename, 0)));
    return R_NilValue;
}
