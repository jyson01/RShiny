
library(shiny)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme(theme = 'slate'),
  titlePanel(title = '체질량지수(BMI) 계산기'),
  sidebarPanel(
    numericInput(
      inputId = 'wt', 
      label = '몸무게(kg)', 
      value = 77,
      min = 30,
      max = 250,
      step = 0.1
    ),
    numericInput(
      inputId = 'ht',
      label = '키(cm)',
      value = 175, 
      min = 50, 
      max = 250,
      step = 0.1
    ),
    submitButton(
      text = '제출', 
      icon = icon(name = 'submit')
    )
  ),
  mainPanel(
    h3('BMI를 확인하세요!'),
    h4('당신의 BMI가 계산되었습니다.'),
    verbatimTextOutput(outputId = 'bmi'),
    h4('당신의 체질량지수 결과는?'),
    verbatimTextOutput(outputId = 'result')
  )
)

server <- function(input, output) {
  bmi <- reactive(x = input$wt / (input$ht/100)^2)
  output$bmi <- renderPrint(expr = bmi())
  output$result <- renderPrint({
    if (bmi() >= 35) {
      '고도 비만입니다.'
    } else if (bmi() >= 30) {
      '중도 비만입니다.'
    } else if (bmi() >= 25) {
      '경도 비만입니다.'
    } else if (bmi() >= 23) {
      '과체중입니다.'
    } else if (bmi() >= 18.5) {
      '정상체중입니다.'
    } else {
      '저체중입니다.'
    }
  })
}

shinyApp(ui = ui, server = server)


## End of Document
