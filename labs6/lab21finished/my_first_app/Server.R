library(shiny)
library(ggplot2)
library(dplyr)
library(datasets)

shinyServer(function(input, output) {
  
  output$Plot<- renderPlot({
    
    subcut<- input$cut
    subcolor<- input$color
    diamonds %>% 
      filter(cut %in% subcut, color%in%subcolor) %>% 
      ggplot(aes_string(x=input$Variable,y="price"))+
      geom_point()
  })
})