
library(shiny)

ui <- fluidPage(
  textAreaInput(
    inputId = 'intro',
    label = h3('자기소개 부탁합니다.'),
    value = '',
    rows = 3,
    placeholder = '간단하게 작성해주세요.'
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$intro)
}

shinyApp(ui = ui, server = server)


## End of Document
