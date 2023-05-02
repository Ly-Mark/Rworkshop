#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


countries <- factor(unique(travel_full_clean_subset$country_code))

ui <- fluidPage(
  titlePanel("Arrivals"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create a plot with arrival
               information from 1995 - 2020 from the World Bank."),
      
      selectInput("country", 
                  label = "Choose a country to display",
                  choices = countries,
                  selected = "ALB"),
    ),
    
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)
