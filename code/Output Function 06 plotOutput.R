
library(shiny)
library(tidyverse)

ui <- fluidPage(
  sidebarPanel(
    varSelectInput(
      inputId = 'vars',
      label = '컬럼을 선택하세요.',
      data = iris,
      selected = 'Sepal.Length',
      multiple = FALSE
    )
  ),
  mainPanel(
    plotOutput(
      outputId = 'boxplot', 
      width = '100%',
      height = '400px'
    )
  )
)

server <- function(input, output) {
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
