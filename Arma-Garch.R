library(readxl)
df <- read_xls('Results/in-sample.xls')
df <- as.data.frame(df)

rownames(df) = df$Date
df$Date <- NULL

library(rugarch)
model=ugarchspec(variance.model = list(model = "sGARCH", garchOrder= c(1,1)), mean.model = list(armaOrder = c(4,4), include.mean = TRUE), distribution.model = "norm")

outS <- 252

modelfit=ugarchfit(spec=model,data=diff(df$Return,1),out.sample = outS)

modelfor = ugarchforecast(fitORspec = modelfit, data=NULL, n.ahead=1, n.roll=outS)
forecast = fitted(modelfor)

write.csv(forecast,"Results/arma-garch-forecast.csv")

s <-modelfit
capture.output(s,file="Results/ARMA-GARCH Model Summary.txt")
