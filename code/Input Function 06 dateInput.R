
library(shiny)

ui <- fluidPage(
  dateInput(
    inputId = 'birth',
    label = '생일을 입력하세요.',
    value = '2000-01-01',
    min = '1900-01-01',
    max = Sys.Date()
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = {
    as.character(x = input$birth)
  })
}

shinyApp(ui = ui, server = server)


## End of Document
