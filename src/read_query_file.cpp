#include <fstream>
#include <sstream>
#include <string>
#include <regex>
#include <Rcpp.h>

//' @rdname utility_functions
//' @param file_path File path string to source
//' @section read_query_file: C++ fast cleaner for query text file removing
//'   comments and line breaks.
// [[Rcpp::export]]

Rcpp::String read_query_file(std::string file_path) {

  // Define regex to match lines with comments
  // Comments starting with --
  std::regex re_comment_hyphen("(^|\n)(\\s*--[^\n|$]*)(\n|$)");
  // Comments starting with ##
  std::regex re_comment_hash("^#.*|^\\s*#");
  // Regular expressions to pass to replace_all line breaks or Tab
  std::regex re_lineend("\n|\r|\t");

  // Read file
  // source: https://doi.org/10.6084/m9.figshare.3407032.v1
  std::ifstream in(file_path.c_str());  //connect with file into in(STDIN)
  std::stringstream ss;
  ss<<in.rdbuf();                       // scan file or reading buffer

  // Replace comments via regex replace
  std::string result = std::regex_replace(ss.str(), re_comment_hyphen, "");
  result = std::regex_replace(result, re_comment_hash, "");

  // Replace line breaks
  result = std::regex_replace(result, re_lineend, " ");

  // Return clean text
  return result;
}
