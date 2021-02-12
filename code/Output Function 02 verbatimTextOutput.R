
library(shiny)

ui <- fluidPage(
  sidebarPanel(
    numericInput(
      inputId = 'ht',
      label = h4('키(cm)를 입력하세요.'),
      value = 175.6,
      min = 100,
      max = 250,
      step = 0.1
    )
  ),
  mainPanel(
    verbatimTextOutput(outputId = 'height')
  )
)

server <- function(input, output) {
  output$height <- renderPrint({
    cat('회원님의 키는', input$ht, '입니다!')
  })
}

shinyApp(ui = ui, server = server)


## End of Document
