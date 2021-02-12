
library(shiny)
library(tidyverse)

ui <- fluidPage(
  sidebarPanel(
    selectInput(
      inputId = 'dataset',
      label = '데이터셋', 
      choices = ls(name = 'package:datasets')
    )
  ),
  mainPanel(
    DT::dataTableOutput(outputId = 'dataTable')
  )
)

server <- function(input, output) {
  output$dataTable <- DT::renderDataTable({
    get(x = input$dataset, pos = 'package:datasets') %>% 
      as.data.frame()
  })
}

shinyApp(ui = ui, server = server)


## End of Document
