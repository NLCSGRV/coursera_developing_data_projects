library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    tags$style(HTML(".irs-single, .irs-bar-edge, .irs-bar {background: #7f1e0f}")),
    tags$head(
        tags$style(HTML("@import url('http://fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
  
      h2 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #7f1e0f;
      }

    "))
    ),

    # Application title
    titlePanel("Car Fuel Consumption Prediction Using Multiple Linear Regression"),

    # Fluid Row Layout
    fluidRow(
        column(12,helpText("Using the controls below, choose the characteristics of the",
                           "car. The estimate of fuel consumption in miles per gallon ",
                           "and kilometres per litre will be shown on the right.")),
        column(4,
            selectInput("am", "Transmission", 
                        choices = list("Automatic" = 0, "Manual" = 1), 
                        selected = 0),
            
            sliderInput("cyls",
                        "Number of cylinders:",
                        min = 4,
                        max = 8,
                        step = 2,
                        value = 6),
            sliderInput("gears",
                        "Number of forward gears:",
                        min = 3,
                        max = 5,
                        step = 1,
                        value = 4),
            sliderInput("carb",
                        "Number of carburetors:",
                        min = 1,
                        max = 8,
                        step = 1,
                        value = 2)
        ),
        column(4,
            sliderInput("disp",
                        "Engine displacement (cubic inches):",
                        min = 70,
                        max = 500,
                        step = 1,
                        value = 300),
            sliderInput("hp",
                        "Gross horsepower:",
                        min = 50,
                        max = 500,
                        step = 1,
                        value = 250),
            sliderInput("wt",
                        "Weight (1,000's lbs):",
                        min = 1.5,
                        max = 5.5,
                        value = 3.5),
            sliderInput("drat",
                        "Rear axle drive ratio:",
                        min = 2.7,
                        max = 5,
                        value = 4)
        ),
        column(4,
              h4(textOutput("fcheader")),
              textOutput("fuelconsumption")
        )
    )
))
