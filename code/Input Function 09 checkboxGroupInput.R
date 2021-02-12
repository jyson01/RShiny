
library(shiny)

ui <- fluidPage(
  checkboxGroupInput(
    inputId = 'item',
    label = '관심사항을 모두 선택하세요.',
    choices = c('R', 'Python', '통계', '머신러닝'),
    selected = 'R',
    inline = TRUE
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$item)
}

shinyApp(ui = ui, server = server)


## End of Document
