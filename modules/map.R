


#----------
# reading data for map
countries<-shapefile('data//countries_border_for_map//World_Countries__Generalized_.shp')
country_t<-read.csv('data//countries_border_for_map//country.csv')
country_p<-read.csv('data//countries_border_for_map//country_p.csv')

# Getting the data border for the countries from shape file to match the data
# also ordring the countries to match the border given in the shape file
wn<-country_t %>% pull(country)
wc<-countries[countries$COUNTRY %in% wn,]

# matching countries
country_t<-country_t[order(match(country_t$country,wc$COUNTRY)),]
country_p<-country_p[order(match(country_p$country,wc$COUNTRY)),]

country_t<-country_t[1:105,]
country_p<-country_p[1:105,]

# Colors for map
hc<-c('#000835','#001277','#001AAA','#0021D9','#0025F5')
bins<-c(0,50,100,200,800)
pal<-colorBin(palette =hc,domain = country_t$Total.Studies,bins = bins)

# First label
lab1<-paste('<p>',country_t$country,'</p>',
            '<p>',"Total studies on COVID-19:  ",country_t$Total.Studies,'</p>',
            '<p>','Treatment Studies:',country_t$Treatment.Studies,'</p>',
            '<p>','Prevention Studies:',country_t$Prevention.Studies,'</p>',
            '<p>','Vaccine Studies:',country_t$Vaccine.Studies,'</p>',
            '<p>','Diagnostic Studies:',country_t$Diagnostic.Studies,'</p>',
            sep = ""
)

#Second label
lab2<-paste('<p>',country_p$country,'</p>',
            '<p>',"Number of Studies Phase 1:  ",country_p$Phase.1,'</p>',
            '<p>','Number of Studies Phase 2:',country_p$Phase.2,'</p>',
            '<p>','Number of Studies Phase 3:',country_p$Phase.3,'</p>',
            '<p>','Number of Studies Phase 4:',country_p$Phase.4,'</p>',
            '<p>','Number of Studies Not Applicable:',country_p$Not.Applicable,'</p>',
            sep = ""
)



#-----------------



mapUI <- function(id) {
  ns <- NS(id)
    fluidPage(style = "background-color:#1D1F28 ;background-size: cover;",
      #map section
      fluidRow(
               br(),br(),br(),br(),br(),br(),br(),
               aos(
                 element = 
                   div(align = "center",
                       h3(style="font-family: Arial ; font-weight: 900; color: #6467D3 ; font-size: 30px ","INTERACTIVE WORLD MAP"),
                       h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 50px;","COVID-19 Medical Studies Based On Study Type",),
                       #line
                       column(width = 4,offset = 4,
                       h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
                       ), 
                 animation = "fade-up", 
                 duration = "2000"),
               br(),br(),br(),
               div(align = "center",
                   leafletOutput(ns('myMap1'),width = "65%",height = "455px")
               ),br(),br(),br(),br(),br(),br(),br(),
               # second map
               aos(
                 element = 
                   div(align = "center",
                       h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 50px;","COVID-19 Medical Studies Based On Study Phase",),
                       #line
                       column(width = 4,offset = 4,
                              h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
                   ), 
                 animation = "fade-up", 
                 duration = "2000"),
               br(),br(),br(),
               div(align = "center",
                   leafletOutput(ns('myMap2'),width = "65%",height = "455px")
               ),br(),br(),br(),br(),br(),br(),br(),
    )
    )
}




## Server Module
mapServer<-function(id, stringsAsFactors) {
  moduleServer(
    id,
  function(input, output, session) {
    

    output$myMap1<-renderLeaflet({
      leaflet()%>%
        setMaxBounds(-180, -90, 180, 90) %>%
        setView(0, 20, zoom = 2)%>%
        addProviderTiles(providers$CartoDB.DarkMatter)%>%
        addPolygons(data=wc,
                    weight = 1, smoothFactor = 0.5,fillOpacity = 0.8,
                    fillColor = pal(country_t$Total.Studies),
                    highlightOptions=highlightOptions(weight = 5,color = '#0028FF',
                                                      fillOpacity = 0.7,
                                                      bringToFront = TRUE
                    ),label = lapply(lab1, HTML))%>%
        addLegend(
          pal = pal,
          values = country_t$Total.Studies,
          opacity = 0.7,
          position = "bottomright"
        )
      
    })
      
      
    output$myMap2<-renderLeaflet({
      leaflet()%>%
        setMaxBounds(-180, -90, 180, 90) %>%
        setView(0, 20, zoom = 2)%>%
        addProviderTiles(providers$CartoDB.DarkMatter)%>%
        addPolygons(data=wc,
                    weight = 1, smoothFactor = 0.5,fillOpacity = 0.8,
                    fillColor = pal(country_t$Total.Studies),
                    highlightOptions=highlightOptions(weight = 5,color = '#0028FF',
                                                      fillOpacity = 0.7,
                                                      bringToFront = TRUE
                    ),label = lapply(lab2, HTML))%>%
        addLegend(
          pal = pal,
          values = country_t$Total.Studies,
          opacity = 0.7,
          position = "bottomright"
        )
    })
    

  
 
})}

