
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SoundscapeR

<!-- badges: start -->
<!-- badges: end -->

The goal of SoundscapeR is to enbale simple soundscape survey analysis
and visualisation in R.

## Installation

You can install the development version of SoundscapeR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("MitchellAcoustics/SoundscapeR")
```

## Example

This is a basic example which shows you how to load the International
Soundscape Database from the internet:

``` r
library(soundscaper)
data <- ISD
head(data)
#>   LocationID   SessionID GroupID RecordID Language Lockdown start_time end_time
#> 1 CamdenTown CamdenTown1   CT101      525  English        0   43587.49 43587.49
#> 2 CamdenTown CamdenTown1   CT101      561  English        0   43587.49 43587.49
#> 3 CamdenTown CamdenTown1   CT101      526  English        0   43587.49 43587.49
#> 4 CamdenTown CamdenTown1   CT102      560  English        0   43587.49 43587.50
#> 5 CamdenTown CamdenTown1   CT103      527  English        0   43587.49 43587.50
#> 6 CamdenTown CamdenTown1   CT104      528  English        0   43587.49 43587.50
#>   latitude longitude Traffic Other Human Natural ISOPleasant ISOEventful
#> 1 51.53912 -0.142624       4     3     3       2     -0.2197      0.4268
#> 2 51.53912 -0.142624       4     3     4       2     -0.4697      0.1768
#> 3 51.53912 -0.142624       3     1     2       1      0.0000      0.2500
#> 4 51.53912 -0.142624       3     2     4       1      0.1036     -0.7500
#> 5 51.53912 -0.142624       4     2     4       1      0.2500      0.7500
#> 6 51.53912 -0.142624       4     3     2       1      0.0732      0.6768
#>   pleasant chaotic vibrant uneventful calm annoying eventful monotonous Overall
#> 1        2       4       3          2    1        2        4          3       2
#> 2        3       4       2          1    1        4        2          4       3
#> 3        4       3       3          2    2        4        3          2       3
#> 4        4       2       2          5    5        3        2          5       2
#> 5        3       4       5          1    2        2        4          1       3
#> 6        2       4       5          1    2        2        4          2       2
#>   Appropriate loud sss04 sss05 who01 who02 who03 who04 who05 WHO_Sum Age Gender
#> 1           3    4     1     2     1     1     3     0     3      32  23   Male
#> 2           2    4     1     3     4     4     3     4     4      76  24 Female
#> 3           4    2     1     3     3     3     4     4     3      68  22   Male
#> 4           4    3     1     2     4     3     3     4     5      76  28   Male
#> 5           4    3     3     3     2     2     1     0     3      32  56   Male
#> 6           3    4     2     3     4     3     2     1     4      56  18   Male
#>   occ00___Employed occ00___Unemployed occ00___Retired occ00___Student
#> 1                1                  0               0               0
#> 2                1                  0               0               0
#> 3                1                  0               0               0
#> 4                1                  0               0               0
#> 5                1                  0               0               0
#> 6                0                  1               0               0
#>   occ00___Other occ00___RatherNotSay occ00_other Occupation edu00 eth00
#> 1             0                    0        <NA>   Employed     2     1
#> 2             0                    0        <NA>   Employed     2     1
#> 3             0                    0        <NA>   Employed     2     1
#> 4             0                    0        <NA>   Employed     5     1
#> 5             0                    0        <NA>   Employed    NA     1
#> 6             0                    0        <NA> Unemployed     1     1
#>   eth00_other misc00 misc03 misc03_other misc04 misc01 use00 uni00 res00___1
#> 1        <NA>   <NA>     NA         <NA>     NA   <NA>     1     3         1
#> 2        <NA>   <NA>      2         <NA>     NA   <NA>     1     3         1
#> 3        <NA>   <NA>     NA         <NA>     NA   <NA>     1     3         1
#> 4        <NA>   <NA>      2         <NA>     NA   <NA>     1     1         1
#> 5        <NA>   <NA>     NA         <NA>     NA   <NA>     3     1         1
#> 6        <NA>   <NA>     NA         <NA>     NA   <NA>     1     1         1
#>   res00___2 res00___3 res00___4 res00___5                            res02
#> 1         1         0         0         0                             <NA>
#> 2         1         0         0         0                             <NA>
#> 3         1         0         0         0                             <NA>
#> 4         1         0         0         0                             <NA>
#> 5         1         0         0         0                             <NA>
#> 6         1         0         0         0 There was alarm whistle passing.
#>   paper RecordingLength Loudness_N5(soneGF) N10_N90(soneGF) Sharpness_S(acum)
#> 1     0           31.57                31.1            11.6              2.14
#> 2     1           31.57                31.1            11.6              2.14
#> 3     0           31.57                31.1            11.6              2.14
#> 4     1           32.47                34.4            12.3              2.18
#> 5     0           35.16                24.7             4.8              2.00
#> 6     0           31.96                38.6            12.1              2.37
#>   Rough_HM_R(asper) Rough_HM_Avg,arith(asper) FS_Avg,arith(vacil)
#> 1            0.0374                    0.0374             0.01700
#> 2            0.0374                    0.0374             0.01700
#> 3            0.0374                    0.0374             0.01700
#> 4            0.0446                    0.0446             0.01790
#> 5            0.0369                    0.0369             0.00889
#> 6            0.0413                    0.0413             0.01460
#>   I_HM_Avg,arith(iu) Ton_HM_Avg,arith(tuHMS) LZeq_L(dB(SPL)) LAeq_L(A)(dB(SPL))
#> 1              0.358                   0.309           79.72              70.07
#> 2              0.358                   0.309           79.72              70.07
#> 3              0.358                   0.309           79.72              70.07
#> 4              0.362                   0.268           80.27              71.26
#> 5              0.370                   0.193           76.79              66.71
#> 6              0.393                   0.210           80.13              72.47
#>   LA10_LA90(dB(SPL)) LCeq_LAeq(dB(SPL)) LC10_LC90(dB(SPL)) RA_2D_cp(cPa)
#> 1               7.78               7.81               8.11          14.3
#> 2               7.78               7.81               8.11          14.3
#> 3               7.78               7.81               8.11          14.3
#> 4               8.38               6.25               7.82          14.7
#> 5               4.23               7.61               3.99          13.4
#> 6               6.97               6.32               3.79          15.1
#>   PA(Zwicker)
#> 1    36.01918
#> 2    36.01918
#> 3    36.01918
#> 4    40.52327
#> 5    27.10863
#> 6    48.70882
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
cut.data <- data %>%
  dplyr::filter(LocationID %in% c("CamdenTown", "PancrasLock", "RegentsParkJapan"))
ISOjointplot(cut.data, group = "LocationID")
#> Warning: Removed 167 rows containing non-finite values (`stat_density2d()`).
#> Removed 167 rows containing non-finite values (`stat_density2d()`).
#> Warning: Removed 167 rows containing missing values (`geom_point()`).
```

<img src="man/figures/README-jointplotDemo-1.png" width="100%" />

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
