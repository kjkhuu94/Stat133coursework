library(ggvis)

shiny = shinyUI(fluidPage(
  titlePanel("Life Expectancy and Income"),
  
  mainPanel(
    uiOutput("ggvis_ui"),
    ggvisOutput("ggvis")
  )
))