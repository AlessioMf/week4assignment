# ui.R
library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Complex Calculator"),
  
  # Input: Textbox, Radio buttons, and Checkboxes
  sidebarLayout(
    sidebarPanel(
      textInput("number_input", "Enter a number:", value = ""),
      
      radioButtons("operation", "Select an operation:",
                   choices = c("Square", "Cube", "Double"), selected = "Square"),
      
      checkboxGroupInput("additional_ops", "Additional Operations:",
                         choices = c("Reverse", "Absolute Value"), selected = NULL)
    ),
    mainPanel(
      h4("Result:"),
      verbatimTextOutput("result_output")
    )
  )
))
