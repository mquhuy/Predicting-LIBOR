df <- as.data.frame(df)

df$Return <- as.double(df$Return)

rownames(df) = df$Date
df$Date <- NULL
df

armaResult <- c()

len <- nrow(df)

require('forecast')


for (p in seq(0,6)){
  for (q in seq(0,6)) {
    for (i in seq(0,3)){
      tryCatch({
        fit <- Arima(df$Return,order=c(p,i,q))
        print("p = ")
        print(p)
        print("i = ")
        print(i)
        print("q = ")
        print(q)
        aic <- fit$aic/len
        bic <- fit$bic/len
        armaResult <- rbind(armaResult,c(p,i,q,aic,bic))ar  
      },error=function(e){})
    }
      
  }
}
colnames(armaResult) <-c("p","i","q","AIC","BIC")


armaResult
