
library(shiny)

ui <- fluidPage(
  textInput(
    inputId = 'name',
    label = '이름을 입력하세요.',
    value = '홍길동'
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$name)
}

shinyApp(ui = ui, server = server)


## End of Document
