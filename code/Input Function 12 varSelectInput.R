
library(shiny)

ui <- fluidPage(
  varSelectInput(
    inputId = 'vars',
    label = '컬럼을 선택하세요.',
    data = iris,
    selected = 'Sepal.Length',
    multiple = FALSE
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$vars)
}

shinyApp(ui = ui, server = server)


## End of Document
