# ui.R

shinyUI(fluidPage(
    titlePanel("Fiji Earthquakes"),

    sidebarLayout(
        sidebarPanel(
        
             helpText("Investigate seismic activity around Fiji by 
                       selecting the maximum earthquake magnitude."),
      
             sliderInput("range", 
                          label = "Maximum Magnitude:",
                          min = 4, max = 6, value = 4.5 , step = 0.5),
             
             selectInput(inputId = "zoomFac",
                         label = "Zoom factor:",
                         choices = c(3, 4 , 5 , 6 , 7 , 8 , 9 , 10 ),
                         selected = 5)
             ),
    
    mainPanel(
        plotOutput("map"),
        h5(textOutput("text1") , align = 'center' , style = "color:red")
    )
    )
))
