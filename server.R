library(shiny)
library(ggplot2)
##Get data

data("diamonds")
   set.seed(1234)
   dsmall <- diamonds[, c("carat","cut","color","clarity","price") ]

  
shinyServer(
 function(input,output){
  
   data <- reactive({
     dsub <- subset(dsmall, carat >= input$caratmin & carat <= input$caratmax &
                      (color %in% input$color) & (cut %in% input$cut) )
     return(dsub)
     })  
   
   output$price <- renderText({
     avgpr <- round(mean(data()$price),2)
     isolate(paste("US$ ",avgpr))
     })
    
   output$plot <- renderPlot({
     p <- ggplot(data=data(), aes(x=carat, y=price)) +  geom_point(aes(color = color))
     print(p)
     })
   
   }
 )