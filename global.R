library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(tidyquant)
library(plotly)
library(leaflet)
library(scales)

source('helpers.R')


us.names = c('DJ Total Stock Market', 'DJIA', 'Nasdaq', 'Russell 2000', 'S&P 500')

###################################Fresh start#############################
us_all_months = read.csv('./data/us_index.csv', stringsAsFactors=FALSE)
#reading from current directory

####################Formatting Date#############
us_all_months$Date = as.Date(us_all_months$Full_Date, format='%m/%d/%Y')

us_indexes = us_all_months %>%  select(Date,Open, High, Low, Close, Index) %>% 
  arrange(Date)

DJIA = us_indexes %>% filter(Index == 'DJIA')
###########################################################################
#############################Global##################################

global.names = c('DJ Global ex. U.S. (World)', 'DJ Global Index (World)', 
                 'Global Dow (Euro) (World)',  'Global Dow (world)' )

###################################Fresh start#############################
global_all_months = read.csv('./data/global_index.csv', stringsAsFactors=FALSE)
#reading from current directory

####################Formatting Date#############
global_all_months$Date = as.Date(global_all_months$Full_Date, format='%m/%d/%Y')

global_indexes = global_all_months %>%  select(Date,Open, High, Low, Close, Index) %>% 
  arrange(Date)
#######################################################################################

###########################################################################
#############################Asia##################################

asia.names = c("Asia Dow","Australia  S&P ASX", 
               "Australia All Ordinaries", "China  DJ Shanghai", 
               "China  H-Share Index", "China  Shanghai 50" , 
               "China  Shanghai Composite (Major)", "China Shenzhen Composite", 
               "Hong Kong  Hang Seng (Major)", "India  S&P BSE Sensex (Major)", 
               "India  S&P CNX Nifty", "Indonesia  JSX BISNIS 27", 
               "Indonesia  JSX Index (Composite)", "Indonesia  JSX Islamic",
               "Indonesia  JSX LQ-45", "Indonesia  PEFINDO-25", 
               "Japan Nikkei 225  (Major)", "Japan TOPIX Index", 
               "Malaysia  FTSE Bursa Malaysia KLCI", "New Zealand  NZX 50", 
               "Philippines  PSE Composite", "S. Korea  KOSPI 100", 
               "S. Korea  KOSPI 200 Composite", "S. Korea  KOSPI 50", 
               "S. Korea  KOSPI", "Singapore  FTSE Straits Times", 
               "Taiwan  TAIEX (Major)", "Thailand SET" )


###################################Fresh start#############################
asia_all_months = read.csv('./data/asia_index.csv', stringsAsFactors=FALSE)
#reading from current directory

####################Formatting Date#############
asia_all_months$Date = as.Date(asia_all_months$Full_Date, format='%m/%d/%Y')

asia_indexes = asia_all_months %>%  select(Date, Open, High, Low, Close, Index) %>% 
  arrange(Date)
#######################################################################################
#############################Europe##################################

europe.names = c("Austria  ATX", "Belgium  Bel-20 (Major)", 
                 "Denmark  OMX Copenhagen 20", "Estonia  OMX Tallinn", 
                 "Euro Stoxx (Euro Zone)", "Euro Stoxx 50(Euro Zone))", 
                 "Europe Dow","Finland  OMX Helsinki", 
                 "France CAC 40 (Major)", "Germany  DAX (Major)", 
                 "Greece  Athex", "Greece  FTSE ATHEX 20", 
                 "Iceland  OMX Iceland All-Share", "Ireland  ISEQ Overall",
                 "Italy  FTSE MIB (Major)", "Latvia  OMX Riga",
                 "Lithuania  OMX Vilnius", "Netherlands  AEX",
                 "Norway  OSE All-Share", "Portugal  PSI 20", 
                 "Spain  IBEX 35" , "Stoxx Europe 50 (Europe))", 
                 "Stoxx Europe 600(Major) (Europe))", "Sweden OMX Stockholm", 
                 "Switzerland  Swiss Market", "UK  FTSE 250", 
                 "UK  FTSE AIM All-Share", "UK FTSE 100(Major)" )

###################################Fresh start#############################
europe_all_months = read.csv('./data/europe_index.csv', stringsAsFactors=FALSE)
#reading from current directory

####################Formatting Date#############
europe_all_months$Date = as.Date(europe_all_months$Full_Date, format='%m/%d/%Y')

europe_indexes = europe_all_months %>%  
  select(Date, Open, High, Low, Close, Index) %>% 
  arrange(Date)
