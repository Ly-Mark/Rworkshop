#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output) {
  
  # Reactive function to generate scatter plot based on selected country
  
  country_data <- reactive({

    country_travel <- travel_full_clean_subset %>%
      filter(country_code==paste(input$country) ) %>%
      select(c("1995":"2020")) %>%
      gather() %>%
      rename(years= key,
             arrivals= value)
    
    
    # Generate scatter plot
    plot(country_travel$years, country_travel$arrivals/100000,
         main="Number of Travellers from 1995 to 2020",
         xlab="Years",
         ylab="Number of arrivals (x100,000)") 
  })

    
    # Output scatter plot
    output$scatterplot <- renderPlot({
      country_data()

    })

}
