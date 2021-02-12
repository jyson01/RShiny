
library(shiny)

ui <- fluidPage(
  titlePanel(title = '데이터셋 살펴보기'),
  sidebarPanel(
    selectInput(
      inputId = 'dataset',
      label = '데이터셋', 
      choices = ls(name = 'package:datasets')
    )
  ),
  mainPanel(
    verbatimTextOutput(outputId = 'summary'),
    tableOutput(outputId = 'table')
  )
)

server <- function(input, output) {
  dataset <- reactive(
    get(x = input$dataset, pos = 'package:datasets')
  )
  output$summary <- renderPrint(summary(object = dataset()))
  output$table <- renderTable(dataset())
}

shinyApp(ui = ui, server = server)


## End of Document
