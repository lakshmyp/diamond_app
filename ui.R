
library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("How much will a diamond cost?"),
  
  sidebarPanel(
    helpText("Find out the average price of a diamond
             based on the size, cut and color you choose."),
    numericInput('caratmin', ' Choose minimum size in carats [0-4]', 0, min = 0, max = 4, step = 0.01),
    numericInput('caratmax', ' Choose maximum size in carats [1-5]', 1, min = 1, max = 5, step = 0.01),
    
    checkboxGroupInput("color", "Color [D-best, J-worst]", choices = c("D","E","F","G","H","I","J"), selected = "D",
                 inline = TRUE),
    
    checkboxGroupInput("cut", "Select the cut", 
                       choices = c("Fair","Good","Very Good","Premium","Ideal"),
                       selected = "Fair")
 
    ),
  
  
  mainPanel(
    tabsetPanel(
      tabPanel(
        "Results", verbatimTextOutput("Results"),
        
        mainPanel(  

          h3("Average price"),
          textOutput("price"),
          
          h4("Scatter plot of data"),
          plotOutput("plot"))),
      
      tabPanel(
        "Documentation", verbatimTextOutput("Documentation"),
        
        mainPanel(   
                p("This shiny app is mean to do a simple calculation of the average
                  price of a diamond from the diamonds dataset given user inputs
                  on various aspects of the diamond. 
        
                  "),
                
                p("The full code is available at", 
                  a("Diamond App Github", 
                          href="https://github.com/lakshmyp/diamond_app")),
                p("The pitch for this app is located at",
                  a("RPubs Pitch Deck, please select the Shiny Diamonds document",
                    href = "http://rpubs.com/lakshmyp")),
                p("Created by Lakshmy Priya, 26 Feb 2016")
                
                ))
      
      )
    )
  ))
