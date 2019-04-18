library(shiny)
library(ggplot2)
library(reshape)


ui <- fluidPage(
  titlePanel("Investing Modalities"),
  fluidRow(
    column(4, 
          sliderInput("initial", "Initial Amount",
                      min = 0, max = 100000, value = 1000, step = 500),
          sliderInput("contri", "Annual Contribution",
                      min = 0, max = 50000, value = 2000, step = 500)
    ),
    column(4, 
           sliderInput("r", "Return Rate (in %)",
                       min = 0, max = 20, value = 5, step = 0.1),
           sliderInput("g", "Growth Rate (in %)",
                       min = 0, max = 20, value = 2, step = 0.1)
    ),
    column(4, 
           sliderInput("y", "Years",
                       min = 0, max = 50, value = 20, step = 1),
           selectInput("f", "Facet", choices = list("Yes"=1, "No"=2), selected = 2)
    )
  ),
  fluidRow(
    mainPanel(
      h4("Timelines"),
      plotOutput("plot"),
      h4("Balances"),
      tableOutput("table")
    )
  )
)

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
shinyApp(ui = ui, server = server)

