
library(shiny)

ui <- fluidPage(
  
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$id)
}

shinyApp(ui = ui, server = server)


## End of Document
