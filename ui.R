#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
       titlePanel("Predict Diamond Price Based on Carat Size"),
# Set the layout of the app.
# We will use a two panel layout, the left one contains a slider to select the carat size
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCarat", "What is the Carat size of the diamond?",
                        "Number of bins:",
                        min = 0,
                        max = 1,
                        value = 0.2,
                        step = 0.01)
        ),
# The right panel contains a plot, with a regression line and the output of the prediction
# based on the regression.
        
        mainPanel(
            plotOutput("plot"),
            h3("Predicted value of the diamond (in USD):"),
            textOutput("pred")
        )
    )
))
