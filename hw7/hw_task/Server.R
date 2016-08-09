library(shiny)
library(ggplot2)
library(dplyr)
library(scales)
summary_full_data<- read.csv("summary_full_data.csv")

shinyServer(function(input, output) {

  output$plot <- renderPlot({
    summary_full_data<- summary_full_data %>%
      filter(Question %in% input$Question)
    ggplot(summary_full_data)+
      geom_polygon(aes(x=long,y=lat,group=group,fill=Answer),color="black") +
      coord_fixed(1.3)+
      theme_void()+ggtitle(str_wrap(input$Question,width=60))+
      scale_fill_discrete(labels= function(x) str_wrap(x,width=20))
    
  })
})