shinyUI(fluidPage(
  titlePanel("Diamonds"),
  sidebarLayout(
    sidebarPanel(
      
      selectInput("Variable", 
                  label="select type",
                  choices = list("depth",
                                 "table",
                                 "carat"),
                  selected= "carat"),
      
      checkboxGroupInput("cut",
                         label="Select cut",
                         choices= list("Fair",
                                       "Good",
                                       "Very Good",
                                       "Premium",
                                       "Ideal"),
                         selected="Ideal"),
      checkboxGroupInput("color",
                         label="Select color",
                         choices= list("E",
                                       "I",
                                       "J",
                                       "H",
                                       "F",
                                       "G",
                                       "D"),
                         selected="E")
      ),
      
    mainPanel(
      plotOutput("Plot")
    )
    )
))