
library(shiny)

shinyUI(
  navbarPage("Motor Trend Data Analysis Application",
             tabPanel("Author", h3("The Author of this app is KX for the coursera assignment"),
                      div("The assingment helps to let you make two choices. to buy a car, what car to buy or to buy a diamond for your girlfriend",
                          br(),br()
                     
                          )
             ),
             tabPanel("Diamonds",shinyUI(fluidPage(
               
               # Application title
               titlePanel("Why diamonds are overpriced"),
               
               # Sidebar with options selectors
               sidebarLayout(
                 sidebarPanel(
                   helpText("This app helps you convince your fiance a diamond is overpriced."),
                   h3(helpText("Select:")),
                   numericInput("car", label = h4("Carats"), step = 0.01, value = 1.5),
                   selectInput("cut", label = h4("Cut"),
                               choices = list("Unknown" = "*", "Fair" = "Fair", "Good" = "^Good",
                                              "Very Good" = "Very Good", "Premium" = "Premium",
                                              "Ideal" = "Ideal")),
                   selectInput("col", label = h4("Color"),
                               choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                              "F" = "F", "G" ="G",
                                              "H" = "H", "I" = "I",
                                              "J" = "J")),
                   selectInput("clar", label = h4("Clarity"),
                               choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                              "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                              "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" ))
                 ),
                 
                 # Show a plot with diamonds and regression line
                 mainPanel(
                   plotOutput("distPlot"),
                   h4("Predicted value of this diamond is:"),
                   h3(textOutput("result"))
                 )
               )
             ))
                          
                      
             ),
             tabPanel("Cars",
                      
                      fluidPage(
                        titlePanel("Cars"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of Cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross Horsepower" = "hp",
                                          "Rear Axle Ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 Mile Time" = "qsec",
                                          "Engine (V/S)" = "vs",
                                          "Transmission (Auto/Manual)" = "am",
                                          "Number of Forward Gears" = "gear",
                                          "Number of Carburetors" = "carb"
                                        )),
                            selectInput("colzz", "Line Colour:",
                                        c("1" = "1",
                                          "2" = "2",
                                          "3" = "3",
                                          "4" = "4",
                                          "5" = "5",
                                          "6" = "6",
                                          "7" = "7",
                                          "8" = "8"
                                          
                                        ))
                          )
                          
                          ,
                          
                          
                          
                          mainPanel(
                            h4(textOutput("caption")),
                            plotOutput("mpgPlot"),
                            verbatimTextOutput("fit")
                          )
                        )
                      )
             ),
             tabPanel("Data Set",
                      h3("About the Data Sets"),
                      div("The mtcars dataset is comprised of data that was
                          was extracted from the 1974 Motor Trend US
                          magazine, and comprises fuel consumption and 11
                          aspects of automobile design and performance
                          for 32 automobiles (1973-74 models).",
                          br(),br(),
                          "The mtcars dataset is a data frame with 32
                          observations on 11 (numeric) variables:",
                          br(),br(),
                          tags$ul(
                            tags$li(tags$strong("mpg"), "Miles/(US) gallon"),
                            tags$li(tags$strong("cyl"), "Number of cylinders"),
                            tags$li(tags$strong("disp"), "Displacement (cu.in.)"),
                            tags$li(tags$strong("hp"), "Gross horsepower"),
                            tags$li(tags$strong("drat"), "Rear axle ratio"),
                            tags$li(tags$strong("wt"), "Weight (1000 lbs)"),
                            tags$li(tags$strong("qsec"), "1/4 mile time"),
                            tags$li(tags$strong("vs"), "Engine (0 = V-shaped, 1 = straight)"),
                            tags$li(tags$strong("am"), "Transmission (0 = automatic, 1 = manual)"),
                            tags$li(tags$strong("gear"), "Number of forward gears"),
                            tags$li(tags$strong("carb"), "Number of carburetors")
                          ), br(),br(),
                          
                          "The second data set used for this application is diamonds data set, which is part of ggplot2 package. This data set contains the information about 53940 diamonds with 10 variables and Builds a plot and gives predicted price of the diamond.")
             ,br(),
             tags$ul(
             tags$li(tags$strong("Carat"), ""),
             tags$li(tags$strong("Cut"), ""),
             tags$li(tags$strong("Color"), ""),
             tags$li(tags$strong("Clarity"), "")
             )

                      
                      
                      
                      ),
             tabPanel("About",
                      h3("The two analysis"),
                      div("Motor Trend Data Analysis is an interactive
                          application that uses linear regression modeling
                          techniques to estimate fuel consumption (MPG) in 32
                          automobiles (1973-74 models) based on 11 aspects of
                          automobile design and performance.",
                          em(""),
                          br(),br(),
                          "",
                          br(),br(),
                          
                          "Diamond analysis is building linear regression model using diamonds data set and is predicting the price of a diamond depending of its properties.The application allows the user to select:",
                          a(href = ""))
             )
  )
  )