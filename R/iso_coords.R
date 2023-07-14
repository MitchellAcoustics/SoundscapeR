#' Calculate the projected ISOPleasant and ISOEventful coordinates.
#'
#' @param df Dataframe containing ISD formatted data
#' @param scale_to_one Should the coordinates be scaled to (-1, +1)
#' @param val_range The range of values, by default Likert scaled c(1, 5)
#' @param projection Use the trigonometric projection (cos(45)) term for diagonal PAQs
#'
#' @return A list of 2 with ISOPleasant and ISOEventful values
#' @export
#'
#' @examples
#' df <- tibble::tibble(
#'     pleasant = c(2, 3, 4), chaotic = c(4, 4, 3), vibrant = c(3, 2, 3),
#'     uneventful = c(2, 1, 2), calm = c(1, 1, 2), annoying = c(2, 4, 4),
#'     eventful = c(4, 2, 3), monotonous = c(3, 4, 2)
#'     )
#' iso_coords(df, val_range = c(1, 5))
iso_coords <- function(df, scale_to_one = TRUE, val_range = c(1, 5), projection = TRUE) {
    if (projection) {
        proj <- cos(pi/4)
    } else {
        proj <- 1
    }

    if (scale_to_one) {
        scale <- circ_scale(val_range)
    } else {
        scale <- 1
    }

    complex_pleasant <- (
        df['pleasant'] - df['annoying'] +
            proj * (df['calm'] - df['chaotic']) +
            proj * (df['vibrant'] - df['monotonous'])
    )
    ISOPleasant <- complex_pleasant / scale

    complex_eventful <- (
        df['eventful'] - df['uneventful'] +
            proj * (df['chaotic'] - df['calm']) +
            proj * (df['vibrant'] - df['monotonous'])
    )
    ISOEventful <- complex_eventful / scale
    c(ISOPleasant, ISOEventful)
}

#' Calculated scaling function for a custom range of response values
#'
#' @param range A double with the min and max possible values of the response, i.e. `c(1, 5)`
#'
#' @return A float
#' @export
circ_scale <- function(range) {
    diff = max(range) - min(range)
    diff + diff * sqrt(2)
}
