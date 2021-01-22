aboutUsUI <- function(id) {
    ns <- NS(id)
    fluidPage(style = "background-color:#1D1F28 ;background-size: cover;",
              fluidRow(
                  br(),br(),br(),br(),br(),br(),br(),
                  aos(
                      element = 
                          div(align = "center",
                              h3(style="font-family: Arial ; font-weight: 900; color: #6467D3 ; font-size: 30px ","TEAM MEMBERS"),
                              h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 20px;","AKA CEOs AND OWNERS OF THIS APP :)",),
                              #line
                              column(width = 4,offset = 4,
                                     h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
                          ), 
                      animation = "fade-up", 
                      duration = "2000"),
                  br(),br(),br(),
                  # IMaggee
                  fluidRow(
                      column(width = 2,offset = 1,
                             aos(
                                 element =div(h3(style="color: #6467D3; font-weight: bold;font-size: 15px;","Big Boss"),
                                              h3(style="color: #DDD8F0; font-weight: bold;font-size: 15px;","Goh Chin Teck (Alvin) (S2021006)"),
                                              img(src="images/team/g-i.jpeg",style="width: 200px")
                                 ),
                                 animation = "fade-up",
                                 duration = "1500"
                             )
                      ),
                      column(width = 2,offset = 1,
                             aos(
                                 element =div(h3(style="color: #6467D3; font-weight: bold;font-size: 15px;","HR Manager"),
                                              h3(style="color: #DDD8F0; font-weight: bold;font-size: 15px;","Yousif Abdelmoniem Yousif Abdalla (17221022)"),
                                              img(src="images/team/y-i.jpeg",style="width: 200px")
                                 ),
                                 animation = "fade-up",
                                 duration = "1500"
                             )
                      ),
                      column(width = 2,offset = 1,
                             aos(
                                 element =div(h3(style="color: #6467D3; font-weight: bold;font-size: 15px;","Business Manager"),
                                              h3(style="color: #DDD8F0; font-weight: bold;font-size: 15px;"," Adedigba Stephen Olamilekan (17220137)"),
                                              img(src="images/team/s-i.jpeg",style="width: 200px")
                                 ),
                                 animation = "fade-up",
                                 duration = "1500"
                             )
                      ),
                      column(width = 2,offset = 1,
                             aos(
                                 element =div(h3(style="color: #6467D3; font-weight: bold;font-size: 15px;","Product Manager"),
                                              h3(style="color: #DDD8F0; font-weight: bold;font-size: 15px;","Asyraf Najmie Bin Abd Rahman (S2000949)"),
                                              img(src="images/team/a-i.jpeg",style="width: 200px")
                                 ),
                                 animation = "fade-up",
                                 duration = "1500"
                             )
                      )
                      
                  ),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br()
              ),
              
    ) 
}