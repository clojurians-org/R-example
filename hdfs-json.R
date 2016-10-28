library(rhdfs)
library(jsonlite)
hdfs.init()
test.json.path="/user/hive/warehouse/4ml.db/test.json"
order <- data.frame(do.call(
           rbind,
           lapply(hdfs.read.text.file(test.json.path), function(it) fromJSON(it))
         ))
