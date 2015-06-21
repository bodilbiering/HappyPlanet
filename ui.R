##ui.R
library(shiny)

shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Happy Planet Index"),
    
    sidebarPanel(
        em("The Happy Planet Index (HPI) is the leading global measure of sustainable well-being.
           For more information see: "), a("http://www.happyplanetindex.org"),
        
        selectInput("select", label = h4("Choose a parameter to be visualized on the map:"), 
                    choices = list( "Happy Planet Index"="Happy Planet Index", 
                                    "Life Expectancy" = "Life Expectancy", 
                                    "Well Being" = "Well Being",
                                    "Happy Life Years" = "Happy Life Years", 
                                    "HPI Rank" = "HPI Rank", 
                                    "Ecological Footprint"= "Ecological Footprint"), 
                    selected = 1),
        helpText("On the 'Map' tab you will see a visualization of the parameter you have chosen.
                 For more info about the parameters, see http://www.happyplanetindex.org"),
        hr(),
        
       
        selectInput("select2", label = h4("Choose a second parameter for the scatterplot:"),
                    choices = list( "Happy Planet Index"="Happy Planet Index", 
                                    "Life Expectancy" = "Life Expectancy", 
                                    "Well Being" = "Well Being",
                                    "Happy Life Years" = "Happy Life Years", 
                                    "HPI Rank" = "HPI Rank", 
                                    "Ecological Footprint"= "Ecological Footprint"), 
                    selected = 1),
        helpText("On the 'Scatterplot' tab you will see a plot of the two parameters you have chosen.
                 For more info about the parameters, see http://www.happyplanetindex.org")
        ),
    
    
    mainPanel( 
        tabsetPanel(type = "tabs", 
                    tabPanel("Map", htmlOutput('geoChart')), 
                    tabPanel("Scatterplot",  htmlOutput('scatterChart')))
    )
    
))