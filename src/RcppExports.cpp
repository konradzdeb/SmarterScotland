// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// read_query_file
std::string read_query_file(std::string path);
RcppExport SEXP _SmarterScotland_read_query_file(SEXP pathSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::string >::type path(pathSEXP);
    rcpp_result_gen = Rcpp::wrap(read_query_file(path));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_SmarterScotland_read_query_file", (DL_FUNC) &_SmarterScotland_read_query_file, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_SmarterScotland(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
