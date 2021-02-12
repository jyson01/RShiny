
library(shiny)

ui <- fluidPage(
  sidebarPanel(
    sliderInput(
      inputId = 'size',
      label = '샘플 크기를 입력하세요.',
      value = 1000,
      min = 100,
      max = 10000,
      step = 100
    )
  ),
  mainPanel(
    plotOutput(
      outputId = 'histogram', 
      width = '100%',
      height = '400px'
    )
  )
)

server <- function(input, output) {
  output$histogram <- renderPlot({
    heights <- rnorm(
      n = input$size, 
      mean = 175.6, 
      sd = 5.3
    )
    hist(
      x = heights, 
      breaks = 30, 
      col = 'skyblue', 
      border = 'gray50'
    )
  })
}

shinyApp(ui = ui, server = server)


## End of Document
