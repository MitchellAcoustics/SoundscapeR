#' Load the International Soundscape Database (ISD)
#'
#' @param version A string with the ISD version number
#'
#' @return A tibble
#' @export
#'
#' @examples
#' df <- loadISD(version = "0.2.4")
#' df
loadISD <- function(version = "latest") {
    version <- ifelse(version == "latest", "0.2.4", version)

    if (version == "0.2.4") {
        url  <- "https://zenodo.org/record/6331810/files/SSID%20Lockdown%20Database%20VL0.2.2.xlsx"
    } else if (version == "0.2.0") {
        url <- "https://zenodo.org/record/5578573/files/SSID%20Lockdown%20Database%20VL0.2.1.xlsx"
    } else {
        stop("ISD version not recognised.")
    }

    tibble::as_tibble(openxlsx::read.xlsx(url, sheet = 1))
}

