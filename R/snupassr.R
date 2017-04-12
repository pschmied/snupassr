#' Get an entry from lastpass via the CLI. Mostly not used
#' directly. Mostly.
#'
#' @export
#' @param flags are passed to lpass to specify what should be shown
#' @param site_entry which entry in lastpass should be shown. Defaults
#'     to opendata.socrata.com.
#' @return a character string
#' @examples
#' get_lpass("--username", "example.com")
get_lpass <- function(flags, site_entry = "opendata.socrata.com") {
    system(paste("lpass show", flags, site_entry), intern = TRUE)
}


#' Get the user field from a lastpass entry.
#'
#' @export
#' @param site_entry which entry in lastpass should be shown. Defaults
#'     to opendata.socrata.com.
get_user <- purrr::partial(get_lpass, flags = "--username")


#' Get the password field from a lastpass entry.
#'
#' @export
#' @param site_entry which entry in lastpass should be shown. Defaults
#'     to opendata.socrata.com.
get_pass <- purrr::partial(get_lpass, flags = "--password")


#' Get the "pubtoken" custom field from a lastpass entry.
#'
#' @export
#' @param site_entry which entry in lastpass should be shown. Defaults
#'     to opendata.socrata.com.
get_token <- purrr::partial(get_lpass, flags = "--field=pubtoken")
