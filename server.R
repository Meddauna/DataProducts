#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
data(mtcars)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  mtmodel<-reactive({
    wttf<- "wt" %in% input$variable
    disptf<- "disp" %in% input$variable
    cyltf<- "cyl" %in% input$variable
    amtf<- "am" %in% input$variable
    if(length(input$variable)==0){
      #lm(as.formula("mpg~."), data = mtcars)
    }
    else if(amtf){
      lm(as.formula(paste("mpg~(",paste(input$variable[1:length(input$variable)-1],collapse = "+"),")*am")), data = mtcars)
    }
    else{
      lm(as.formula(paste("mpg~",paste(input$variable,collapse = "+"))), data = mtcars)
    }
    })
  
  
  output$modsum<-renderPrint(summary(mtmodel()))

  output$mtpredict <- renderPrint({
      if(input$amInput=="Automatic"){amv<-1}
      else{amv<-0}
      new = data.frame(wt = input$wtInput, disp = input$dispInput, cyl = input$cylInput, am = amv)
      predict(mtmodel(),new)

  })
  
})
