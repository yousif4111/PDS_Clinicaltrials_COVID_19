


guideIU <- function(id) {
  ns <- NS(id)
  fluidPage(use_gotop(src = "fas fa-chevron-circle-up",color = "#000AFF",opacity = 0.8,width = 100,appear = 100),style = "background-image: url(https://cdn.wallpapersafari.com/2/45/JM85YC.jpg); background-size: cover;background-attachment: fixed;background-position: center;background-repeat: no-repeat;",
            fluidRow(style = "background-color:#291F33;",
              br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
              aos(
                element = 
                  div(align = "center",br(),br(),br(),br(),
                      h3(style="font-family: Arial ; font-weight: 900; color:#BE9FF6   ; font-size: 50px ","SHINY APP USER GUIDE"),
                      #line
                      column(width = 4,offset = 4,
                             h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #BE9FF6  "))
                  ), 
                animation = "fade-up", 
                duration = "2000"),
              br(),br(),br(),
              div(align = "center",
                  #pLAC TO WRITE
              ),br(),br(),br(),br(),br(),br(),br(),
              #Introo
              
              # second map
              
            ),
            
            fluidRow(
                     aos(
                       element = div(
                                     
                                     column(width=8,offset=2,style = "background-color:#291F33;",br(),br(),br(),br(),br(),br(),br(),br(),column(width = 10,offset = 1,h1(style="font-family: -- ;font-style: --; color: #ECE4FB; font-size: 25px;text-align: justify; ","The app is designed based on Different pages, each page shows the app analysis about the global COVID-19 studies, you can access each page from the dialog on the top of the app:",br(),br(),br(),img(src="images/d-i.png",style="width: 600px"),br(),br(),br(),br(),))
                                            )
                                     
                       ),
                       animation = "fade-up",
                       duration = "1500"
                     ),
                     
                     
                     
            ),
            fluidRow(
              aos(
                element = div(
                  
                  column(width=8,offset=2,style = "background-color:#291F33;",br(),br(),br(),br(),br(),br(),br(),br(),column(width = 10,offset = 1,h3(style="font-family: Arial ; font-weight: 900; color:#BE9FF6   ; font-size: 32px ","FIRST PAGE HOME"),br(),br(),br(),
                                                                                                                             h1(style="font-family: -- ;font-style: --; color: #ECE4FB; font-size: 25px;text-align: justify; ","This page contain information about the app and its objectives, data source , analysis approaches, and background about the medical studies such as study type and phase study that has been analyzed in the app.",br(),br(),br(),img(src="images/h-i.png",style="width: 600px"),br(),br(),br(),br(),))
                  )
                  
                ),
                animation = "fade-up",
                duration = "1500"
              ),
              
              
              
            ),
            fluidRow(
              aos(
                element = div(
                  
                  column(width=8,offset=2,style = "background-color:#291F33;",br(),br(),br(),br(),br(),br(),br(),br(),column(width = 10,offset = 1,h3(style="font-family: Arial ; font-weight: 900; color:#BE9FF6   ; font-size: 32px ","SECOND AND THIRD PAGES MAPS"),br(),br(),br(),
                                                                                                                             h1(style="font-family: -- ;font-style: --; color: #ECE4FB; font-size: 25px;text-align: justify; ","These two pages contain world map design to help user track global COVID-19 Studies Depending on the Study type, Phase, and Drug. The Map work by hoovering the courser on the top of the blue countries and it will show the information available from each country according to the data we have analyzed:",br(),br(),br(),img(src="images/m-i.png",style="width: 600px"),br(),br(),br(),"In addition, third page contain more sophisticate search Tables about the drug which help the you find certain drug and the study associated with it."))
                  )
                  
                ),
                animation = "fade-up",
                duration = "1500"
              ),
              
              
              
            ),
            #------------------------
            #Analytic Page
            fluidRow(
              aos(
                element = div(
                  
                  column(width=8,offset=2,style = "background-color:#291F33;",br(),br(),br(),br(),br(),br(),br(),br(),column(width = 10,offset = 1,h3(style="font-family: Arial ; font-weight: 900; color:#BE9FF6   ; font-size: 32px ","FOURTH PAGE ANALYTIC"),br(),br(),br(),
                                                                                                                             h1(style="font-family: -- ;font-style: --; color: #ECE4FB; font-size: 25px;text-align: justify; ","The page contains 10 Descriptive analysis outcomes plots, each graph was designed answering a question about the data:",br(),br(),br(),img(src="images/aa-i.png",style="width: 600px"),br(),br(),br(),br(),))
                  )
                  
                ),
                animation = "fade-up",
                duration = "1500"
              ),
              
              
              
            ),
            fluidRow(
              aos(
                element = div(
                  
                  column(width=8,offset=2,style = "background-color:#291F33;",br(),br(),br(),br(),br(),br(),br(),br(),column(width = 10,offset = 1,h3(style="font-family: Arial ; font-weight: 900; color:#BE9FF6   ; font-size: 32px ","FIFTH PAGE STUDY SEARCH"),br(),br(),br(),
                                                                                                                             h1(style="font-family: -- ;font-style: --; color: #ECE4FB; font-size: 25px;text-align: justify; ","It contains Search table of the data which can help the user lock for any study depending on the search terminology. The result search will show most similar studies and the link to U.S National Library of Medicine Organization page about the study.",br(),br(),br(),img(src="images/s-i.png",style="width: 600px"),br(),br(),br(),br(),))
                  )
                  
                ),
                animation = "fade-up",
                duration = "1500"
              ),
              
              
              
            ),
            fluidRow(
              aos(
                element = div(
                  
                  column(width=8,offset=2,style = "background-color:#291F33;",br(),br(),br(),br(),br(),br(),br(),br(),column(width = 10,offset = 1,h3(style="font-family: Arial ; font-weight: 900; color:#BE9FF6   ; font-size: 32px ","PRESENTATION VIDEO"),br(),br(),br(),
                                                                                                                             HTML('<iframe width="720" height="360" src="https://www.youtube.com/embed/JDzk9nwaE9s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',br(),br(),br(),br(),))
                  )
                  
                ),
                animation = "fade-up",
                duration = "1500"
              ),
              
              
              
            ),
            fluidRow(
              aos(
                element = div(
                  
                  column(width=8,offset=2,style = "background-color:#291F33;",br(),br(),br(),br(),br(),br(),br(),br(),column(width = 10,offset = 1,h3(style="font-family: Arial ; font-weight: 900; color:#BE9FF6   ; font-size: 32px ","App LINKS"),br(),
                                                                                                                             tags$a(style="font-family: -- ;font-style: --; color: #5559FF; font-size: 32px;text-align: justify; ",href="https://rpubs.com/alvin855/groupm", 
                                                                                                                                    "Rpub"),br(),br(),tags$a(style="font-family: -- ;font-style: --; color: #5559FF; font-size: 32px;text-align: justify; ",href="https://github.com/yousif4111/PDS_Clinicaltrials_COVID_19", 
                                                                                                                                                             "GitHub"),br(),br(),tags$a(style="font-family: -- ;font-style: --; color: #5559FF; font-size: 32px;text-align: justify; ",href="https://clinicaltrials.gov/", 
                                                                                                                                                                                        "NIH"),br(),br(),br(),br(),)
                  )
                  
                ),
                animation = "fade-up",
                duration = "1500"
              ),

              
              
              
            )
  )
}




