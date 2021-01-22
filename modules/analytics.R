






df = read.csv('data/analytics/sttdata.csv')





#----------(Frontend code)
# User interface
analyticsUI <- function(id) {
  ns <- NS(id)
  fluidPage(use_gotop(src = "fas fa-chevron-circle-up",color = "#000AFF",opacity = 0.8,width = 50,appear = 100),style = "background-color:#1D1F28 ;background-size: cover;",
    fluidRow(
      br(),br(),br(),br(),br(),br(),br(),
      aos(
        element = 
          div(align = "center",
              h3(style="font-family: Arial ; font-weight: 900; color: #6467D3 ; font-size: 30px ","ANALYTIC PAGE"),
              h1(style="font-style: Arial ;font-weight: bold; color: #FEFEFE; font-size: 20px;","Visualizations And Findings From The Data",),
              #line
              column(width = 4,offset = 4,
                     h1(style="font-style: Arial ;font-weight: bold; font-size: 50px;border-bottom: 0.5px solid #6467D3",""))
          ), 
        animation = "fade-up", 
        duration = "2000"),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","The Distribution Of Age Group Among All Countries That Did Clinical Trials",),
          plotOutput(ns('v1'),width = "40%",height = "450px")
      ),
      animation = "fade-up", 
      duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","The Distribution Of Trials In The Top 10 Countries With The Most Clinical Trials",),
                      plotOutput(ns('v2'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","The Distribution Of Age Group In Each Top 10 Countries With The Most Clinical Trials",),
                      plotOutput(ns('v3'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","Countries With Enrollment Greater Than 200,000",),
                      plotOutput(ns('v4'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","Over All Gender Enrolled",),
                      plotOutput(ns('v5'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","Completed Study As of Now Based on Gender",),
                      plotOutput(ns('v6'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","Recruitment based on gender",),
                      plotOutput(ns('v7'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","Suspended cases based on gender",),
                      plotOutput(ns('v8'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","Completed Study Per Country",),
                      plotOutput(ns('v9'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br(),
      br(),br(),br(),
      aos(
        element = div(align = "center",h1(style="font-style: Arial ;font-weight: bold; color: #B6A4FF; font-size: 20px;","6 Countries With Highest Number Of Studies With Completion Years Set Per Ccountry For Each Study",),
                      plotOutput(ns('v10'),width = "40%",height = "450px")
        ),
        animation = "fade-up", 
        duration = "2000")
      ,br(),br(),br(),br()
    ),
    
    )
  
  
 
}

#----------------------------(Backend code)
# Module server function
analyticsServer<-function(id, stringsAsFactors) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output,session) {
      data <- data.frame(
        category=c("Child", "Adult", "Older Adult"),
        count=c(646, 3609, 3364)
      )
      data$fraction <- data$count / sum(data$count)
      data$ymax <- cumsum(data$fraction)
      data$ymin <- c(0, head(data$ymax, n=-1))
      data$labelPosition <- (data$ymax + data$ymin) / 2
      data$label <- paste0(data$category, "\n value: ", data$count)

  output$v1<-renderPlot({
    ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3.5, fill=category)) +
      geom_rect() +
      geom_label( x=3.75, aes(y=labelPosition, label=label), size=5) +
      scale_fill_brewer(palette=4) +
      coord_polar(theta="y") +
      xlim(c(2, 4)) +
      theme_void() +
      theme(legend.position = "none")
 

 })
  #-----------
  # Second graPh
  id <- seq(1:10)
  individual <- c("United States","France","Italy","United Kingdom",
                  "China","Egypt","Spain","Canada","Turkey","Brazil")
  value <- c(736,540,172,170,161,145,137,136,130,115) # Values taken from previous calculation
  data1 <- data.frame(id,individual,value)
  label_data <- data1
  number_of_bar <- nrow(label_data)
  angle <-  90 - 360 * (label_data$id-0.5) /number_of_bar
  label_data$hjust<-ifelse( angle < -90, 1, 0)
  label_data$angle<-ifelse(angle < -90, angle+180, angle)
  output$v2<-renderPlot({
    ggplot(data1, aes(x=as.factor(id), y=value)) +
      geom_bar(stat="identity", fill=alpha("skyblue", 0.7)) +
      ylim(-150,900) +
      theme_minimal() +
      theme(
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm") # Adjust the margin to make in sort labels are not truncated!
      ) +
      coord_polar(start = 0) +
      geom_text(data=label_data, aes(x=id, y=value+10, label=individual, hjust=hjust), 
                color="black", fontface="bold",alpha=0.8, size=2.7, angle= label_data$angle, inherit.aes = FALSE ) 
    
  })
  #-----------
  # Third Graph
  id1 <- seq(1:30)
  individual1 <- c("United States","France","Italy","United Kingdom",
                   "China","Egypt","Spain","Canada","Turkey","Brazil",
                   "United States","France","Italy","United Kingdom",
                   "China","Egypt","Spain","Canada","Turkey","Brazil",
                   "United States","France","Italy","United Kingdom",
                   "China","Egypt","Spain","Canada","Turkey","Brazil")
  group <- c( rep('Child', 10), rep('Adult', 10), rep('Older Adult', 10))
  value1 <- c(86,104,28,46,39,61,32,29,21,18,
              729,529,171,164,159,145,137,132,124,115,
              700,508,163,149,141,118,135,123,88,110)
  data2 <- data.frame(id1,individual1,group,value1)
  empty_bar <- 3
  to_add <- data.frame( matrix(NA, empty_bar*nlevels(data2$group), ncol(data2)) )
  colnames(to_add) <- colnames(data2)
  to_add$group <- rep(levels(data2$group), each=empty_bar)
  data2 <- rbind(data2, to_add)
  data2 <- data2 %>% arrange(group)
  data2$id1 <- seq(1, nrow(data2))
  
  label_data1 <- data2
  number_of_bar <- nrow(label_data1)
  angle <- 90 - 360 * (label_data1$id1-0.5) /number_of_bar
  label_data1$hjust <- ifelse( angle < -90, 1, 0)
  label_data1$angle <- ifelse(angle < -90, angle+180, angle)
  
  base_data <- data2 %>% 
    group_by(group) %>% 
    summarize(start=min(id1), end=max(id1) - empty_bar) %>% 
    rowwise() %>% 
    mutate(title=mean(c(start, end)))
  grid_data <- base_data
  grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
  grid_data$start <- grid_data$start - 1
  grid_data <- grid_data[-1,]
  output$v3<-renderPlot({
    ggplot(data2, aes(x=as.factor(id1), y=value, fill=group)) +
      geom_bar(aes(x=as.factor(id1), y=value1, fill=group), stat="identity", alpha=0.5) +
      geom_bar(aes(x=as.factor(id1), y=value1, fill=group), stat="identity", alpha=0.5) +
      ylim(-150,750) +
      theme_minimal() +
      theme(
        legend.position = "none",
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm") 
      ) +
      coord_polar() + 
      geom_text(data=label_data1, aes(x=id1, y=value1+10, label=individual1, hjust=hjust), color="black", 
                fontface="bold",alpha=0.7, size=3.0, angle= label_data1$angle, inherit.aes = FALSE ) +
      
      geom_segment(data=base_data, aes(x = start, y = -5, xend = end, yend = -5), colour = "black", 
                   alpha=0.8, size=0.7 , inherit.aes = FALSE )  +
      geom_text(data=base_data, aes(x = title, y = -18, label=group), hjust=c(1,1,0), colour = "black", 
                alpha=0.8, size=3, fontface="bold", inherit.aes = FALSE)
  })
  #----------
  #Forth Graph
  
  output$v4<-renderPlot({
    df %>% select(MapCountry, Status, Enrollment) %>%
      filter(Enrollment >= 200000) %>%
      group_by(Status == 'Recruiting') %>%
      ggplot(mapping = aes(x=MapCountry, y=log(Enrollment)))+geom_violin()+
      geom_boxplot(width=0.1)+ggtitle('Countries by Enrollment Greater Than 200,000')+ xlab('MapCountry')+
      ylab('Status per Enrollment(Log)')
  
  })
  #-------
  #5 Gra
  
  output$v5<-renderPlot({
    df%>%
      group_by(Gender)%>%
      count(Gender)%>%
      ggplot(aes(Gender, n,fill=Gender))+
      geom_col()+
      geom_text(aes(label=n))+
      labs(x="Gender" , "Number of candidates" , title = "Number of Over all Study per Gender")
  
  })
  #-----------
  #6 Gra
  output$v6<-renderPlot({
    df%>%
      filter(Status=="Completed")%>%
      group_by(Gender)%>%
      count(Gender)%>%
      ggplot(aes(Gender, n,fill=Gender))+
      geom_col()+
      geom_text(aes(label=n))+
      labs(x="Gender" , "Number of candidates" , title = "Number of Completed Study per Gender")  
  })
  #---------
  #7 Gra
  output$v7<-renderPlot({
    df%>%
      filter(Status=="Recruiting")%>%
      group_by(Gender)%>%
      count(Gender)%>%
      ggplot(aes(Gender, n,fill=Gender))+
      geom_col()+
      geom_text(aes(label=n))+
      labs(x="Gender" , "Number of candidates" , title = "Number of Still Recruiting Study per Gender") 
  })
  #-----------
  #8 Gra
  output$v8<-renderPlot({
    df%>%
      filter(Status=="Suspended")%>%
      group_by(Gender)%>%
      count(Gender)%>%
      ggplot(aes(Gender, n,fill=Gender))+
      geom_col()+
      geom_text(aes(label=n))+
      labs(x="Gender" , "Number of candidates" , title = "Number of Suspended Study per Gender") 
  })
  #-----------
  #9 Gra
  output$v9<-renderPlot({
    df%>%
      group_by(MapCountry)%>%
      filter(Status=="Completed")%>%
      count(MapCountry)%>%
      ungroup()%>%
      mutate(percentage=round((n/sum(n))*100,1))%>%
      arrange(desc(n))%>%
      ggplot(aes(reorder(MapCountry,n),n, fill=MapCountry,label = percentage))+
      geom_col(show.legend = F)+
      geom_text(size=4,color="black")+
      coord_flip()+
      scale_y_continuous(breaks = seq(0,150,10))+
      labs(x="List Of Countries" , y= "Study" , title ="Number of Completed Study per Country")
  })
  #-----------
  #10 Gra
  output$v10<-renderPlot({
    df %>%
      filter(MapCountry %in% c("Italy", "Spain", "France", "China","United States", "United Kingdom")) %>%
      ggplot(aes(x=MapCountry,y=Completion.Year, fill = MapCountry)) +
      geom_boxplot() + 
      facet_wrap(~Month, ncol= 4) + theme(
        axis.text.x = element_text(angle=90, size=5 ),
        axis.title.y = element_text(color="cadetblue" , vjust=0.35)   
      )
  })
  
  
})}