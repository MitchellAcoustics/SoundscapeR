#' Create a jointplot with 2D density in the center and distributions on the margins.
#'
#' @param df Dataframe including ISO coordinate data
#' @param x Column name for x
#' @param y Column name for y
#' @param group Column name of the grouping variable
#'
#' @return ggplot
#' @export
ISOjointplot <- function(df, x = "ISOPleasant", y = "ISOEventful", group = "LocationID") {
    x <- rlang::sym(x)
    y <- rlang::sym(y)
    group <- rlang::sym(group)

    d <- df %>%
        dplyr::select(!!x, !!y, !!group)

    # define color palette for density plot using pal package
    densityClr <- pals::brewer.dark2(dplyr::count(unique(d[group]))[[1]])

    g <- ggplot2::ggplot(
        data = d,
        ggplot2::aes(x = !!x, y = !!y, group = !!group)) +
        ggplot2::geom_point(
            ggplot2::aes(group = !!group, color = !!group), alpha = 0.3
            ) +
        ggplot2::stat_density_2d(geom = "polygon",
                                 ggplot2::aes(alpha = ggplot2::after_stat(level),
                                              fill = !!group),
                                 bins = 5) +
        ggplot2::scale_fill_manual(values = densityClr) +
        ggplot2::scale_color_manual(values = densityClr) +
        ggplot2::coord_fixed(xlim=c(-1,1), ylim=c(-1,1)) +
        ggplot2::theme(legend.position = "left", legend.box = "vertical")

    g.marg <- ggExtra::ggMarginal(g, groupColour = T, groupFill = T)
    g.marg
}
