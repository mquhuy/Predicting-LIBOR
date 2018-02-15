df <- as.data.frame(df)
require('forecast')
fit <- Arima(df['Return'],order=c(0,1,1))

s <-fit
capture.output(s,file="G:/My Drive/Schooling/EMF 2017/Term paper/Data/Results/Model Summary.txt")