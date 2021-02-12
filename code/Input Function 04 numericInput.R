
library(shiny)

ui <- fluidPage(
  numericInput(
    inputId = 'ht',
    label = h4('키(cm)를 입력하세요.'),
    value = 175.6,
    min = 100,
    max = 200,
    step = 0.1
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$ht)
}

shinyApp(ui = ui, server = server)


## End of Document
