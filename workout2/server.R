library(ggplot2)
library(shiny)
library(reshape)

server <- function(input, output) {
  #graph
  output$plot <- renderPlot({
    #create dataframe
    year <- 0:input$y
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    for(i in year) {
      no_contrib[i+1] = input$initial*(1+input$r/100)^i
      fixed_contrib[i+1] <- input$initial*(1+input$r/100)^i + input$contri*(((1+input$r/100)^i)-1)/(input$r/100)
      growing_contrib[i+1] <- input$initial*(1+input$r/100)^i + input$contri*(((1+input$r/100)^i - (1+input$g/100)^i)/(input$r/100-input$g/100))
    }
    balances <- data.frame("year"= year, "no_contrib" = no_contrib, "fixed_contrib" = fixed_contrib, "growing_contrib" = growing_contrib)
    balances_m <- melt(balances, id.vars = "year", measure.vars=c("no_contrib", "fixed_contrib", "growing_contrib"))
    
    if(input$f == 1) {
      ggplot(balances_m, aes(year, value, color = variable)) + 
        geom_point() +
        geom_line() +
        xlab("years") +
        ylab("return") +
        scale_x_discrete(name = "years", limits = c(0:input$y)) +
        ggtitle("Investing Modalities") +
        theme_bw() +
        geom_area(aes(fill = variable, alpha=0.1)) +
        facet_wrap(~variable)
    } else {
      ggplot(balances_m, aes(year, value, color = variable)) + 
        geom_point() +
        geom_line() +
        xlab("years") +
        ylab("return") +
        scale_x_discrete(name = "years", limits = c(0:input$y)) +
        ggtitle("Investing Modalities") +
        theme_bw()
    }
  })
  
  #table
  output$table <- renderTable({
    year <- 0:input$y
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    for(i in year) {
      no_contrib[i+1] = input$initial*(1+input$r/100)^i
      fixed_contrib[i+1] <- input$initial*(1+input$r/100)^i + input$contri*(((1+input$r/100)^i)-1)/(input$r/100)
      growing_contrib[i+1] <- input$initial*(1+input$r/100)^i + input$contri*(((1+input$r/100)^i - (1+input$g/100)^i)/(input$r/100-input$g/100))
    }
    balances <- data.frame("year"= year, "no_contrib" = no_contrib, "fixed_contrib" = fixed_contrib, "growing_contrib" = growing_contrib)
  })
  
}