shinyUI(fluidPage(
  titlePanel("Life Expectancy and Income"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("Year",
                  "Year:",
                  min = 1800,
                  max = 2015,
                  value = 1800,
                  step=1,
                  animate = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
))
