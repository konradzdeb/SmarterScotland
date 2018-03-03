#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>
#include <boost/regex.hpp>
#include <boost/algorithm/string/replace.hpp>

// [[Rcpp::depends(BH)]]

#include <Rcpp.h>
using namespace Rcpp;

// The function provides conveniance solution facilitating file reading
// The original code was based on the syntax available through:
// https://figshare.com/articles/Fast_text_file_reading_into_R_using_Rcpp_functions/3407032
// useDynLib is provided to ensure that function is available within
// package environment

// To quick test query:
// Sys.setenv("PKG_LIBS"="-lboost_regex"); Rcpp::sourceCpp('src/read_query_file.cpp', rebuild = TRUE, verbose = TRUE); read_query_file("/Users/huski/Desktop/tst.sql")

//' @keyword internal
//' @describeIn utility_functions Provides a convenience function quickly reading
//'   \code{SPARQL} files via \code{Rcpp}.
//' @useDynLib SmarterScotland

// Regular expressions to pass to replace_all to remove all comments and line breaks
// Define regex to match lines with comments
const boost::regex re_comment("(^|\n)(\\s*--[^\n|$]*)(\n|$)", boost::regex::extended);
const boost::regex re_lineend("\n|\r", boost::regex::extended);

// [[Rcpp::export]]
std::string read_query_file(std::string path){

  // Read file to string stream
  std::ifstream in(path.c_str());
  std::stringstream ss;
  ss<<in.rdbuf();


  // Declare string variable to remove text
  std::string qryTxt;
  qryTxt = ss.str();

  // Replace via regex replace
  std::string result = boost::regex_replace(qryTxt, re_comment, "\\1 \\3");

  // FiXME: replace lines
  // Consider:
  // https://stackoverflow.com/a/20058432/1655567
  boost::replace_all(result, re_lineend, " ");

  // Remove line breaks and return clean string
  // boost::regex_replace(qryTxt, re_linebreaks, " ");

  // Return clean text
  return result;
}

