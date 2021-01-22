

u_data<-read.csv('data/unprocessed_data/COVID_19_CCT.csv')

dataUI <- function(id) {
    ns <- NS(id)
    fluidPage(style = "background-color:#1D1F28 ;background-size: cover;",
              fluidRow(
                  br(),br(),br(),br(),br(),br(),br(),
                  aos(
                      element = 
                          div(align = "center",
                              h3(style="font-family: Arial ; font-weight: 900; color: #6467D3 ; font-size: 30px ","STUDY SEARCH"),
                              h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 20px;","Search for Ths Study with link to NIH Page",),
                              #line
                              column(width = 4,offset = 4,
                                     h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
                          ), 
                      animation = "fade-up", 
                      duration = "2000"),
                  br(),br(),br(),
                  div(style = "background-color:#8473DA",align = "center",
                      dataTableOutput(ns('rowData'),width = "65%")
                  ),br(),br(),br(),br()
              ),
              
    ) 
    
}

#----------------------------(Backend code)
# Module server function
dataServer<-function(id, stringsAsFactors) {
    moduleServer(
        id,
        ## Below is the module function
        function(input, output,session) {
            output$rowData<-renderDataTable({
                
                u_data[,c(3,27)]
                
            })
            
})}