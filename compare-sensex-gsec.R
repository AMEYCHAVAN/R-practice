  library(ggplot2)
  library(reshape2)
  library(tidyr)
  library(dplyr)
  
  setwd('/home/b2xcare.intern/achavan/R-sabd')
  
  getwd() # prints current working directory
   mydata =read.csv("CSVForMonth.csv", header = TRUE)
   head(mydata)
   
     mydata$Month <- as.Date( mydata$Month, '%d-%B-%Y')
      head(mydata)
        
        
  # chart_data <- melt(mydata, id=c("Month","Sensex","Gsec"))
 #names(chart_data) <- c('x', 'func', 'value')
   df <- mydata %>%
     select(Month, Sensex.1000,Gsec.1000) %>%
     gather(key = "variable", value = "value", -Month)
   
   head(df)
   
   
    test_data_long <- melt(df, id="Month")  # convert to long format
    head(test_data_long)
     

       ggplot(df, aes(x = Month, y = value ,group = 1)) + 
        geom_line(aes(color = variable), size = 1) +
        
     scale_color_manual(values = c("#00AFBB", "#E7B800")) +
     labs(x = "Date", 
          y = "Rupees",
          title = "1000 rs incestment will increse to") 
   + coord_flip()
  +     theme_minimal()
 
   
   
   
   # CLEAN UP #################################################
       
       prescription1 <- data.frame(
         mydata$Month,
         amt.Change = mydata$Sensex.1000
       )
       
       prescription2 <- data.frame(
         mydata$Month,
         amt.Change = mydata$Gsec.1000
       )
       
       cols = c("dates", "Amount")
       colnames(prescription1) = cols
       colnames(prescription2) = cols
       ggplot() + 
         geom_line(data = prescription1, aes(x = dates, y = Amount), color = "blue") +
         geom_line(data = prescription2, aes(x = dates, y = Amount), color = "red") +
         xlab('Dates') +
         ylab('Amount.change')
  