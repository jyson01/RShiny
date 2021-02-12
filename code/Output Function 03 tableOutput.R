
library(shiny)

ui <- fluidPage(
  sidebarPanel(
    textInput(
      inputId = 'name',
      label = '이름을 입력하세요.',
      value = '홍길동'
    ),
    numericInput(
      inputId = 'ht', 
      label = h4('키(cm)를 입력하세요.'), 
      value = 175.6, 
      min = 100, 
      max = 200,
      step = 0.1
    ),
    sliderInput(
      inputId = 'age', 
      label = '나이를 입력하세요.', 
      value = 25, 
      min = 1, 
      max = 120,
      step = 1
    ),
    dateInput(
      inputId = 'birth',
      label = '생일을 입력하세요.',
      value = '2000-01-01',
      min = '1900-01-01',
      max = Sys.Date()
    ),
    selectInput(
      inputId = 'edu', 
      label = '최종학력을 선택하세요.', 
      choices = c('고졸', '대졸', '석사', '박사'), 
      selected = '대졸', 
      multiple = FALSE
    ),
    checkboxGroupInput(
      inputId = 'item', 
      label = '관심사항을 모두 선택하세요.', 
      choices = c('R', 'Python', '통계', '머신러닝'),
      selected = 'R',
      inline = TRUE
    ),
    radioButtons(
      inputId = 'major',
      label = '전공을 선택하세요.',
      choices = c('통계학', '산업공학', '컴퓨터공학', '기타'),
      selected = NULL,
      inline = FALSE
    )
  ),
  mainPanel(
    tableOutput(outputId = 'profile')
  )
)

server <- function(input, output) {
  output$profile <- renderTable({
    data.frame(
      이름 = input$name, 
      신장 = input$ht, 
      나이 = input$age,
      생일 = as.character(x = input$birth),
      학력 = input$edu,
      선호 = str_c(input$item, collapse = ', '),
      전공 = input$major
    )
  })
}

shinyApp(ui = ui, server = server)


## End of Document
