library(shiny)

library(plotly)

df<-ToothGrowth
df
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$hist <- renderPlot({
        df<-df[which(df$supp==input$supp & df$dose==input$doses), ]
         hist(df$len,xlab = "Tooth Length",col = "yellow", main="Histogram")
 
    })     
       
   output$bar <- renderPlotly({
        
      df <- df[ which(df$supp ==input$supp & df$dose==input$doses), ]
      y <- list(title = "Tooth Length")
      x<-list(title="Observation Count")
     
       fig<-plot_ly(y=~df$len, type = 'bar',
                mode = 'markers',color="orange")
       fig <- fig %>% layout(xaxis = x, yaxis = y)      
      fig        
        
    })

})
