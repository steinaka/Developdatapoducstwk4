
library(shiny)
library(datasets)
library(ggplot2)
library(dplyr)
library(rsconnect)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

diam <- diamonds[,c(1:4,7)]

shinyServer(function(input, output) {
  
  getVariableName <- function(x) {
    switch(as.character(x),
           "cyl" = return("Number of Cylinders"),
           "disp" = return("Displacement (cu.in.)"),
           "hp" = return("Gross Horsepower"),
           "drat" = return("Rear Axle Ratio"),
           "wt" = return("Weight (lb/1000)"),
           "qsec" = return("1/4 Mile Time"),
           "vs" = return("Engine (V/S)"),
           "am" = return("Transmission (Auto/Manual)"),
           "gear" = return("Number of Forward Gears"),
           "carb" = return("Number of Carburetors"),
           "Unknown"
    )
  }
  
  formulaText <- reactive({
    paste("Relationship Between MPG and", getVariableName(input$variable))
  })
  
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data = mpgData)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(mpgData, {
      plot(as.formula(formulaTextPoint()),
           ylab = "Miles/(US) Gallon",
           xlab = getVariableName(input$variable))
      abline(fit(), col = input$colzz)
    })
  })
  
  output$distPlot <- renderPlot({
    # select diamonds depending of user input
    diam <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
    # build linear regression model
    fit <- lm( price~carat, diam)
    # predicts the price 
    pred <- predict(fit, newdata = data.frame(carat = input$car,
                                              cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar))
    # Drow the plot using ggplot2
    plot <- ggplot(data=diam, aes(x=carat, y = price))+
      geom_point(aes(color = cut), alpha = 0.3)+
      geom_smooth(method = "lm")+
      geom_vline(xintercept = input$car, color = "red")+
      geom_hline(yintercept = pred, color = "green")
    plot
  })
  output$result <- renderText({
    # renders the text for the prediction below the graph
    diam <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
    fit <- lm( price~carat, diam)
    pred <- predict(fit, newdata = data.frame(carat = input$car,
                                              cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar))
    res <- paste(round(pred, digits = 2), "$")
    res
  })
  
  
})
