
library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = 'age',
    label = '나이를 입력하세요.',
    value = 25,
    min = 1,
    max = 120,
    step = 1
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$age)
}

shinyApp(ui = ui, server = server)


## End of Document
