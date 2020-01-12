library(rtweet)
library(dplyr)
library(ggplot2)

#twetter api access
twitter_token <- create_token(app="jacky112",
                              consumer_key="7tKcOFFqDSiEMLvx67Ddk5yPv",
                              consumer_secret="Aj9I8fbvdZ8VjNBJ7BuOFOwvb0UiNsrWREtpn3FgBH4LJQWxdT",
                              access_token="1210094922147061760-DX54BBfo0BADsWb0GpPmu2KwAkrcwW",
                              access_secret="3o7cBXJVQ9OxWP6OUuKEOiKHuPJJNSD7JiP2D1uAJaROB",
                              set_renv=TRUE)

#search tweets - HK
Hong_Kong <- search_tweets("HongKong",n=3200)

#select column
info <- Hong_Kong%>%
        select(created_at,retweet_count)%>%
        arrange(created_at)

#create chart
protest <- ggplot(info)+
           geom_line(mapping=aes(x=created_at,y=retweet_count),color=3)

protest







#search tweets - greta
GretaThunberg <- search_tweets("GretaThunberg",n=3200)

#select column
info2 <- GretaThunberg%>%
         select(created_at,favorite_count,retweet_count)%>%
         arrange(created_at)

#create chart
climate <- ggplot(info2)+
           geom_line(mapping=aes(x=created_at,y=retweet_count),color=3)

climate














