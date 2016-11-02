library(rhdfs)
library(jsonlite)
hdfs.init()

head(
  data.frame(do.call(
    rbind,
    lapply(
      unlist(sapply(
        head(hdfs.ls("/user/hive/warehouse/4ml.db/R/d_bolome_orders", recurse=T)$file),
        function(it) hdfs.read.text.file(it),
        USE.NAMES = FALSE
      )),
      function(it) fromJSON(it)
    )
  ))
)
