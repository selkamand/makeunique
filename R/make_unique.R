
#' Make Values Unique
#'
#' Append numbers to duplicate values to ensure all are unique
#'
#' @param x vector to de-duplicate
#' @param sep string separating (string)
#' @param wrap_in_brackets should the number indicating order of duplicated elements be wrapped in round brackets? (flag)
#' @param warn_about_type_conversion should the function warn user if input type is converted to 'character' in output (flag)
#' @return x but duplicated values are de-duplicated by adding a number corresponding to the order in which duplicates appear
#'
#' @details Differs from 'make.unique' in base R by starting suffixes at 1 and allowing users to customize suffix format.
#'
#' @export
#' @examples
#' make_unique(c('bob', 'billy', 'bob', 'bob'))
make_unique <- function(x, sep = " ", wrap_in_brackets = TRUE, warn_about_type_conversion = TRUE){
  if(!(is.character(sep) & length(sep) == 1)) stop('`sep` must be a string, not a ', paste0(class(sep), collapse = " "))
  if(!(is.logical(wrap_in_brackets) & length(wrap_in_brackets) == 1)) stop('`wrap_in_brackets` must be a flag, not a ', paste0(class(wrap_in_brackets), collapse = " "))
  if(!(is.logical(warn_about_type_conversion) & length(warn_about_type_conversion) == 1)) stop('`warn_about_type_conversion` must be a flag, not a ', paste0(class(warn_about_type_conversion), collapse = " "))
  if(!any(is.numeric(x),is.character(x),is.factor(x))) stop('input to `make_unique` must be a character, numeric, or factor variable')

  if(is.factor(x)) {
    if(warn_about_type_conversion) warning('make_unique: Converting factor to character variable')
    x <- as.character(x)
  }
  else if(is.numeric(x)) {
    if(warn_about_type_conversion) warning('make_unique: Converting numeric variable to a character vector')
    x <- as.character(x)
  }

  deduplicated = stats::ave(x, x, FUN = function(a){
    if(length(a) > 1){
      suffixes <- seq_along(a)
      if(wrap_in_brackets) suffixes <- paste0('(', suffixes, ')')
      paste0(a, sep, suffixes)
    }
    else {a}
  })

  values_still_duplicated <- deduplicated[duplicated(deduplicated)]

  if(length(stats::na.omit(values_still_duplicated)) > 0){
    stop(
      "make_unique failed to make vector unique.\n",
      "This is because appending '  <dup_number>' to duplicate values led to ",
      "creation of term(s) that were in the original dataset: \n[",
      paste0(values_still_duplicated, collapse = ', '),
      "]\n\nPlease try again with a different argument for either `wrap_in_brackets` or `sep`"
    )
  }

  return(deduplicated)
}
