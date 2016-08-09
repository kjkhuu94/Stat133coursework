library(shiny)
library(dplyr)
library(tidyr)
library(ggvis)

final_table <- read.csv("cleaned_demographics.csv") %>%
  na.omit()
cbPalette <- c("#E69F00", "#56B4E9", "#66CC99", "#F0E442", "#D55E00","#CC79A7")
server = shinyServer(function(input, output, session) {
  
  final_table %>% 
    ggvis(x = ~GDP_Per_Capita, 
          y = ~Life_Expectancy, 
          key := ~country,
          size = ~Population, 
          stroke := "black", 
          opacity := 0.8) %>% 
    filter(Year == eval(input_slider(1800, 
                                     2015,
                                     value=1800,
                                     label = "Year:",
                                     animate = animationOptions(interval = 400, loop = TRUE)))) %>% 
    hide_legend("size") %>%
    add_axis("x", 
             title = "GDP (Inflation-Adjusted)",
             value = c(500, 5000, 150000),
             format = "d",
             properties = axis_props(title = list(fontSize = 16))) %>% 
    scale_numeric("x", 
                  domain = c(300, 150000), 
                  trans = "log", 
                  expand = 0) %>%
    scale_numeric("y", 
                  domain = c(0,100), nice = TRUE) %>%
    
    add_axis("y", 
             title = "Life Expectancy", 
             values = seq(0, 100, 25),
             format = "d",
             properties = axis_props(title = list(fontSize = 16))) %>%
    add_tooltip(function(x) {
      if(is.null(x)) return(NULL)
      paste0(x[4])}, "hover") %>%
    layer_points(fill = ~Region) %>% 
    scale_numeric("size", 
                  range = c(50, 2000)) %>% 
    scale_nominal("fill",range=cbPalette) %>% 
    set_options(height = 400, width = 800) %>%
    bind_shiny("ggvis", "ggvis_ui")
  
})
