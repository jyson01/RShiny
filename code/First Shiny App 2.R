
library(shiny)

ui <- fluidPage(
  titlePanel(title = '데이터셋 살펴보기'),
  selectInput(
    inputId = 'dataset',
    label = '데이터셋', 
    choices = ls(name = 'package:datasets')
  ),
  verbatimTextOutput(outputId = 'summary'),
  tableOutput(outputId = 'table')
)

server <- function(input, output) {
  output$summary <- renderPrint({
    dataset <- get(x = input$dataset, pos = 'package:datasets')
    summary(object = dataset)
  })
  output$table <- renderTable({
    dataset <- get(x = input$dataset, pos = 'package:datasets')
    dataset
  })
}

shinyApp(ui = ui, server = server)


## End of Document
