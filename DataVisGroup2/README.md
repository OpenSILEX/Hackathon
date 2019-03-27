# README

This repository shows the process of the Data Visualization group 2 and its results.

## Aim

Use OpenSILEX web service by using phisWSClientR package to retrieve both environmental data and event informations that occurred during a defined period and then display them in a responsive graph.

## Process step by step

1. Install the packages necessary to communicate with OpenSILEX / PHIS Web Services :

```{r}
remotes::install_github("OpenSILEX/phisWSClientR", build_vignettes=TRUE) #"sanchezi/docAppPhisWSClientR"
remotes::install_github("OpenSILEX/opensilex-datavis-rapp-demo", build_vignettes=TRUE)
```

2. Initialize your connection with opensilex.org and get a token using the following R code :

```{r}
library(phisWSClientR)
initializeClientConnection(apiID="ws_private", url = "www.opensilex.org/openSilexAPI/rest/")
token <- getToken("guest@opensilex.org","guest")$data
```

3. Explore the **phisWSClientR** package functions :

```{r}
?phisWSClientR::getEnvironmentData
?phisWSClientR::getEvents
?phisWSClientR::getVariables2
```

4. Create a function that will permits to create our graph and put it in R folder
   ( here it's _devOutliers.R_)

5. The variable of interest is fixed (wind maximum speed) :

   - http://www.opensilex.org/demo/id/variables/v004

6. Connect to GitHub and download the R app created by Jean-Eudes Hollebecq (optionnally, fork this repository) : https://github.com/OpenSILEX/opensilex-datavis-rapp-demo

7. Change your directory name from "opensilex-datavis-rapp-demo" to something else (e.g. "eventsEnvApp")

8. Double-click on the .RProj file to open with RStudio the project you downloaded from GitHub

9. Explore the **compareVariableDemo** package (downloaded from the OpenSILEX/opensilex-datavis-rapp-demo repository) functions :

```{r}
library(compareVariableDemo)
```

10. Put the _devOutliers.R_ file in R folder (remove unnecessary functions) using RStudio

`We stopped here , the next steps were the following :`

11. Add function documentation (functions imports, parameters descriptions) using roxygen, and update documentation 

```{r}
roxygen2::roxygenise()
```
12.  Add right package description in DESCRIPTION file

13.  Check and build your package using Rstudio (or with devtools) and correct warnings

```{r}
devtools::check()
```

14.  Modify your index.html (form) file in inst/www/ folder to create the right form

15.  Modify your app.js file in inst/www/js folder to create the right bindings (set inputs and get the functions) between the form and the showPlot() function

16.  The changes made by the group are available in the GitHub repository , Arnaud just created :

 - https://github.com/niio972/opensilex-hackathon-events-vs-env

17. The result can be test on opensilex openCPU server :

 - [opencpu hackathon events vs env](http://opensilex.org:8004/ocpu/apps/niio972/opensilex-hackathon-events-vs-env/www/)

Or you can try it locally, just run :

```{r}
install.packages("unix") 
install.packages("opencpu") 
opencpu::ocpu_start_app("niio972/opensilex-hackathon-events-vs-env")
```
