
library(shiny)

ui <- fluidPage(
  radioButtons(
    inputId = 'major',
    label = '전공을 선택하세요.',
    choices = c('통계학', '산업공학', '컴퓨터공학', '기타'),
    selected = NULL,
    inline = FALSE
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$major)
}

shinyApp(ui = ui, server = server)


## End of Document
