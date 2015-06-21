##server.R
library(shiny)
library(googleVis)
HPIdata <- read.csv("./data/cleanHPI", check.names=F)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
    output$value <- renderPrint({ input$select })
    output$geoChart <- renderGvis({gvisGeoChart(HPIdata, locationvar = "Country", 
                                                colorvar = input$select, 
                                           options = list(width = 600, height = 400, legend = 'none'))}) 
    output$scatterChart <- renderGvis({
        hTitle <- sprintf("{title: '%s'}", input$select)
        vTitle <- sprintf("{title: '%s'}", input$select2)
        gvisScatterChart(HPIdata[,c(input$select, input$select2)], 
                         options = list(width = 600, height = 400, 
                                        title = 'Comparison of two parameters', 
                                        hAxis = hTitle,
                                        vAxis = vTitle,
                                        legend = 'none'))
    })
})