shinyUI(fluidPage(
  titlePanel("Occupany Rates in Berkeley"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Upload an XML file with the Census Data to get started"),
      fileInput('file', 'File Input',
                accept='.xml'),
      selectInput('neighborhood', "Choose the neighborhood to inspect", 
                  choices = list("North Berkeley", 
                                 "Rockridge",
                                 "Downtown Berkeley", 
                                 "Berkeley Hills"),
                  selected="North Berkeley"),
      sliderInput("range", "Range:",
                  min = 0, max = 40, value = c(0,40),step=4)
    ),
    mainPanel(
))))