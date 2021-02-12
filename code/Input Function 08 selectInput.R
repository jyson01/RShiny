
library(shiny)

ui <- fluidPage(
  selectInput(
    inputId = 'edu',
    label = '최종학력을 선택하세요.',
    choices = c('고졸', '대졸', '석사', '박사'),
    selected = '대졸',
    multiple = FALSE
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$edu)
}

shinyApp(ui = ui, server = server)


## End of Document
