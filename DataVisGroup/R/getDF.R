#-------------------------------------------------------------------------------
# Program: getDF.R
# Objective: functions to get the incertitude data related to environment measures
# Authors: Chourrout Elise
# Creation: 15/02/2019
# Update:
#-------------------------------------------------------------------------------

#' @title getDF
#'
#' @description get the dataset of incertitudes for the data selected
#'
#' @param varURI uri of the variable to plot, from the \code{\link{variableList}} function or the web service directly
#' @param token a token from \code{\link{getToken}} function
#' @param smoothing logical, smoothing of the data,  returns the incertitudes from the smoothing
#' @param sensor character, uri of a sensor to filter with
#' @indFilters numeric vector of individuals row number
#' @param endDate date, date from which to filter data, format "\%Y-\%m-\%dT\%H:\%M:\%S"
#' @param startDate date, date to which filter the data, format "\%Y-\%m-\%dT\%H:\%M:\%S"
#'
#' @param wsUrl url of the webservice
#
#' @return data.frame
#' @export
#'
#' @examples
#' \donttest{
#' initializeClientConnection(apiID="ws_private", url = "www.opensilex.org/openSilexAPI/rest/")
#' aToken <- getToken("guest@opensilex.org","guest")
#' token <- aToken$data
#' vars <- variableList(token = token, wsUrl = "www.opensilex.org/openSilexAPI/rest/")
#' vars
#' getDF(token = token, varURI = list("http://www.opensilex.org/demo/id/variables/v004",
#'                                          "http://www.opensilex.org/demo/id/variables/v007"))
#' }
getDF <- function(varURI, indFilters , token, smoothing = FALSE, sensor = NULL, endDate = NULL, startDate = NULL, wsUrl = "www.opensilex.org/openSilexAPI/rest/"){

  phisWSClientR::initializeClientConnection(apiID="ws_private", url = wsUrl)
  ## Data recuperation
  # Variable's information
  variableList <- variableList(token = token, wsUrl = wsUrl)
  variableList <- variableList[ variableList$uri %in% varURI, ]

  # Data
  Data = lapply(varURI, FUN = function(uri){
    enviroData <- getDataVar(varURI = uri, variableList = variableList, token = token)$enviroData
    yVar <- enviroData$value
    # Casting Date in the right format
    xVar <- as.POSIXct(enviroData$date, tz = "UTC", format = "%Y-%m-%dT%H:%M:%S")
    DataX <- data.frame(date = xVar, value = yVar)

    ## Data filtering
    # Chosen dates
    if(!is.null(startDate)){
      startDate <- as.POSIXct(startDate, tz = "UTC", format = "%Y-%m-%d")
      DataX <- DataX[which(DataX$date >= startDate),]
    }
    if (!is.null(endDate)){
      endDate <- as.POSIXct(endDate, tz = "UTC", format = "%Y-%m-%d")
      DataX <- DataX[which(DataX$date <= endDate),]
    }

    DataX = DataX[indFilters ,  ]


    return(DataX)
  })
  names(Data)=variableList$name
  return(Data)
}
