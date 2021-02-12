
library(shiny)

ui <- fluidPage(
  passwordInput(
    inputId = 'pw',
    label = '비밀번호를 입력하세요.',
    value = '',
    placeholder = '영문과 숫자 8자리입니다.'
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$pw)
}

shinyApp(ui = ui, server = server)


## End of Document
