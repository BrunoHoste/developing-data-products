#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# We use the diamond dataset from the UsingR package
library(UsingR)
data("diamond")
# We determine a simple linear regression to make our prediction
shinyServer(function(input, output) {
            model <- lm(price~carat,data=diamond)
            
            modelpred <- reactive({
                caratinput <- input$sliderCarat
                predict(model,newdata=data.frame(carat=caratinput))
                })
# We make a scatterplot of the data we have and add a regression line in red.
# We also add a blue point which is our prediction based on the input from the slider.
            output$plot <- renderPlot({
                caratinput <- input$sliderCarat
                plot(diamond$carat,diamond$price,xlab = "Carat size",
                     ylab = "Diamond price (in USD)",xlim=c(0,1),ylim=c(0,4000))
                abline(model,col='red',lwd=2)
                points(caratinput,modelpred(),col='blue',pch=16,cex=2)
            })
            
            output$pred <- renderText ({
                modelpred()
            })
    })


