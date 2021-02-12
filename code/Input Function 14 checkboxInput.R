
library(shiny)

ui <- fluidPage(
  checkboxInput(
    inputId = 'agree', 
    label = '개인정보 활용에 동의합니다.', 
    value = FALSE
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$agree)
}

shinyApp(ui = ui, server = server)


## End of Document
