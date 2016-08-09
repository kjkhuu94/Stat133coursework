library(ggplot2)
library(ggvis)
library(dplyr)
library(rvest)
library(stringr)
library(tidyr)
library(scales)

final_table<- read.csv("cleaned_demographics.csv") %>%
  select(-X)
cbPalette <- c("#E69F00", "#56B4E9", "#66CC99", "#F0E442", "#D55E00","#CC79A7")

shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
    GDP_Per_Capita="GDP_Per_Capita"
    Life_Expectancy="Life_Expectancy"
    Region="Region"
    Population="Population"
    final_table =final_table %>% 
      filter(Year %in% input$Year)
    ggplot(final_table) +
      geom_point(aes_string(x = GDP_Per_Capita,
                            y = Life_Expectancy,
                            fill=Region,
                            size=Population),
                 pch=21,
                 color="black",
                 alpha=0.8)+
      guides(size=FALSE)+
      scale_x_log10(labels=dollar_format(prefix="$"),
                    limits = c(500, 50000),
                    breaks =c(500,5000,50000))+
      scale_y_continuous(breaks=seq(25,75,25),
                         limits=c(20,80),
                         labels=c("25 Years","50 Years","75 Years"))+
      labs(x="GDP Per Capita(Inflation-Adjusted)",
           y="Life Expectancy at Birth",
           title=input$Year)+
    theme(plot.title=element_text(size=20),
          axis.title.y=element_text(size=15),
          axis.title.x=element_text(size=15))+
      scale_size_area(max_size = 25)+
      scale_fill_manual(values=cbPalette)
    
  })
})