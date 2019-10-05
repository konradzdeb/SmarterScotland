#include <Rcpp.h>
#include <regex>

//' @rdname string_utilities
//' @section is_URL: Check which elements of character vector are formatted as
//'   URLs; the checks are simplistic for internal use and generally not
//'   useful outside the package context.
// [[Rcpp::export]]

Rcpp::LogicalVector is_URL(Rcpp::StringVector x) {
  // Create results vector
  Rcpp::LogicalVector res(x.size());
  // Iterate over vector elements and test
  for( int i=0; i < x.size(); i++ ){
    // Check if elements is missing
    if (Rcpp::StringVector::is_na(x[i])) {
      res[i] = NA_LOGICAL;
    } else {
      int res_comp_start = strncmp(x[i], "http", 4);
      if (res_comp_start == 0 && (x[i][4] == ':' || x[i][5] == ':' )) {
        res[i] = TRUE;
      } else {
        res[i] = FALSE;
      }
    }
  }
  return res;
}