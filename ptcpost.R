setwd("D:\\Google儲存空間\\華致資訊\\資料分析\\廢氣爐分析\\Rapi")

#install.packages('httr')
library(httr)

dt = read.csv("./data.csv")

url <- paste("http://ifabtw.eastasia.cloudapp.azure.com/Thingworx/Things/ExhaustGasFurnaceThing/Services/PushDataFromPost")

i = 758
repeat{
  url_param <- sprintf("%s?TI_5012=%.2f&AA_2001=%.2f&AA_3001=%.2f&AA_5001=%.2f&AA_8001=%.2f&AA_8002=%.2f&FQI_501A=%.2f",
                 "http://ifabtw.eastasia.cloudapp.azure.com/Thingworx/Things/ExhaustGasFurnaceThing/Services/PushDataFromPost",
                 dt[i,"TI_5012"], #TI_5012
                 dt[i,"AA_2001"], #AA_2001
                 dt[i,"AA_3001"], #AA_3001
                 dt[i,"AA_5001"], #AA_5001
                 dt[i,"AA_8001"], #AA_8001
                 dt[i,"AA_8002"], #AA_8002
                 dt[i,"FQI_501A"]) #FQI_501A
  
  POST(url = url_param,
       add_headers(.headers = c("appKey" = "c9520faf-284e-4fe1-b2ec-e3f48b500d7c","Content-Type"="application/json")))
  
  i = i + 1
  if(i == 21136){i = 1}
  print(i)
  Sys.sleep(60)
}


