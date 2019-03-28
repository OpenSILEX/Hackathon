/*
 * ******************************************************************************
 *                                     app.js
 *  js
 *  Copyright © INRA 2019
 *  Creation date:  06 March, 2019
 *  Contact: arnaud.charleroy@inra.fr
 * ******************************************************************************
 */

$(function() {
  // Comment for production case
  //ocpu.seturl("http://opensilex.org:8004/ocpu/apps/OpenSILEX/compareVariablesDemo/R");
  ocpu.seturl("http://0.0.0.0:8004/ocpu/library/hackathonApp/R");

  // initialize parameters when token is valid


  // show graph button
  $("#submit").click(function(e) {
    e.preventDefault();
    functionsParameters = getInputs();
    // basical
    // create a plot from htmlwidget named function name .e.g plotVar with Widget.html
    showPlot("plotDiv1", "plotVarDemo", functionsParameters);
    showPlot2("plotDiv2", "plotVarDemo", functionsParameters);
  });
});

function getInputs() {

  functionsParameters = {
    varURI: [
      $("#opensilex-variable1").val(),
      $("#opensilex-variable2").val(),
    ],
    token: $("#opensilex-token").val(),
    wsUrl: $("#wsUrl").val()
  };

  return functionsParameters;
}
