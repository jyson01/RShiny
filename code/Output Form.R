
library(shiny)

ui <- fluidPage(
  sidebarPanel(),
  mainPanel(textOutput(outputId = 'id'))
)

server <- function(input, output) {
  output$id <- renderText(expr = input$id)
}

shinyApp(ui = ui, server = server)


## End of Document
