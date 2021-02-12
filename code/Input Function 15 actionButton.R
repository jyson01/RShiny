
library(shiny)

ui <- fluidPage(
  actionButton(
    inputId = 'do', 
    label = '클릭하세요!'
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$do)
}

shinyApp(ui = ui, server = server)


## End of Document
