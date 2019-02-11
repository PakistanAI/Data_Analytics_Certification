df_testDataFrame <- data.frame(university = c('NED', 'NRD', 'Bahria', 'bahria',
                                              'Ku', 'ned', 'KU', 'BAHRIA', 'ku',
                                              'Ned'), score = runif(10, 50, 100))

# to check values with regex
grep('NED', df_testDataFrame$university, value = TRUE)
# to get indices
grep('NED', df_testDataFrame$university)

# to check values with fuzzy matching
agrep('NED', df_testDataFrame$university, value = TRUE)
# with ignore case
agrep('NED', df_testDataFrame$university, value = TRUE, ignore.case = TRUE)
# to get indices
agrep('NED', df_testDataFrame$university, ignore.case = TRUE)

# to replace all variations of NED with actual spelling
df_testDataFrame$university[agrep('NED', df_testDataFrame$university, 
                                  ignore.case = TRUE)] <- 'NED'

# the square brackets are used to access/assign to specific elements of a vector
# example:
df_testDataFrame$university[4]
df_testDataFrame$university[c(1, 3)]

# note: first change the data type of the event type column in the storm data
# dataset from factor to character with the as.character function. Then look
# through the data for exploring possibilities of cleasning. After cleaning
# change it back to factor
