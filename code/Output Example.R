
library(shiny)
library(tidyverse)

ui <- fluidPage(
  titlePanel(title = '회원가입 신청서'),
  sidebarPanel(
    textInput(
      inputId = 'name',
      label = '이름을 입력하세요.',
      value = '홍길동'
    ),
    passwordInput(
      inputId = 'pw', 
      label = '비밀번호를 입력하세요.',
      value = '',
      placeholder = '영문과 숫자 8자리입니다.'
    ),
    textAreaInput(
      inputId = 'intro', 
      label = h3('자기소개 부탁합니다.'), 
      value = '',
      rows = 3,
      placeholder = '간단하게 작성해주세요.'
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
    dateRangeInput(
      inputId = 'period',
      label = '기간을 선택하세요.',
      start = Sys.Date() - 10,
      end = Sys.Date(),
      startview = 'year'
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
    ),
    fileInput(
      inputId = 'file', 
      label = '이력서를 첨부해주세요.', 
      accept = c('.csv', '.txt'),
      buttonLabel = '찾아보기',
      placeholder = '아직 파일이 선택되지 않았습니다!'
    ),
    varSelectInput(
      inputId = 'vars', 
      label = '컬럼을 선택하세요.', 
      data = iris, 
      selected = 'Sepal.Length',
      multiple = FALSE
    ),
    submitButton(
      text = '변경사항을 적용합니다.',
      icon = icon(name = 'refresh')
    ),
    helpText('입력값을 업데이트합니다.'),
    checkboxInput(
      inputId = 'agree', 
      label = '개인정보 활용에 동의합니다.', 
      value = FALSE
    )
  ),
  mainPanel(
    textOutput(outputId = 'user'),
    verbatimTextOutput(outputId = 'height'),
    tableOutput(outputId = 'profile'),
    plotOutput(outputId = 'boxplot', width = '60%')
  )
)

server <- function(input, output) {
  output$user <- renderText({
    str_c(
      input$name,
      '회원님!',
      sep = ' '
    )
  })
  output$height <- renderPrint({
    cat(
      '회원님의 키는',
      input$ht,
      'cm입니다!'
    )
  })
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
  output$boxplot <- renderPlot({
    ggplot(
      data = iris,
      mapping = aes(y = !!input$vars)
    ) +
      geom_boxplot() + 
      theme_bw()
  })
}

shinyApp(ui = ui, server = server)


## End of Document
