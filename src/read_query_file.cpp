#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>
#include <cctype>
#include <Rcpp.h>
#include <boost/regex.hpp>
#include <boost/algorithm/string/replace.hpp>

//' @rdname utility_functions
//' @section read_query_file: C++ fast cleaner for query text file removing
//'   comments and line breaks.
// [[Rcpp::export]]


Rcpp::String read_query_file(std::string file_path) {

  // Define regex to match lines with comments
  const boost::regex re_comment("(^|\n)(\\s*--[^\n|$]*)(\n|$)", boost::regex::extended);
  // Regular expressions to pass to replace_all line breaks or Tab
  const boost::regex re_lineend("\n|\r|\t", boost::regex::extended);

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