#######################################################################################
#############################Americas##################################
americas.names = c("Argentina  MerVal (Major)",  "Brazil  Bovespa (Major)",
                   "Canada  S&P TSX (Major)" , "Chile  Santiago IPSA", 
                   "Mexico IPC All-Share")  

###################################Fresh start#############################
americas_all_months = read.csv('./data/americas_index.csv', stringsAsFactors=FALSE)
#reading from current directory 

####################Formatting Date#############
americas_all_months$Date = as.Date(americas_all_months$Full_Date, format='%m/%d/%Y')

americas_indexes = americas_all_months %>%  
  select(Date, Open, High, Low, Close, Index) %>% 
  arrange(Date)
#######################################################################################

#############################Others##################################


others.names = c("DJ Islamic Market Titans", "S. Africa  FTSE JSE Africa All Share")

###################################Fresh start#############################
others_all_months = read.csv('./data/others_index.csv', stringsAsFactors=FALSE)
#reading from current directory

####################Formatting Date#############
others_all_months$Date = as.Date(others_all_months$Full_Date, format='%m/%d/%Y')

others_indexes = others_all_months %>%  
  select(Date, Open, High, Low, Close, Index) %>% 
  arrange(Date)
#######################################################################################
###########Various Periods###############
before = DJIA %>% select(Date) %>% filter(Date<'2016-10-15')
crucial = DJIA %>% select(Date) %>% 
  filter(Date>'2016-10-15'& Date <'2017-01-01')
upward = DJIA %>% select(Date) %>% filter(Date>'2017-01-01')

#############################Distribution#################################
#distri.names=c(us.names, global.names, asia.names, europe.names, americas.names, others.names)
distri.names = c(us.names[-1], global.names[3:4], asia.names[c(7,9,10,17,20,27)], europe.names[c(2,9,10,15,23,25,28)], americas.names[-4], others.names[2])
distri_indexes = rbind(us_indexes, global_indexes)  
distri_indexes =rbind(distri_indexes, asia_indexes)
distri_indexes =rbind(distri_indexes, europe_indexes)
distri_indexes =rbind(distri_indexes, americas_indexes)
distri_indexes =rbind(distri_indexes, others_indexes)

#######################Past History####################################
region.names = c('Global', 'Asia Pacific', 'Europe', 'Americas', 'Other')

all_yrs = read.csv('./data/all_yrs_index.csv', stringsAsFactors=FALSE)
#reading from current directory
###cleaning
all_yrs = all_yrs %>% 
  filter(!is.na(one_yr_percent_chg)&!is.na(one_yr_high))
all_yrs$year =as.character(all_yrs$year)

#filtering major indexes
#major= c("The Global Dow  (World)", "The Global Dow Euro (World)",  "DJ Global Index (World)",  "DJ Global ex U.S. (World)",  "S & P/ASX 200 (Australia)",  "Shanghai Composite (China)",  "Hang Seng (Hong Kong)",  "S & P BSE Sensex (India)", "Nikkei 225 (Japan)",  "Weighted (Taiwan)", "Stoxx Europe 600 (Europe)", "Bel-20 (Belgium)", "CAC 40 (France)",  "DAX (Germany)", "FTSE MIB (Italy)", "SX All Share (Sweden)", "Swiss Market (Switzerland)", "FTSE 100 (U.K.)", "Merval (Argentina)", "Sao Paulo Bovespa (Brazil)", "S & P/TSX Comp (Canada)", "Santiago IPSA (Chile)", "IPC All-Share (Mexico)",  "Tel Aviv (Israel)", 
#"Johannesburg All Share (South Africa)" )

major= c("The Global Dow  (World)", "The Global Dow Euro (World)",    "Shanghai Composite (China)",  "Hang Seng (Hong Kong)",  "S & P BSE Sensex (India)",   "Weighted (Taiwan)",  "Bel-20 (Belgium)", "CAC 40 (France)",  "DAX (Germany)",  "Swiss Market (Switzerland)", "FTSE 100 (U.K.)", "Merval (Argentina)", "Sao Paulo Bovespa (Brazil)", "S & P/TSX Comp (Canada)",  "IPC All-Share (Mexico)",  "Johannesburg All Share (S.A.)" )

all_yrs = all_yrs %>% filter(Index_Country %in% major)
###############Map##############################################
stock.address = read.csv('./data/stock.address.csv', stringsAsFactors = FALSE)
stock.address$popuptext = paste(stock.address$Index, stock.address$addresses, sep='; ' )
