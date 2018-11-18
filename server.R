#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

model <- lm(mpg ~ ., data = mtcars[,-c(7,8)])


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    prediction <- reactive({
        p <- predict(model, newdata = data.frame(
            am = as.integer(input$am),
            cyl = input$cyls,
            disp = input$disp,
            hp = input$hp,
            drat = input$drat,
            wt = input$wt,
            gear = input$gears,
            carb = input$carb
        ))
        paste("The estimated fuel consumption is ",round(p,2)," miles per gallon or ",round(p/2.352
,2), "litres per kilometre.")
    })
    
    output$fcheader <- renderText("Estimated Fuel Consumption")
    output$fuelconsumption <- renderText({
        prediction()
    })
     
})
min