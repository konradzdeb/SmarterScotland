#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>
#include <boost/algorithm/string.hpp>
#include <Rcpp.h>
using namespace Rcpp;

// The function provides conveniance solution facilitating file reading
// The original code was based on the syntax available through:
// https://figshare.com/articles/Fast_text_file_reading_into_R_using_Rcpp_functions/3407032
// useDynLib is provided to ensure that function is available within
// package environment

//' @keyword internal
//' @describeIn utility_functions Provides a convenience function quickly reading
//'   \code{SPARQL} files via \code{Rcpp}.
//' @useDynLib SmarterScotland
// [[Rcpp::export]]
std::string read_query_file(std::string path){
  std::ifstream in(path.c_str());
  std::stringstream ss;
  ss<<in.rdbuf();
  // Declare string variable to loop trhough and delete carriage returns
  std::string qryTxt;
  qryTxt = ss.str();

  // Remove line breaks and return clean string
  boost::replace_all(qryTxt, "\r\n", " ");
  return qryTxt;
}

