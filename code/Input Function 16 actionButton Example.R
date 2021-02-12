
library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = 'size', 
    label = '샘플 크기', 
    min = 0, 
    max = 10000, 
    value = 5000
    ),
  actionButton(
    inputId = 'do', 
    label = '클릭하세요!'
  ),
  plotOutput(outputId = 'histogram')
)

server <- function(input, output) {
  output$histogram <- renderPlot({
    par(family = 'NanumGothic')
    input$do
    isolate(expr = {
      data <- rnorm(n = input$size)
      breaks <- seq(from = -5, to = 5, by = 0.1)
      hist(
        x = data,
        breaks = breaks,
        col = 'skyblue',
        freq = FALSE,
        main = '히스토그램',
        xlab = NULL
      )
    })
  })
}

shinyApp(ui = ui, server = server)


## End of Document
