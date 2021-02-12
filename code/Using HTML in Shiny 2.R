
library(shiny)

ui <- fluidPage(
  HTML('<h1><q>가장 큰 제목</q> 글자 <b>굵게</b></h1>'),
  HTML('<h2 style="color:darkred"><i>글자색</i> 설정</h2>'),
  HTML('<p style="font-family:Batang"><u>폰트</u> 설정</p>'),
  HTML('<p style="text-align:center"><mark>가운데</mark> 정렬</p>'),
  HTML('<a href="https://www.naver.com">네이버</a>')
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)


## End of Document
