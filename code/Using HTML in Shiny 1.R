
library(shiny)

ui <- fluidPage(
  h1('가장 ', strong('큰'),  '제목입니다.'),
  h2(em('두 번째'), '로 큰 제목입니다.'),
  hr(),
  p('아래 링크를 방문해보세요.'),
  a('https://www.naver.com')
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)


## End of Document
