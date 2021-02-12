
library(shiny)

ui <- fluidPage(
  fileInput(
    inputId = 'file',
    label = '이력서를 첨부해주세요.',
    accept = c('.csv', '.txt'),
    buttonLabel = '찾아보기', 
    placeholder = '아직 파일이 선택되지 않았습니다!'
  ),
  verbatimTextOutput(outputId = 'value')
)

server <- function(input, output) {
  output$value <- renderText(expr = input$file$datapath)
}

shinyApp(ui = ui, server = server)


## End of Document
