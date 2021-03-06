#Code for census data
block_loc <- read.csv("../Data/Census_2015/census_block_loc.csv")
head(block_loc)
summary(block_loc)
nrow(block_loc)
#This data frame has 5 columns (Latitude, longitude and block code for a block as well as its county and state) and 38,396 rows


#Checking if there are any missing or infinite 
missing_val = any(is.na(block_loc))
#There are no missing values in the dataframe

#Checking for unique values 
unique_state <- unique(block_loc$State)
unique_county <- unique(block_loc$County)
unique_block <- unique(block_loc$BlockCode)
#There are 38,936 locations in 20,406 blocks which are in 15 counties in NJ and NY in the data

#Splitting dataframes into different states and then different counties
library(dplyr)
block_loc_NY <- filter(block_loc, State == "NY")
#This has 24,240 locations
block_loc_NJ <- filter(block_loc, State == "NJ")
#This has 14,156 locations
unique(block_loc_NY$County)
block_loc_Richmond <- filter(block_loc, County == "Richmond") #3933 locations
block_loc_Queens <- filter(block_loc, County == "Queens") #6872 locations
block_loc_Nassau <- filter(block_loc, County == "Nassau") #4906 locations
block_loc_Kings <- filter(block_loc, County == "Kings") #3729 locations
block_loc_NewYork <- filter(block_loc, County == "New York") #1295 locations
block_loc_Bronx <- filter(block_loc, County == "Bronx") #2224 locations
block_loc_Westchester <- filter(block_loc, County == "Westchester") #1281 locations

unique(block_loc_NJ$County)
block_loc_Middlesex <- filter(block_loc, County == "Middlesex") #760 locations
block_loc_Monmouth <- filter(block_loc, County == "Monmouth") #1117 locations
block_loc_Union<- filter(block_loc, County == "Union") #1553 locations
block_loc_Hudson <- filter(block_loc, County == "Hudson") #2400 locations
block_loc_Essex <- filter(block_loc, County == "Essex") #3302 locations
block_loc_Bergen <- filter(block_loc, County == "Bergen") #3456 locations
block_loc_Passaic <- filter(block_loc, County == "Passaic") #1539 locations
block_loc_Morris <- filter(block_loc, County == "Morris") #29 locations

#importing nyc census tracts file
nyc_tracts <- read.csv("../Data/Census_2015/nyc_census_tracts.csv")
head(nyc_tracts)

#Splitting this into different dataframes
nyc_tracts_sex <- select(nyc_tracts, CensusTract, County, Borough, TotalPop, Men, Women) #Actual number of men and women in population
nyc_tracts_race <- select(nyc_tracts, CensusTract, County, Borough, TotalPop, Hispanic, White, Black, Native, Asian) #Percentage of different race in population
nyc_tracts_income <- select(nyc_tracts, CensusTract, County, Borough, TotalPop, Citizen, Professional, Service, Office, Construction, Production) #Percentage of different jobs
nyc_tracts_jobs <- select(nyc_tracts, CensusTract, County, Borough, TotalPop, Citizen, Income, IncomeErr, IncomePerCap, IncomePerCapErr, Poverty, ChildPoverty) #Income and Poverty data
nyc_tracts_commute <- select(nyc_tracts, CensusTract, County, Borough, TotalPop, Citizen, Drive, Carpool, Transit, Walk, OtherTransp, WorkAtHome, MeanCommute) #Percentage of different ways that people use for commuting. Don't know MeanCommute, maybe it is the percentage of people commuting every day
nyc_tracts_employment <- select(nyc_tracts, CensusTract, County, Borough, TotalPop, Citizen, Employed, PrivateWork, PublicWork, SelfEmployed, FamilyWork, Unemployment)#Percentage of different kinds of employment






