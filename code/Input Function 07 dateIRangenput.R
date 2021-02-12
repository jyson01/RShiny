
library(shiny)

ui <- fluidPage(
  dateRangeInput(
    inputId = 'period',
    label = '기간을 선택하세요.',
    start = Sys.Date() - 10,
    end = Sys.Date(),
    startview = 'year'
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = {
    as.character(x = input$period)
  })
}

shinyApp(ui = ui, server = server)


## End of Document
