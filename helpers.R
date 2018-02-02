###########################Map#######################
regionschart= function(region){
  geo = stock.address%>% filter(Region==region)
leaflet(geo) %>% addTiles() %>%
  addMarkers(lng = ~longi, lat = ~lati,  popup = geo$popuptext)
}
###############All Charts#################################################
indexChart = function(data, ind, dateFrom, dateTo, chart) {
 #######plotly formatting 
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  xtitle <- list(title = "")
  
  ytitle <- list(
    title = "Closing Value",
    tickangle=45,
    titlefont = f
  )
  ##########################
  c = data %>% 
    filter(Index == ind, Date >= dateFrom, Date <= dateTo) 
    
  
    if (chart == 'line'){
     p= ggplot(c, aes(x = Date, y = Close)) +
     geom_line() +
    #scale_x_date(breaks=date_breaks(width = '1 month')) +
     labs(title = paste(ind, "Line Chart", sep=' '), y = "Closing Value", x = "") + 
      
      theme_tq_green() + scale_color_tq(theme = "green") + 
      scale_fill_tq(theme = "green") 
      
     #theme(axis.text.y = element_text(size=10, angle=60 ))+ 
     #theme(axis.title.y = element_text(size=14,margin=margin(t = 0, r = 150, b = 0, l = 0)))
       #theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=12))
      #scale_y_continuous(labels = scales::dollar)
     
     ggplotly(p)%>% layout(yaxis=ytitle)
     
      } else if (chart == 'dot'){
        p= ggplot(c, aes(x = Date, y = Close)) +
          geom_point(color='red') +
          #scale_x_date(breaks=date_breaks(width = '1 month')) +
          labs(title = paste(ind, "Dot Plot", sep=' '), y = "Closing Value", x = "") + 
          #theme(axis.text.y = element_text(size=10, angle=60 ))+
          theme_tq_dark() + scale_color_tq(theme = "dark")  
          #scale_fill_tq(theme = "green") 
        
        ply = ggplotly(p, dynamicTicks=T) 
        ply %>% layout(xaxis = list(
          rangeselector = list(
            buttons = list(
              list(
                count = 2,
                label = "2 w",
                step = "week",
                stepmode = "forward"),
              
              list(
                count = 1,
                label = "1 m",
                step = "month",
                stepmode = "forward"),
              list(
                count = 3,
                label = "3 m",
                step = "month",
                stepmode = "forward"),
              list(
                count = 6,
                label = "6 m",
                step = "month",
                stepmode = "forward"),
              
              list(step = "all"))),
          
          rangeslider = list(start=dateFrom, end=dateTo,type = "date")), 
           
        yaxis=ytitle)
        
        
      }else if (chart =='area'){
        m = c[which.min(c$Close),]
        a <- list(
          x=m$Date,
          y=m$Close,
          text = "Minimum",
          xref = "x",
          yref = "y",
          showarrow = TRUE,
          arrowhead = 7,
          arrowcolor='red',
          ax = 20,
          ay = -40 
          
        )
        
        
        plot_ly(x=c$Date, y=c$Close, type='scatter', mode='lines', fill='tozeroy') %>% 
          layout(title=paste(ind, "Area Chart", sep=' '), 
                 xaxis = xtitle, yaxis = list(
                   title = "Closing Value",
                   range = c(min(c$Close), max(c$Close)),
                   titlefont=f), 
                 annotations =a,
                 showlegend=FALSE)
        
      } else if (chart =='bar'){
        
      p = ggplot(c, aes(x = Date, y = Close)) +
        geom_col(fill='blue') + 
      #scale_x_datetime(breaks=date_breaks(width = '4 weeks')) +
      labs(title =  paste(ind, "Bar Chart", sep=' '), y = "Closing Value", x = "") +
        
        #theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10))+
      theme_tq()
      
      ply = ggplotly(p, dynamicTicks=T)
      ply %>% layout(xaxis = list(
        rangeselector = list(
          buttons = list(
            list(
              count = 2,
              label = "2 w",
              step = "week",
              stepmode = "forward"),
            
            list(
              count = 1,
              label = "1 m",
              step = "month",
              stepmode = "forward"),
            list(
              count = 3,
              label = "3 m",
              step = "month",
              stepmode = "forward"),
            list(
              count = 6,
              label = "6 m",
              step = "month",
              stepmode = "forward"),
            
            list(step = "all"))),
        
        rangeslider = list(type = "date")), 
        yaxis = ytitle
        )
          
    } else {
      
      plot_ly(c, x = ~Date, type='candlestick', 
        open = ~Open, high = ~High, low = ~Low, close = ~Close)%>%
        layout(title=paste(ind, "Candlestick Chart", sep=' '), 
               xaxis = xtitle, yaxis = ytitle, showlegend=FALSE)
      
                       #color_up = "darkgreen", color_down = "darkred", 
                       #fill_up  = "darkgreen", fill_down  = "darkred") 
      
      #theme_tq()
     # scale_y_continuous(labels = scales::dollar)
    }
  
} #indexchart end
##################################Distribution#########################
distriindexChart = function(data, ind, dateFrom, dateTo){
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  xtitle <- list(title = "")
  
  ytitle <- list(
    title = "Closing Value",
    tickangle=45,
    titlefont = f
  )
  dc = data %>% 
    filter(Index %in% ind, Date >= dateFrom, Date <= dateTo) 
  
  
    dp= ggplot(dc, aes(x = Date, y = Close, group=Index)) +
      geom_line(aes(color=Index)) +
      #geom_smooth(se=FALSE)+
      labs(title =  "Comparison Line Chart", y = "Closing Value", x = "") + 
      
      theme_tq_green() + scale_color_tq(theme = "green") + 
      scale_fill_tq(theme = "green") 
    
    ggplotly(dp)%>% layout(yaxis=ytitle, showlegend=FALSE)
    
}

###########################Comparison chart############################
comparisonindexChart = function(yr_data, regi, variable) {
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  xtitle <- list(title = "")
  
  
  
  comp = yr_data %>%   filter(Region == regi) 
  
  if (variable == 'one_yr_high'){
    
    comp_p =comp %>% ggplot(., aes(x=year, y=one_yr_high, fill=Index_Country)) +
      geom_col(position='dodge') + 
      #facet_wrap(~Index_Country) +
      annotate('text', x='2017', y=max(comp$one_yr_high), label='\u279c', color='red')+
      annotate('text', x='2017', y=max(comp$one_yr_high)+max(comp$one_yr_high)/15 , label='All-Time High')+
      theme(axis.text.x  = element_text(size=9)) +
      theme(axis.text.y = element_text(size=10, angle=60 ))+
      labs(title=paste(regi, "Bar Chart", sep=' '), y='High', x='')
    
          ytitle <- list(
                title = "High",
                titlefont = f
                )
    
     ggplotly(comp_p) %>% layout(yaxis=ytitle)
        } else {
          
    comp_p= comp %>% ggplot(., aes(x=year, y=one_yr_percent_chg, fill=Index_Country)) +
      geom_col() + 
      facet_wrap(~Index_Country) +
      theme(axis.text.x  = element_text(size=5)) +
      theme(plot.title = element_text(size=20)) +
      labs(title=paste(regi, "Bar Chart", sep=' '), y='Percent Change', x='')
    
    #ytitle <- list(
     # title = "Percentage Change",
     # titlefont = f    )
    
    ggplotly(comp_p) %>% layout(showlegend=FALSE)
        }
  
  
    
      
      
  
 
  
} #comparisonindexchart end



















