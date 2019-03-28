#-------------------------------------------------------------------------------
# Program: getDataVar.R
# Objective: transform data in suitable form for graph
# Authors: Chourrout Elise
# Creation: 15/02/2019
# Update:
#-------------------------------------------------------------------------------

#' @title Get Data from WS2 and formate them
#'
#' @importFrom phisWSClientR initializeClientConnection
#' @importFrom phisWSClientR getVariables2
#'
#' @param varURI uri of the variable to plot, from the \code{\link{variableList}} function or the web service directly
#' @param variableList from \code{\link{variableList}}
#' @param token a token from \code{\link{getToken}} function
#'
#' @return WSResponse
#' @export
#'
#' @examples
#' \donttest{
#' initializeClientConnection(apiID="ws_private", url = "www.opensilex.org/openSilexAPI/rest/")
#'  aToken <- getToken("guest@opensilex.org","guest")
#'  token <- aToken$data
#'  varPrettyTot <- variableList(token = token)
#'  getDataVar(varURI = listVariables(token,
#'                   wsUrl="www.opensilex.org/openSilexAPI/rest/")$value[1],
#'                   variableList = varPrettyTot,
#'                   token = token)
#' }
getDataVar <- function(varURI, variableList, token) {

  # Recuperation of the uri of the variable of interest
  numVar <- match(varURI, variableList$uri)

  nameUriVar <-  variableList$uri[numVar]

  # Recuperation of the data from the WS
  myCount <- phisWSClientR::getEnvironmentData(token = token, variable = varURI)$totalCount
  enviroData <- phisWSClientR::getEnvironmentData(token = token, variable =  varURI, verbose = TRUE, pageSize = myCount)$data

  # Creation of the dataTable to return
  nomVar <- paste(toupper(substr(variableList$name[numVar],1,1)), substr(variableList$name[numVar],2,nchar(variableList$name[numVar])), sep = "")
  methodVar <- as.character(variableList$method[numVar])
  acronymVar <- as.character(variableList$acronym[numVar])
  unityVar <- as.character(variableList$unity[numVar])
  variableList <- list(name = nomVar, method = methodVar, acronym = acronymVar, unity = unityVar)

  return(list(enviroData = enviroData, variableList = variableList))
}
