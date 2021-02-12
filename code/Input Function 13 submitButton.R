
library(shiny)

ui <- fluidPage(
  varSelectInput(
    inputId = 'vars',
    label = '컬럼을 선택하세요.',
    data = iris,
    selected = 'Sepal.Length',
    multiple = FALSE
  ),
  verbatimTextOutput(outputId = 'value'),
  submitButton(
    text = '변경사항을 적용합니다.',
    icon = icon(name = 'refresh')
  ),
  helpText('입력값을 업데이트합니다.'),
)

server <- function(input, output) {
  output$value <- renderText(expr = input$vars)
}

shinyApp(ui = ui, server = server)


## End of Document
