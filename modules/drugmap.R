



folderloc = 'PDS_Clinicaltrials_COVID_19-main//'
folderloc = ''

# -----------------------------------------------------
# Pulling all the dataset
drugdata <- read.csv(paste(folderloc,"data//drugdata//MyCleanData.csv",sep=''))
drugdata <- drugdata[ (drugdata$Drugonly != "") , ]

print( names(drugdata) )


listofdrug <-read.csv(paste(folderloc,'data//drugdata//listofdrug.csv',sep=''))
listofcountry <-read.csv(paste(folderloc,'data//drugdata//listofcountry.csv',sep=''))

# -------------------------------------------------------
# Preparing the map

# Pulling map data
countries<-shapefile(paste(folderloc,'data//countries_border_for_map//World_Countries__Generalized_.shp',sep=''))

# compare the country sequence of map and data
mapseq = countries$COUNTRY
drugseq = listofcountry$countryname

# Pull the top 30 country supported by the map.
unionseq = c()
for (i in drugseq) {
  if (i %in% mapseq) { unionseq = c( unionseq,i ) }
}
unionseq = head(unionseq,30)

# make the mapseq and drugseq be indexed of the row so that it match
mapseq = unlist( map(unionseq, function(x) match(x,mapseq)  )  )
drugseq = unlist( map(unionseq, function(x) match(x,drugseq)  )  )

# Set map parameter
drughc<-c('#000A41','#001273','#001CB1')
bins<-c(6,50,100,1000)

# Prepare only 30 countries for mapping.
drugwc <- countries[mapseq,]
t30 <- listofcountry[drugseq,]

# Prepare the label to be presented.
druglab <-paste("<p> <b>",t30$countryname,
            "</b><br> Drug Study Count = ",t30$studycount,
            " <br> Top Drug = ",gsub('|',', ',t30$topdrug,fixed=TRUE),"</p>")

# Prepare the colour rendering.
drugpal<-colorBin(palette =drughc,domain = t30$studycount,bins = bins)

# ----------------------------------------------------------------------------
A = head(drugdata[, c('Title','Interventions','Locations','MapCountry','Drugonly','URL') ] ,3 )
print(A)


drugUI <- function(id) {
  ns <- NS(id)
  fluidPage(style = "background-color:#1D1F28 ;background-size: cover;",
    #map section
    fluidRow(
       br(),br(),br(),
       # First row.
       aos(
         element = 
           div(align = "center",
               h3(style="font-family: Arial ; font-weight: 900; color: #6467D3 ; font-size: 30px ","INTERACTIVE WORLD MAP"),
               h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 50px;","Top 30 COVID-19 Drug Studies",),
               #line
               column(width = 4,offset = 4,
               h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
               ), 
         animation = "fade-up", 
         duration = "2000"),
       br(),br(),br(),
       div(align = "center",
           leafletOutput(ns('drugMap'),width = "65%",height = "450px")
       ),br(),br(),br(),br()
       
       # Second row.
       ,aos( element = 
           div(align = "center",
               h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 50px;","Top Countries by drug study counts.",),
               #line
               column(width = 4,offset = 4,
                      h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
           ), 
         animation = "fade-up", 
         duration = "2000"), br(),br(),
         div(style = "background-color:#8473DA",align = "center", dataTableOutput(ns('countrytable'),width = "65%")
         ), br(),br(),br(),br()
       
       # Third row.
       ,aos( element = 
           div(align = "center",
               h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 50px;","Top Drugs by drug study counts.",),
               #line
               column(width = 4,offset = 4,
                      h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
           ), 
         animation = "fade-up", 
         duration = "2000"), br(),br(),
       div(style = "background-color:#8473DA",align = "center", dataTableOutput(ns('drugtable'),width = "65%")
       ), br(),br(),br(),br()
       
       # Fourth row.
       ,aos( element = 
               div(align = "center",
                   h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 50px;","Details of Drug study.",),
                   #line
                   column(width = 4,offset = 4,
                          h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
               ), 
             animation = "fade-up", 
             duration = "2000"), br(),br(),
       div(style = "background-color:#8473DA",align = "center", dataTableOutput(ns('studytable'),width = "65%")
       ), br(),br(),br(),br()
    )
  )
}


## Server Module
drugServer<-function(id, stringsAsFactors) {
  moduleServer(
    id,
    function(input, output, session) {
    
    output$drugMap<-renderLeaflet({
      leaflet()%>%setMaxBounds(-180, -90, 180, 90) %>%
        setView(0, 20, zoom = 2)%>%
        addProviderTiles(providers$CartoDB.DarkMatter)%>%
        addPolygons(data=drugwc,
                    weight = 1, smoothFactor = 0.5,fillOpacity = 0.8,
                    fillColor = drugpal(t30$studycount),
                    highlightOptions=highlightOptions(weight = 5,color = '#0028FF',
                                                      fillOpacity = 0.7,
                                                      bringToFront = TRUE
                    ),label = lapply(druglab, HTML))%>%
        addLegend(
          pal = drugpal,
          values = t30$studycount,
          opacity = 0.7,
          position = "bottomright"
        )
    })
    
    output$countrytable <- renderDataTable(listofcountry[, c('countryname','studycount','topdrug') ])
    
    output$drugtable <- renderDataTable(listofdrug[, c('names','count') ])
    
    output$studytable <- renderDataTable(drugdata[, c('Title','MapCountry','Drugonly','URL') ])
    }
  )
}

shinyApp(ui = drugUI, server = drugServer)
