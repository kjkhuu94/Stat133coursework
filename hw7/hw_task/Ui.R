library(shiny)
summary_full_data=read.csv("summary_full_data.csv")

shinyUI(fluidPage(
  titlePanel("Plotted Idiosyncracies of American Dialect"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("Question",
                  "Choose Question to Inspect:",
                 choices= as.character(unique(summary_full_data$Question))
      )),
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("plot")
      )
    )
))