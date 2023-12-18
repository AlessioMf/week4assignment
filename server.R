# server.R
library(shiny)

shinyServer(function(input, output) {
  
  # Reactive computation based on input
  output$result_output <- renderText({
    req(input$number_input)  # Require input to be present
    input_number <- as.numeric(input$number_input)
    
    if (!is.na(input_number)) {
      # Perform selected operation (square, cube, double)
      result <- switch(input$operation,
                       "Square" = input_number^2,
                       "Cube" = input_number^3,
                       "Double" = input_number * 2)
      
      # Additional operations based on checkboxes
      if ("Reverse" %in% input$additional_ops) {
        result <- paste("Reversed:", paste(rev(strsplit(as.character(result), "")[[1]]), collapse = ""))
      }
      if ("Absolute Value" %in% input$additional_ops) {
        result <- paste("Absolute Value:", abs(result))
      }
      
      return(paste("The result of operations:", result))
    } else {
      return("Please enter a valid number.")
    }
  })
})
