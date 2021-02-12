
library(shiny)

ui <- fluidPage(
  sidebarPanel(
    textInput(
      inputId = 'name',
      label = '이름을 입력하세요.',
      value = '홍길동'
    )
  ),
  mainPanel(
    textOutput(outputId = 'user')
  )
)

server <- function(input, output) {
  output$user <- renderText({
    str_c(input$name, '회원님!', sep = ' ')
  })
}

shinyApp(ui = ui, server = server)


## End of Document
