#swissdata
library(shiny)

shinyServer(function(input, output) {
  
  head(swiss)
  model1 <- lm(Fertility~ Education ,data=swiss)
  model2 <- lm(Fertility~Agriculture,data=swiss)
  model1pred <- reactive({
    popInput <- input$SliderEducation
    predict(model1,newdata = data.frame(Education=popInput))
    
    
  })
  model2pred <- reactive({
   popInput <- input$SliderEducation
  predict(model2,newdata = data.frame(Agriculture=popInput))
  
  
   })
  
  output$plot1 <- renderPlot({
    popInput <- input$SliderEducation
    plot(swiss$Education,swiss$Fertility,xlab = 'educated population',ylab = 'Fertility',bty='n',pch=16,col='blue')
    if(input$ShowModel1){
      abline(model1,col='red',lwd=2)
    }
    
    if(input$ShowModel2){
     abline(model2,col='red',lwd=2)
    }
    
    
    points(popInput,model1pred(),col='red',pch=16,cex=2)
    ##points(popInput,model2pred(),col='blue',pch=16,cex=2)
    
  })
  output$pred1 <- renderText({
    model1pred()
  })
   output$pred2 <- renderText({
   model2pred()
  })
  
})
