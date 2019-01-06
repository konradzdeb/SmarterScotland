#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>
#include <cctype>
#include <Rcpp.h>
#include <boost/regex.hpp>
#include <boost/algorithm/string/replace.hpp>

//' @title Read SQL query file
//'
//' @description  The function provides conveniance solution facilitating file
//'   reading.
//'
//' @param file_path A file path.
//'
//' @return A character vector.
//'
//' @details The original code was based on the syntax available through:
//'   \url{https://figshare.com/articles/Fast_text_file_reading_into_R_using_Rcpp_functions/3407032}.
//'
//' @export

// To quick test query:
// Sys.setenv("PKG_LIBS"="-lboost_regex"); Rcpp::sourceCpp('src/read_query_file.cpp',
// rebuild = TRUE, verbose = TRUE); read_query_file("/Users/huski/Desktop/tst.sql")
//
// Define regex to match lines with comments
const boost::regex re_comment("(^|\n)(\\s*--[^\n|$]*)(\n|$)", boost::regex::extended);
// Regular expressions to pass to replace_all line breaks or Tab
const boost::regex re_lineend("\n|\r|\t", boost::regex::extended);

// [[Rcpp::export]]
Rcpp::String read_query_file(std::string file_path) {

  // Read file
  // source: https://doi.org/10.6084/m9.figshare.3407032.v1
  std::ifstream in(file_path.c_str());  //connect with file into in(STDIN)
  std::stringstream ss;
  ss<<in.rdbuf();                       // scan file or reading buffer

  // Replace comments via regex replace
  std::string result = boost::regex_replace(ss.str(), re_comment, "\\1 \\3");

  // Replace line breaks
  result = boost::regex_replace(result, re_lineend, " ");

  // Return clean text
  return result;
}