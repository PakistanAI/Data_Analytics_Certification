df_storeData <- read.csv("rfmData.csv")
library(tidyverse)
df_storeData %>% 
  mutate(subtotal = Quantity * UnitPrice) -> df_storeData1

df_storeData1$InvoiceDate <- as.Date(as.character(df_storeData1$InvoiceDate), format = "%m/%d/%Y")
# if the start of the string can be captured by the format we don't need to worry about the time

df_storeData1 %>% 
  group_by(CustomerID, InvoiceNo) %>% 
  summarise(invoiceDate = first(InvoiceDate), total = sum(subtotal)) %>% 
  filter(!is.na(CustomerID))-> df_invoices

library(lubridate)

df_invoices %>% 
  group_by(CustomerID) %>% 
  summarise(dateAcquired = min(invoiceDate), 
            monthAcquired = format.Date(min(invoiceDate), format = "%b-%y"),
            span_months = ceiling(days(round(max(invoiceDate) - min(invoiceDate)))$day/30)) -> df_clscRtn

# Finally using loop here. There might be some better lighter-on-CPU ways to do it
# in R, but to demonstrate lapply:
# We loop over each customer Id
lst_rollRetention <- lapply(df_clscRtn$CustomerID, function(cId){
  # isolate each customer's row as a dataframe
  df_user <- subset(df_clscRtn, CustomerID == cId)
  # expand that dataframe by filling in the number of months between the month acquired
  # and the last month
  df_user <- data.frame(customerId = df_user$CustomerID, monthAcquired = df_user$monthAcquired,
                        monthsRetained = 0:df_user$span_months, stringsAsFactors = FALSE)
  # return the resulting dataframe as an element of the list returned by lapply
  return(df_user)
})

# now we bind all the elements of the list into one long dataframe
df_rollRetention <- do.call(rbind, lst_clscRetention)

df_rollRetention %>% 
  group_by(monthAcquired, monthsRetained) %>% 
  count() -> df_monthlyNumbers

df_monthlyNumbers %>% 
  group_by(monthAcquired) %>% 
  mutate(proportionRetained = round((n/max(n))*100)) -> df_rollRetention_final
