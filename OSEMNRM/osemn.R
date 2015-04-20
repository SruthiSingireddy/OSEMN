#install
install.packages("jsonlite", repos="http://cran.r-project.org")
install.packages('curl')
#load
library(jsonlite)

library(httr)
library(RCurl) 
#get data
javascript <- fromJSON("https://api.github.com/search/repositories?q=language:javascript")
python <- fromJSON("https://api.github.com/search/repositories?q=language:python")
class(javascript)
#dim(data1)
#str(data1)
#data1$items
#http://stackoverflow.com/questions/17659353/json-format-to-csv-format-conversion-using-r
#javascript
tmp <- lapply( javascript , function(u) 
  lapply(u, function(x) if(is.null(x)) NA else x)
)
tmp <- lapply( tmp, as.data.frame )
tmp <- do.call( rbind, tmp )
dim(tmp)
dim(as.data.frame(tmp))
write.csv(tmp, file = "javascripts.csv")

#python
tmppython <- lapply( python , function(u) 
  lapply(u, function(x) if(is.null(x)) NA else x)
)
tmppython <- lapply( tmppython, as.data.frame )
tmppython <- do.call( rbind, tmppython )
dim(tmppython)
dim(as.data.frame(tmppython))
write.csv(tmppython, file = "python.csv")



