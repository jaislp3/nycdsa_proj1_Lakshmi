
shinyUI(dashboardPage(
  skin='purple',

dashboardHeader(title='World Stock Market Index', 
                titleWidth = 450),

dashboardSidebar(
  
  sidebarMenu(
    menuItem(
      'Start',
      tabName = 'start',
      icon = icon('comment-o')
    ),
    
    menuItem(
      'USA',
      tabName = 'usa',
      icon = icon('usd')
    ),
    
    menuItem(
      'Global',
      tabName = 'global',
      icon = icon('globe')
    ),
    
    menuItem(
      'Asia Pacific',
      tabName = 'asia',
      icon = icon('inr')
    ),
    
    menuItem(
      'Europe',
      tabName = 'europe',
      icon = icon('eur')
    ),
    
    menuItem(
      'Americas',
      tabName = 'americas',
      icon = icon('cloud')
    ),
    
    menuItem(
      'Others',
      tabName = 'others',
      icon = icon('gg')
    ),
    
    menuItem(
      'Distribution Comparison',
      tabName = 'distri',
      icon = icon('line-chart')
    ),
    
    menuItem(
      'Comparison with Past History',
      tabName = 'comparison',
      icon = icon('history')
    ),
    menuItem(
      'About',
      tabName = 'about',
      icon = icon('question')
    )
  )
),


dashboardBody(
  tabItems(
    tabItem(tabName = "start",
            h2('World Stock Market Index Dashboard'),
            
            fluidRow(
              box(
                p('Interested to know about World Stock Market Index after President Trump\'s Win?', br(),
                  'Go Ahead!'),
                width=12
              )
            ),
            
            
            fluidRow(
              box(
                img(src='http://www.sickchirpse.com/wp-content/uploads/2016/12/Donald-Trump-Thumbs-U.png', width='100%'),
                width=6
                #align='center'
              ),
              
              box(
                img(src='https://fthmb.tqn.com/SRrcxilAO14LgKCphBUgT1j0w1E=/768x0/filters:no_upscale()/nyse-500689770-5714606f5f9b588cc279f892.jpg',
                   width='100%'),
                width=6
                #align='center'
              )
            ),
              box(
                img(src='http://newyorknatives.com/wp-content/uploads/2001/02/NASDAQ.jpg',
                   width='100%'),
                width=6
                #align='center'
              ),
              
            
            fluidRow(
              box(
                img(src='http://www.asiapacfinance.com/wp-content/uploads/2016/08/tokyo-exchange.jpg', 
                    width='100%'),
                width=6
                #align='center'
              ),
              
              box(
                img(src='https://cdn.images.express.co.uk/img/dynamic/1/590x/London-Stock-Exchange-635537.jpg',
                    width='100%'),
               width=6
                #align='center'
              ),
              box(
                img(src='http://www.sharemarket.in/wp-content/uploads/2011/10/image104.png',
                   width='100%'),
                width=6
                #align='center'
              )
            )
    ),#end of start tab 
    
    
    
    tabItem(
      tabName = 'usa',
      h2('U.S. Indexes'),
      fluidRow(
        box(
          p('Welcome! This page displays information about U.S. stock indexes.', br(), 
        '\'Map\': Location of respective stock exchanges; \'General\': Stock index charts from  January 2016 to January 2018', br(),
          '\'Period before Win\': from January 2016 to middle of October 2016 (before President Trump\'s win)', br(),
            '\'Crucial Moment\': from October 15, 2016 to December 31, 2016 (during President Trump\'s win)', br(),
            '\'Upward (Historical) Moment\': from January 2017 to middle of January 2018'),
          width=12
        )
      ),
      
      tabsetPanel(
        
        tabPanel(
          'Map',
          
          fluidRow(
            box(
              leafletOutput(
                'usaMap',
                 width='100%',
                 height=600
              ),
              width=27
            )
          )
          ), #map tab panel end
        
        tabPanel(
          'General',
          
      fluidRow(
        box(
          selectInput(
            'usindex',
            label=h4('Select Index'),
            choices = us.names
          ),
          width=4,
          height=110
        ),
        
        box(
          dateRangeInput(
            'usDate',
            label=h4('Select date range'),
            start=min(DJIA$Date),
            end=max(DJIA$Date),
            min=min(DJIA$Date),
            max=max(DJIA$Date)
          ),
          width=4,
          height=110
        ),
        
        box(
          selectInput(
            'uscharts',
            label=h4('Display'),
            choices = list(
              'Line' = 'line',
              'Candlestick' = 'candle',
              'Mountain(Area)' = 'area',
              'Bar Charts' = 'bar',
              'Dots(Scatter)' ='dot'
              
                            )
            
          ),
          width=4,
          height=110
        )
        
      ),
      
      fluidRow(
        box(
          plotlyOutput('us_indexprices', width='100%', height='400px'),
          width=27
        )       )
        ), #overview tab end
      
      tabPanel(
        'Period Before Win',
        
        fluidRow(
          box(
            selectInput(
              'usbindex',
              label=h4('Select Index'),
              choices = us.names
            ),
            width=4,
            height=110
          ),
          
          box(
            dateRangeInput(
              'usbDate',
              label=h4('Select date range'),
              start=min(before$Date),
              end=max(before$Date),
              min=min(before$Date),
              max=max(before$Date)
            ),
            width=4,
            height=110
          ),
          
          box(
            selectInput(
              'usbcharts',
              label=h4('Display'),
              choices = list(
                'Line' = 'line',
                'Candlestick' = 'candle',
                'Mountain(Area)' = 'area',
                'Bar Charts' = 'bar',
                'Dots(Scatter)' ='dot'
                
              )
              
            ),
            width=4,
            height=110
          )
        ),
        
        fluidRow(
          box(
            plotlyOutput('usb_indexprices', width='100%'),
            width=27
          ) )
        ), #before panel end
      
      tabPanel(
        'Crucial Moment',
        
        fluidRow(
          box(
            selectInput(
              'uscindex',
              label=h4('Select Index'),
              choices = us.names
            ),
            width=4,
            height=110
          ),
          
          box(
            dateRangeInput(
              'uscDate',
              label=h4('Select date range'),
              start=min(crucial$Date),
              end=max(crucial$Date),
              min=min(crucial$Date),
              max=max(crucial$Date)
            ),
            width=4,
            height=110
          ),
          
          box(
            selectInput(
              'usccharts',
              label=h4('Display'),
              choices = list(
                'Line' = 'line',
                'Candlestick' = 'candle',
                'Mountain(Area)' = 'area',
                'Bar Charts' = 'bar',
                'Dots(Scatter)' ='dot'
                              )
                
              
            ),
            width=4,
            height=110
          )
        ),
        
        fluidRow(
          box(
            plotlyOutput('usc_indexprices', width='100%'),
            width=27
          ) )
      ), #crucial panel end
      
      tabPanel(
        'Upward (Historical) Moment',
        
        fluidRow(
          box(
            selectInput(
              'usuindex',
              label=h4('Select Index'),
              choices = us.names
            ),
            width=4,
            height=110
          ),
          
          box(
            dateRangeInput(
              'usuDate',
              label=h4('Select date range'),
              start=min(upward$Date),
              end=max(upward$Date),
              min=min(upward$Date),
              max=max(upward$Date)
            ),
            width=4,
            height=110
          ),
          
          box(
            selectInput(
              'usucharts',
              label=h4('Display'),
              choices = list(
                'Line' = 'line',
                'Candlestick' = 'candle',
                'Mountain(Area)' = 'area',
                'Bar Charts' = 'bar',
                'Dots(Scatter)' ='dot'
                              )
              
            ),
            width=4,
            height=110
          )
        ),
        
        fluidRow(
          box(
            plotlyOutput('usu_indexprices', width='100%'),
            width=27
          ) )
      ) #Upward panel end
      
      
      )#tabset Panel end
      
    ),  #usa tab item end
 #########################Global##########################   
    
     tabItem(tabName = "global",
             h2('Global Indexes'),
             
             fluidRow(
               box(
                 p('Welcome! This page displays information about Global stock indexes.', br(), 
                   '\'General\': Stock index charts from  January 2016 to January 2018', br(),
                   '\'Period before Win\': from January 2016 to middle of October 2016 (before President Trump\'s win)', br(),
                   '\'Crucial Moment\': from October 15, 2016 to December 31, 2016 (during President Trump\'s win)', br(),
                   '\'Upward (Historical) Moment\': from January 2017 to middle of January 2018'),
                 width=12
               )
             ),
             
             tabsetPanel(
               
               #tabPanel(
                # 'Map',
                 
                # fluidRow(
                 #  box(
                     #leafletOutput(
                     #  'stationsMap',
                     #  width='100%',
                     #  height=600
                  # ),
                 #  width=27
                 #)
               #), #map tab panel end
               
               tabPanel(
                 'General',
                 
                 fluidRow(
                   box(
                     selectInput(
                       'globalindex',
                       label=h4('Select Index'),
                       choices = global.names
                     ),
                     width=4,
                     height=110
                   ),
                   
                   box(
                     dateRangeInput(
                       'globalDate',
                       label=h4('Select date range'),
                       start=min(DJIA$Date),
                       end=max(DJIA$Date),
                       min=min(DJIA$Date),
                       max=max(DJIA$Date)
                     ),
                     width=4,
                     height=110
                   ),
                   
                   box(
                     selectInput(
                       'globalcharts',
                       label=h4('Display'),
                       choices = list(
                         'Line' = 'line',
                         'Candlestick' = 'candle',
                         'Mountain(Area)' = 'area',
                         'Bar Charts' = 'bar',
                         'Dots(Scatter)' ='dot'
                         
                       )
                       
                     ),
                     width=4,
                     height=110
                   )
                 ),
                 
                 fluidRow(
                   box(
                     plotlyOutput('global_indexprices', width='100%'),
                     width=27
                   )       )
               ), #overview tab end
               
               tabPanel(
                 'Period Before Win',
                 
                 fluidRow(
                   box(
                     selectInput(
                       'globalbindex',
                       label=h4('Select Index'),
                       choices = global.names
                     ),
                     width=4,
                     height=110
                   ),
                   
                   box(
                     dateRangeInput(
                       'globalbDate',
                       label=h4('Select date range'),
                       start=min(before$Date),
                       end=max(before$Date),
                       min=min(before$Date),
                       max=max(before$Date)
                     ),
                     width=4,
                     height=110
                   ),
                   
                   box(
                     selectInput(
                       'globalbcharts',
                       label=h4('Display'),
                       choices = list(
                         'Line' = 'line',
                         'Candlestick' = 'candle',
                         'Mountain(Area)' = 'area',
                         'Bar Charts' = 'bar',
                         'Dots(Scatter)' ='dot'
                         
                       )
                       
                     ),
                     width=4,
                     height=110
                   )
                 ),
                 
                 fluidRow(
                   box(
                     plotlyOutput('globalb_indexprices', width='100%'),
                     width=27
                   ) )
               ), #before panel end
               
               tabPanel(
                 'Crucial Moment',
                 
                 fluidRow(
                   box(
                     selectInput(
                       'globalcindex',
                       label=h4('Select Index'),
                       choices = global.names
                     ),
                     width=4,
                     height=95
                   ),
                   
                   box(
                     dateRangeInput(
                       'globalcDate',
                       label=h4('Select date range'),
                       start=min(crucial$Date),
                       end=max(crucial$Date),
                       min=min(crucial$Date),
                       max=max(crucial$Date)
                     ),
                     width=4,
                     height=95
                   ),
                   
                   box(
                     selectInput(
                       'globalccharts',
                       label=h4('Display'),
                       choices = list(
                         'Line' = 'line',
                         'Candlestick' = 'candle',
                         'Mountain(Area)' = 'area',
                         'Bar Charts' = 'bar',
                         'Dots(Scatter)' ='dot'
                         
                       )
                       
                     ),
                     width=4,
                     height=110
                   )
                 ),
                 
                 fluidRow(
                   box(
                     plotlyOutput('globalc_indexprices', width='100%'),
                     width=27
                   ) )
               ), #crucial panel end
               
               tabPanel(
                 'Upward (Historical) Moment',
                 
                 fluidRow(
                   box(
                     selectInput(
                       'globaluindex',
                       label=h4('Select Index'),
                       choices = global.names
                     ),
                     width=4,
                     height=110
                   ),
                   
                   box(
                     dateRangeInput(
                       'globaluDate',
                       label=h4('Select date range'),
                       start=min(upward$Date),
                       end=max(upward$Date),
                       min=min(upward$Date),
                       max=max(upward$Date)
                     ),
                     width=4,
                     height=110
                   ),
                   
                   box(
                     selectInput(
                       'globalucharts',
                       label=h4('Display'),
                       choices = list(
                         'Line' = 'line',
                         'Candlestick' = 'candle',
                         'Mountain(Area)' = 'area',
                         'Bar Charts' = 'bar',
                         'Dots(Scatter)' ='dot'
                         
                       )
                       
                     ),
                     width=4,
                     height=110
                   )
                 ),
                 
                 fluidRow(
                   box(
                     plotlyOutput('globalu_indexprices', width='100%'),
                     width=27
                   ) )
               ) #Upward panel end
               
             )#tabset Panel end
             
     ),  #global tab item end
 #######################Asia#############################   
    tabItem(tabName = "asia",
            h2('Asia Pacific Indexes'),
            
            fluidRow(
              box(
                p('Welcome! This page displays information about Acia Pacific stock indexes.', br(), 
                  '\'Map\': Location of respective stock exchanges; \'General\': Stock index charts from  January 2016 to January 2018', br(),
                  '\'Period before Win\': from January 2016 to middle of October 2016 (before President Trump\'s win)', br(),
                  '\'Crucial Moment\': from October 15, 2016 to December 31, 2016 (during President Trump\'s win)', br(),
                  '\'Upward (Historical) Moment\': from January 2017 to middle of January 2018'),
                width=12
              )
            ),
            
            tabsetPanel(
              
              tabPanel(
                'Map',
                
                fluidRow(
                  box(
                    leafletOutput(
                      'asiaMap',
                      width='100%',
                      height=600
                              ),
                  width=27
                )
                )
              ), #map tab panel end
              
              tabPanel(
                'General',
                
                fluidRow(
                  box(
                    selectInput(
                      'asiaindex',
                      label=h4('Select Index'),
                      choices = asia.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'asiaDate',
                      label=h4('Select date range'),
                      start=min(DJIA$Date),
                      end=max(DJIA$Date),
                      min=min(DJIA$Date),
                      max=max(DJIA$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'asiacharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('asia_indexprices', width='100%'),
                    width=27
                  )       )
              ), #overview tab end
              
              tabPanel(
                'Period Before Win',
                
                fluidRow(
                  box(
                    selectInput(
                      'asiabindex',
                      label=h4('Select Index'),
                      choices = asia.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'asiabDate',
                      label=h4('Select date range'),
                      start=min(before$Date),
                      end=max(before$Date),
                      min=min(before$Date),
                      max=max(before$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'asiabcharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('asiab_indexprices', width='100%'),
                    width=27
                  ) )
              ), #before panel end
              
              tabPanel(
                'Crucial Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'asiacindex',
                      label=h4('Select Index'),
                      choices = asia.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'asiacDate',
                      label=h4('Select date range'),
                      start=min(crucial$Date),
                      end=max(crucial$Date),
                      min=min(crucial$Date),
                      max=max(crucial$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'asiaccharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('asiac_indexprices', width='100%'),
                    width=27
                  ) )
              ), #crucial panel end
              
              tabPanel(
                'Upward (Historical) Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'asiauindex',
                      label=h4('Select Index'),
                      choices = asia.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'asiauDate',
                      label=h4('Select date range'),
                      start=min(upward$Date),
                      end=max(upward$Date),
                      min=min(upward$Date),
                      max=max(upward$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'asiaucharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('asiau_indexprices', width='100%'),
                    width=27
                  ) )
              ) #Upward panel end
              
            )#tabset Panel end
            
    ),  #asia tab item end
    
 ##########################Europe############################################   
    tabItem(tabName = "europe",
            h2('Europe Indexes'),
            
            fluidRow(
              box(
                p('Welcome! This page displays information about stock indexes in Europe.', br(), 
                  '\'Map\': Location of respective stock exchanges; \'General\': Stock index charts from  January 2016 to January 2018', br(),
                  '\'Period before Win\': from January 2016 to middle of October 2016 (before President Trump\'s win)', br(),
                  '\'Crucial Moment\': from October 15, 2016 to December 31, 2016 (during President Trump\'s win)', br(),
                  '\'Upward (Historical) Moment\': from January 2017 to middle of January 2018'),
                width=12
              )
            ),
            
            tabsetPanel(
              
              tabPanel(
                'Map',
                
                fluidRow(
                  box(
                    leafletOutput(
                      'europeMap',
                      width='100%',
                      height=600
                                ),
                  width=27
                )
                )
              ), #map tab panel end
              
              tabPanel(
                'General',
                
                fluidRow(
                  box(
                    selectInput(
                      'europeindex',
                      label=h4('Select Index'),
                      choices = europe.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'europeDate',
                      label=h4('Select date range'),
                      start=min(DJIA$Date),
                      end=max(DJIA$Date),
                      min=min(DJIA$Date),
                      max=max(DJIA$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'europecharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('europe_indexprices', width='100%'),
                    width=27
                  )       )
              ), #overview tab end
              
              tabPanel(
                'Period Before Win',
                
                fluidRow(
                  box(
                    selectInput(
                      'europebindex',
                      label=h4('Select Index'),
                      choices = europe.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'europebDate',
                      label=h4('Select date range'),
                      start=min(before$Date),
                      end=max(before$Date),
                      min=min(before$Date),
                      max=max(before$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'europebcharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('europeb_indexprices', width='100%'),
                    width=27
                  ) )
              ), #before panel end
              
              tabPanel(
                'Crucial Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'europecindex',
                      label=h4('Select Index'),
                      choices = europe.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'europecDate',
                      label=h4('Select date range'),
                      start=min(crucial$Date),
                      end=max(crucial$Date),
                      min=min(crucial$Date),
                      max=max(crucial$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'europeccharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('europec_indexprices', width='100%'),
                    width=27
                  ) )
              ), #crucial panel end
              
              tabPanel(
                'Upward (Historical) Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'europeuindex',
                      label=h4('Select Index'),
                      choices = europe.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'europeuDate',
                      label=h4('Select date range'),
                      start=min(upward$Date),
                      end=max(upward$Date),
                      min=min(upward$Date),
                      max=max(upward$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'europeucharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('europeu_indexprices', width='100%'),
                    width=27
                  ) )
              ) #Upward panel end
              
            )#tabset Panel end
            
    ),  #europe tab item end
    
 ####################Americas################################################   
    tabItem(tabName = "americas",
            h2('Americas Indexes'),
            
            fluidRow(
              box(
                p('Welcome! This page displays information about stock indexes in Americas.', br(), 
                  '\'Map\': Location of respective stock exchanges; \'General\': Stock index charts from  January 2016 to January 2018', br(),
                  '\'Period before Win\': from January 2016 to middle of October 2016 (before President Trump\'s win)', br(),
                  '\'Crucial Moment\': from October 15, 2016 to December 31, 2016 (during President Trump\'s win)', br(),
                  '\'Upward (Historical) Moment\': from January 2017 to middle of January 2018'),
                width=12
              )
            ),
            
            tabsetPanel(
              
              tabPanel(
                'Map',
                
                fluidRow(
                  box(
                    leafletOutput(
                      'americasMap',
                      width='100%',
                      height=600
                                ),
                  width=27
                )
                )
              ), #map tab panel end
              
              tabPanel(
                'General',
                
                fluidRow(
                  box(
                    selectInput(
                      'americasindex',
                      label=h4('Select Index'),
                      choices = americas.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'americasDate',
                      label=h4('Select date range'),
                      start=min(DJIA$Date),
                      end=max(DJIA$Date),
                      min=min(DJIA$Date),
                      max=max(DJIA$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'americascharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('americas_indexprices', width='100%'),
                    width=27
                  )       )
              ), #overview tab end
              
              tabPanel(
                'Period Before Win',
                
                fluidRow(
                  box(
                    selectInput(
                      'americasbindex',
                      label=h4('Select Index'),
                      choices = americas.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'americasbDate',
                      label=h4('Select date range'),
                      start=min(before$Date),
                      end=max(before$Date),
                      min=min(before$Date),
                      max=max(before$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'americasbcharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('americasb_indexprices', width='100%'),
                    width=27
                  ) )
              ), #before panel end
              
              tabPanel(
                'Crucial Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'americascindex',
                      label=h4('Select Index'),
                      choices = americas.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'americascDate',
                      label=h4('Select date range'),
                      start=min(crucial$Date),
                      end=max(crucial$Date),
                      min=min(crucial$Date),
                      max=max(crucial$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'americasccharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('americasc_indexprices', width='100%'),
                    width=27
                  ) )
              ), #crucial panel end
              
              tabPanel(
                'Upward (Historical) Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'americasuindex',
                      label=h4('Select Index'),
                      choices = americas.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'americasuDate',
                      label=h4('Select date range'),
                      start=min(upward$Date),
                      end=max(upward$Date),
                      min=min(upward$Date),
                      max=max(upward$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'americasucharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('americasu_indexprices', width='100%'),
                    width=27
                  ) )
              ) #Upward panel end
              
            )#tabset Panel end
            
    ),  #americas tab item end
  ####################Others##################################################  
    
    tabItem(tabName = "others",
            h2('Other Countries Indexes'),
            
            fluidRow(
              box(
                p('Welcome! This page displays information about  stock indexes in other regions.', br(), 
                  '\'Map\': Location of respective stock exchanges; \'General\': Stock index charts from  January 2016 to January 2018', br(),
                  '\'Period before Win\': from January 2016 to middle of October 2016 (before President Trump\'s win)', br(),
                  '\'Crucial Moment\': from October 15, 2016 to December 31, 2016 (during President Trump\'s win)', br(),
                  '\'Upward (Historical) Moment\': from January 2017 to middle of January 2018'),
                width=12
              )
            ),
            
            tabsetPanel(
              
              tabPanel(
                'Map',
                
                fluidRow(
                  box(
                    leafletOutput(
                      'othersMap',
                      width='100%',
                      height=600
                                ),
                  width=27
                )
                )
              ), #map tab panel end
              
              tabPanel(
                'General',
                
                fluidRow(
                  box(
                    selectInput(
                      'othersindex',
                      label=h4('Select Index'),
                      choices = others.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'othersDate',
                      label=h4('Select date range'),
                      start=min(DJIA$Date),
                      end=max(DJIA$Date),
                      min=min(DJIA$Date),
                      max=max(DJIA$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'otherscharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('others_indexprices', width='100%'),
                    width=27
                  )       )
              ), #overview tab end
              
              tabPanel(
                'Period Before Win',
                
                fluidRow(
                  box(
                    selectInput(
                      'othersbindex',
                      label=h4('Select Index'),
                      choices = others.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'othersbDate',
                      label=h4('Select date range'),
                      start=min(before$Date),
                      end=max(before$Date),
                      min=min(before$Date),
                      max=max(before$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'othersbcharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('othersb_indexprices', width='100%'),
                    width=27
                  ) )
              ), #before panel end
              
              tabPanel(
                'Crucial Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'otherscindex',
                      label=h4('Select Index'),
                      choices = others.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'otherscDate',
                      label=h4('Select date range'),
                      start=min(crucial$Date),
                      end=max(crucial$Date),
                      min=min(crucial$Date),
                      max=max(crucial$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'othersccharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                        
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('othersc_indexprices', width='100%'),
                    width=27
                  ) )
              ), #crucial panel end
              
              tabPanel(
                'Upward (Historical) Moment',
                
                fluidRow(
                  box(
                    selectInput(
                      'othersuindex',
                      label=h4('Select Index'),
                      choices = others.names
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    dateRangeInput(
                      'othersuDate',
                      label=h4('Select date range'),
                      start=min(upward$Date),
                      end=max(upward$Date),
                      min=min(upward$Date),
                      max=max(upward$Date)
                    ),
                    width=4,
                    height=110
                  ),
                  
                  box(
                    selectInput(
                      'othersucharts',
                      label=h4('Display'),
                      choices = list(
                        'Line' = 'line',
                        'Candlestick' = 'candle',
                        'Mountain(Area)' = 'area',
                        'Bar Charts' = 'bar',
                        'Dots(Scatter)' ='dot'
                      )
                      
                    ),
                    width=4,
                    height=110
                  )
                ),
                
                fluidRow(
                  box(
                    plotlyOutput('othersu_indexprices', width='100%'),
                    width=27
                  ) )
              ) #Upward panel end
              
            )#tabset Panel end
            
    ),  #others tab item end
#######################Distribution Comparison###################### 
tabItem(tabName = "distri",
        h2('Comparison of Line Graph Distributions'),
        
        fluidRow(
          box(
            p('Welcome! Curious to compare various major world stock indexes? This page will help.', br(), 
              '\'General\': Stock index line chart from  January 2016 to January 2018', br(),
              '\'Period before Win\': from January 2016 to middle of October 2016 (before President Trump\'s win)', br(),
              '\'Crucial Moment\': from October 15, 2016 to December 31, 2016 (during President Trump\'s win)', br(),
              '\'Upward (Historical) Moment\': from January 2017 to middle of January 2018'),
            width=12
          )
        ),
        tabsetPanel(
          
          
          tabPanel(
            'General',
            
            fluidRow(
              box(
                dateRangeInput(
                  'distriDate',
                  label=h4('Select date range'),
                  start=min(DJIA$Date),
                  end=max(DJIA$Date),
                  min=min(DJIA$Date),
                  max=max(DJIA$Date)
                                )
                #width=4,
                #height=110
                )
            ),
              fluidRow(
              box(
                plotlyOutput('distri_indexprices', width='100%'),
                width=27
                  ),
                box(
                checkboxGroupInput(
                  'districharts',
                  label=h4('Check to Compare'),
                  choices = distri.names,
                  selected= 'DJIA'
                                )
              )
            )
            
            
          ), #overview tab end
          
          tabPanel(
            'Period Before Win',
            
            fluidRow(
              box(
                dateRangeInput(
                  'distribDate',
                  label=h4('Select date range'),
                  start=min(before$Date),
                  end=max(before$Date),
                  min=min(before$Date),
                  max=max(before$Date)
                )
                #width=4,
                #height=110
              )
            ),
            fluidRow(
              box(
                plotlyOutput('distrib_indexprices', width='100%'),
                width=27
              ),
              box(
                checkboxGroupInput(
                  'distribcharts',
                  label=h4('Check to Compare'),
                  choices = distri.names,
                  selected= 'DJIA'
                )
              )
            )
          ), #before panel end
          
          tabPanel(
            'Crucial Moment',
            
            fluidRow(
              box(
                dateRangeInput(
                  'districDate',
                  label=h4('Select date range'),
                  start=min(crucial$Date),
                  end=max(crucial$Date),
                  min=min(crucial$Date),
                  max=max(crucial$Date)
                )
                #width=4,
                #height=110
              )
            ),
            fluidRow(
              box(
                plotlyOutput('distric_indexprices', width='100%'),
                width=27
              ),
              box(
                checkboxGroupInput(
                  'districcharts',
                  label=h4('Check to Compare'),
                  choices = distri.names,
                  selected= 'DJIA'
                )
              )
            )
            
          ), #crucial panel end
          
          tabPanel(
            'Upward (Historical) Moment',
            
            fluidRow(
              box(
                dateRangeInput(
                  'distriuDate',
                  label=h4('Select date range'),
                  start=min(upward$Date),
                  end=max(upward$Date),
                  min=min(upward$Date),
                  max=max(upward$Date)
                )
                #width=4,
                #height=110
              )
            ),
            fluidRow(
              box(
                plotlyOutput('distriu_indexprices', width='100%'),
                width=27
              ),
              box(
                checkboxGroupInput(
                  'distriucharts',
                  label=h4('Check to Compare'),
                  choices = distri.names,
                  selected= 'DJIA'
                )
              )
            )
            
          ) #Upward panel end
          
        )#tabset Panel end
        
),  #distribution tab item end
 
 
 ############################comparison tab###########################    

tabItem(tabName = "comparison",
        h4('Comparison of Major Indexes with Past History'),
        fluidRow(
          box(
            p('Welcome! This page highlights how unique Trump\'s win is, in the world stock markets.'),
               width=12
          )
        ),    
        
            fluidRow(
              box(
                selectInput(
                  'regionindex',
                  label='Select Region',
                  choices = region.names
                ),
                width=4,
                height=95
              ),
              
                box(
                selectInput(
                  'variable_name',
                  label='Select Variable',
                  choices = list(
                    'High' = 'one_yr_high',
                    'Percentage Change' = 'one_yr_percent_chg'
                  )
                ),
                width=4,
                height=95
              )
            ),
            
            fluidRow(
              box(
                plotlyOutput('comparison_indexprices', width='100%'),
                width=25
                )       
              )
        
),  #comparison tab item end

    tabItem(tabName = "about",
            h2('About'),
            fluidRow(
              
              box(
                'Code: ', a(href='mailto:jaislp3@gmail.com', 'Lakshmi Prabha Sudharsanom'), br(),
                'Data: ', a(href='http://markets.wsj.com/us', 'WSJ Market Data Centre'), br(),
                br(),
                'This project has no affiliation with Wall Street Journal.',
                'It\'s build on top of their freely',
                a(href='http://quotes.wsj.com/index/DJI/historical-prices', 'available data'),
                'as part of the', a(href='nycdatascience.com/data-science-bootcamp/', 'NYC Data Science Academy Data Science Bootcamp.')
                )
              )
          ) #tab item 'about' end 
    
    )# all tab items end
)#body end

))  #shinyUI & dashboard (first line code end)
