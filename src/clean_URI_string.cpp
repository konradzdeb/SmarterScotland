#include <string>
#include <regex>
#include <Rcpp.h>

//' @rdname string_utilities
//' @param x A character vector
//' @section clean_URI_string: C++ fast cleaner for query text file removing
//'   comments and line breaks.

// [[Rcpp::export]]
Rcpp::StringVector clean_URI_string(std::string x) {
  // Define URL start
  std::regex re_uri_first_part ("^(http[s]{,1}).*(/|#)");
  std::string result = std::regex_replace(x, re_uri_first_part, std::string(" "));
  return result;
}
