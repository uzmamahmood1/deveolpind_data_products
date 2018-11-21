
library(shiny)
shinyUI(fluidPage(
  titlePanel("Predicting fertility based on some parameters"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("SliderEducation",
                  "What percentage of population educated beyond primary scool",
                  min = 1,
                  max = 53,
                  value = 8),
      checkboxInput('ShowModel1', 'Show/Hide Model1',value = TRUE),
      checkboxInput('ShowModel2', 'Show/Hide Model2',value = TRUE)
    ),
    #Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot1"),
      h3('Predicted Fertility from model1'),
      textOutput('pred1'),
      h3('Predicted Fertility from model2'),
      textOutput('pred2')
    )
  )
))
