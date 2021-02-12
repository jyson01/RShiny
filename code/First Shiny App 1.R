
library(shiny)

ui <- fluidPage(
  titlePanel(title = '첫 번째 앱'),
  'Hello, Data Science!'
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)


## End of Document
