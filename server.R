# server.R

#install.packages(c("shiny" ,  "mapproj" , 'ggmap'))
library(shiny)
library(mapproj)
library(ggmap)
source("helpers.R")
quakes <- readRDS("data/quakes.rds")

shinyServer(

  function(input, output) {

    output$map <- renderPlot({

      fiji <- get_map(location = c(178 , -18), zoom = as.numeric(input$zoomFac) )
      
      p <- ggmap(fiji) +
           #geom_point(data=selected_quakes, mapping=aes(x=selected_quakes$long, y=selected_quakes$lat, color=selected_quakes$depth ))
           geom_point(data=subset(quakes, mag <= input$range ), mapping=aes(x=long, y=lat, color=mag )) +
           scale_color_gradient(low="darkred", high="red") +
           labs(x = 'Longitude', y = 'Latitude') + 
           ggtitle(paste('Fiji Earthquakes magnitude from 0 to' , input$range )) +
           theme(plot.title = element_text( face="bold" , size = 20))
      print(p)
     
    })
    
    output$text1 <- renderText({ 
      paste(" Number of earthquake events displayed:" , nrow(subset(quakes, mag <= input$range ))          )
    })

  }
)
