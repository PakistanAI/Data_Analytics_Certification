# load data
load("df_stormData_raw.RData")

# change vector class
df_stormData_raw$EVTYPE <- as.character(df_stormData_raw$EVTYPE)

# check for a particular term in our vector (column)
unique(grep('winter', df_stormData_raw$EVTYPE, value = TRUE, ignore.case = TRUE))
# include in results with 'winter' keyword results with 'sleet' keyword
unique(grep('(winter)|(sleet)', df_stormData_raw$EVTYPE, 
            value = TRUE, ignore.case = TRUE))
# exclude from the above results, string that contain 'snow' or 'blizzard'
setdiff(unique(grep('(winter)|(sleet)', df_stormData_raw$EVTYPE, 
                    value = TRUE, ignore.case = TRUE)),
        unique(grep('(snow)|(blizzard)', df_stormData_raw$EVTYPE, 
                    value = TRUE, ignore.case = TRUE)))

# assign to indices that contain the words 'winter' or 'sleet' but do not contain
# 'snow' or 'blizzard', the word 'WINTER WEATHER'
df_stormData_raw$EVTYPE[setdiff(grep('(winter)|(sleet)', df_stormData_raw$EVTYPE, 
                                     ignore.case = TRUE),
                                grep('(snow)|(blizzard)', df_stormData_raw$EVTYPE, 
                                     ignore.case = TRUE))] <- 'WINTER WEATHER'