# README

This repository shows the process of the Data Visualization group and its results.

## Aim

Use the BrAPI calls implemented in OpenSILEX / PHIS to retrieve both environmental and phenotypic data and then display them in a responsive histogram.

For this purpose, we will test if it is possible to adapt the BrAPI-Graphical-Filtering BrAPPS created by the BrAPI team : https://github.com/solgenomics/BrAPI-Graphical-Filtering

## Process step by step

1. Connect to GitHub and download the R app created by Jean-Eudes Hollebecq (optionnally, fork this repository) :

https://github.com/OpenSILEX/opensilex-datavis-rapp-demo

2. Open R and install the packages necessary to communicate with OpenSILEX / PHIS Web Services :

```{r}
devtools::install_github("sanchezi/phisWSClientR", build_vignettes=TRUE) #"sanchezi/docAppPhisWSClientR"
devtools::install_github("OpenSILEX/opensilex-datavis-rapp-demo", build_vignettes=TRUE)
```

