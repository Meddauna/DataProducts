#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(ui = fluidPage(
    
    # Application title
    titlePanel("Motor Trend Transmission Regression"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        h3("Select which factors to use in model:"),
        checkboxGroupInput("variable", "Variables to use:",
                           c("Weight" = "wt",
                             "Displacement" = "disp",
                             "Cylinders" = "cyl",
                             "Transmission" = "am")),
        h3("Use inputs to predict MPG for a new car"),
        sliderInput("wtInput","Vehicle Weight (Thousand Pounds)",1,6,3,.5 ),
        sliderInput("dispInput","Engine Displacement",50,500,250,25 ),
        sliderInput("cylInput","# Cylinders",1,8,6,1 ),
        selectInput("amInput","Transmission",c("Automatic","Manual") )
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Model Summary:"),
      verbatimTextOutput("modsum"),
      h2("Predicted MPG:"),
      verbatimTextOutput("mtpredict")
    )
  )
))