#Produce the R code(In an R script file) that will produce the interactive shiny app shown below. The 
#histogram and the boxplot are Reactive and controlled by the select input box Iris variables.

library(shiny)
library(shinyWidgets)
library(tidyverse)

ui <- fluidPage(
  setBackgroundColor("yellow"),
  titlePanel("Abigail Tata"),
  titlePanel("Final exam shiny app iris data"),
  selectInput("irisvariable", "Iris Variables", choices = names(iris)),
  plotOutput("hist"),
  plotOutput("boxplot"),
  verbatimTextOutput("irissummary")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    ggplot(iris, aes(x = .data[[input$irisvariable]])) +
      geom_histogram(color= "red", fill="blue")
  })
  output$boxplot <- renderPlot({
    ggplot(iris, aes(x = .data[[input$irisvariable]]))+
      geom_boxplot(color= "blue", fill="red")
  })
output$irissummary <- renderPrint({
  summary((iris))
})

}
shinyApp(ui = ui, server = server)


