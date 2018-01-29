# server.R

shinyServer(function(input, output, session) {

#######################USA#####################################
  ###map
  usaMapReact = reactive({
    regionschart('USA')
  })
  
  output$usaMap = renderLeaflet(
    usaMapReact()
  )
  ###genral
  usindexReact = reactive({
     indexChart(us_indexes, input$usindex, input$usDate[1], 
                 input$usDate[2], input$uscharts)
    })
  
  output$us_indexprices = renderPlotly({
    usindexReact()
    })
  ###before
  usbeforeindexReact = reactive({
    indexChart(us_indexes, input$usbindex, input$usbDate[1], 
               input$usbDate[2], input$usbcharts)
  })
  
  output$usb_indexprices = renderPlotly({
    usbeforeindexReact()
  })
  ###crucial
  uscrucialindexReact = reactive({
    indexChart(us_indexes, input$uscindex, input$uscDate[1], 
               input$uscDate[2], input$usccharts)
  })
  
  output$usc_indexprices = renderPlotly({
    uscrucialindexReact()
  })
  ###upward
  usupwardindexReact = reactive({
    indexChart(us_indexes, input$usuindex, input$usuDate[1], 
               input$usuDate[2], input$usucharts)
  })
  
  output$usu_indexprices = renderPlotly({
    usupwardindexReact()
  })
  
  
  
####################global#####################################
  globalindexReact = reactive({
    indexChart(global_indexes, input$globalindex, input$globalDate[1], 
                 input$globalDate[2], input$globalcharts)
    })
  
  output$global_indexprices = renderPlotly({
    globalindexReact()
    })
  ###before
  globalbeforeindexReact = reactive({
    indexChart(global_indexes, input$globalbindex, input$globalbDate[1], 
               input$globalbDate[2], input$globalbcharts)
  })
  
  output$globalb_indexprices = renderPlotly({
    globalbeforeindexReact()
  })
  ###crucial
  globalcrucialindexReact = reactive({
    indexChart(global_indexes, input$globalcindex, input$globalcDate[1], 
               input$globalcDate[2], input$globalccharts)
  })
  
  output$globalc_indexprices = renderPlotly({
    globalcrucialindexReact()
  })
  ###upward
  globalupwardindexReact = reactive({
    indexChart(global_indexes, input$globaluindex, input$globaluDate[1], 
               input$globaluDate[2], input$globalucharts)
  })
  
  output$globalu_indexprices = renderPlotly({
    globalupwardindexReact()
  })
  
  
  ####################Asia Pacific#####################################
  ###map
  asiaMapReact = reactive({
    regionschart('Asia Pacific')
  })
  
  output$asiaMap = renderLeaflet(
    asiaMapReact()
  )
  
  ###genral
    asiaindexReact = reactive({
    indexChart(asia_indexes, input$asiaindex, input$asiaDate[1], 
               input$asiaDate[2], input$asiacharts)
  })
  
  output$asia_indexprices = renderPlotly({
    asiaindexReact()
  })
  ###before
  asiabeforeindexReact = reactive({
    indexChart(asia_indexes, input$asiabindex, input$asiabDate[1], 
               input$asiabDate[2], input$asiabcharts)
  })
  
  output$asiab_indexprices = renderPlotly({
    asiabeforeindexReact()
  })
  ###crucial
  asiacrucialindexReact = reactive({
    indexChart(asia_indexes, input$asiacindex, input$asiacDate[1], 
               input$asiacDate[2], input$asiaccharts)
  })
  
  output$asiac_indexprices = renderPlotly({
    asiacrucialindexReact()
  })
  ###upward
  asiaupwardindexReact = reactive({
    indexChart(asia_indexes, input$asiauindex, input$asiauDate[1], 
               input$asiauDate[2], input$asiaucharts)
  })
  
  output$asiau_indexprices = renderPlotly({
    asiaupwardindexReact()
  })
  
  
  ####################Europe#####################################
  ###map
  europeMapReact = reactive({
    regionschart('Europe')
  })
  
  output$europeMap = renderLeaflet(
    europeMapReact()
  )
  
  ###genral
    europeindexReact = reactive({
    indexChart(europe_indexes, input$europeindex, input$europeDate[1], 
               input$europeDate[2], input$europecharts)
  })
  
  output$europe_indexprices = renderPlotly({
    europeindexReact()
  })
  ###before
  europebeforeindexReact = reactive({
    indexChart(europe_indexes, input$europebindex, input$europebDate[1], 
               input$europebDate[2], input$europebcharts)
  })
  
  output$europeb_indexprices = renderPlotly({
    europebeforeindexReact()
  })
  ###crucial
  europecrucialindexReact = reactive({
    indexChart(europe_indexes, input$europecindex, input$europecDate[1], 
               input$europecDate[2], input$europeccharts)
  })
  
  output$europec_indexprices = renderPlotly({
    europecrucialindexReact()
  })
  ###upward
  europeupwardindexReact = reactive({
    indexChart(europe_indexes, input$europeuindex, input$europeuDate[1], 
               input$europeuDate[2], input$europeucharts)
  })
  
  output$europeu_indexprices = renderPlotly({
    europeupwardindexReact()
  })
  
  
  ####################Americas#####################################
  ###map
  americasMapReact = reactive({
    regionschart('Americas')
  })
  
  output$americasMap = renderLeaflet(
    americasMapReact()
  )
  
  ###genral
  americasindexReact = reactive({
    indexChart(americas_indexes, input$americasindex, input$americasDate[1], 
               input$americasDate[2], input$americascharts)
  })
  
  output$americas_indexprices = renderPlotly({
    americasindexReact()
  })
  ###before
  americasbeforeindexReact = reactive({
    indexChart(americas_indexes, input$americasbindex, input$americasbDate[1], 
               input$americasbDate[2], input$americasbcharts)
  })
  
  output$americasb_indexprices = renderPlotly({
    americasbeforeindexReact()
  })
  ###crucial
  americascrucialindexReact = reactive({
    indexChart(americas_indexes, input$americascindex, input$americascDate[1], 
               input$americascDate[2], input$americasccharts)
  })
  
  output$americasc_indexprices = renderPlotly({
    americascrucialindexReact()
  })
  ###upward
  americasupwardindexReact = reactive({
    indexChart(americas_indexes, input$americasuindex, input$americasuDate[1], 
               input$americasuDate[2], input$americasucharts)
  })
  
  output$americasu_indexprices = renderPlotly({
    americasupwardindexReact()
  })
  
  
  
  ####################Others#####################################
  ###map
  othersMapReact = reactive({
    regionschart('Others')
  })
  
  output$othersMap = renderLeaflet(
    othersMapReact()
  )
  
  ###genral
  othersindexReact = reactive({
    indexChart(others_indexes, input$othersindex, input$othersDate[1], 
               input$othersDate[2], input$otherscharts)
  })
  
  output$others_indexprices = renderPlotly({
    othersindexReact()
  })
  ###before
  othersbeforeindexReact = reactive({
    indexChart(others_indexes, input$othersbindex, input$othersbDate[1], 
               input$othersbDate[2], input$othersbcharts)
  })
  
  output$othersb_indexprices = renderPlotly({
    othersbeforeindexReact()
  })
  ###crucial
  otherscrucialindexReact = reactive({
    indexChart(others_indexes, input$otherscindex, input$otherscDate[1], 
               input$otherscDate[2], input$othersccharts)
  })
  
  output$othersc_indexprices = renderPlotly({
    otherscrucialindexReact()
  })
  ###upward
  othersupwardindexReact = reactive({
    indexChart(others_indexes, input$othersuindex, input$othersuDate[1], 
               input$othersuDate[2], input$othersucharts)
  })
  
  output$othersu_indexprices = renderPlotly({
    othersupwardindexReact()
  })
#################################################################### 
########################Distri####################################
  ###genral
  distriindexReact = reactive({
    distriindexChart(distri_indexes, input$districharts, input$distriDate[1], 
               input$distriDate[2])
  })
  
  output$distri_indexprices = renderPlotly({
    distriindexReact()
  })
  ###before
  distribeforeindexReact = reactive({
    distriindexChart(distri_indexes, input$distribcharts, input$distribDate[1], 
               input$distribDate[2])
  })
  
  output$distrib_indexprices = renderPlotly({
    distribeforeindexReact()
  })
  ###crucial
  districrucialindexReact = reactive({
    distriindexChart(distri_indexes, input$districcharts, input$districDate[1], 
               input$districDate[2])
  })
  
  output$distric_indexprices = renderPlotly({
    districrucialindexReact()
  })
  ###upward
  distriupwardindexReact = reactive({
    distriindexChart(distri_indexes, input$distriucharts, input$distriuDate[1], 
               input$distriuDate[2])
  })
  
  output$distriu_indexprices = renderPlotly({
    distriupwardindexReact()
  })
  
  
  ####################Comparison#####################################
  comparisonindexReact = reactive({
    comparisonindexChart(all_yrs, input$regionindex, input$variable_name)
  })
  
  output$comparison_indexprices = renderPlotly({
    comparisonindexReact()
  })
  
  
  } ) #########first line end
