install.packages("rtweet")
library(rtweet)
library(ggmap)
library(tidyverse)

#Google API
register_google(key = "AIzaSyAOYjvvwkYxqM5lVSxDtdTAd_kNieQT964", write = TRUE)


#爬10000則有「＃hongkong」的貼文，找location
hongkong<- search_tweets("#hongkong",10000)
user_info <- lookup_users(unique(hongkong$user_id))
discard(user_info$location, `==`, "") %>% 
  ggmap::geocode() -> coded

coded$location <- discard(user_info$location, `==`, "")
user_info <- left_join(user_info, coded, "location")

#篩選出locaiotn不為空白的值
tag_hkk_location <- user_info %>%
  select(location) %>%
  filter(location !="")

#計算「相同發訊位置」的貼文
tag_hkk_location <- as.data.frame(table(tag_hkk_location$location))
#欄位「Var1」改成「Location」
colnames(tag_hkk_location)[1] <- "Location"

#按照tag次數由大到小排序
tag_hkk <- tag_hkk_location %>% 
  arrange(desc(Freq)) 

#取前10
tag_hkk <- tag_hkk[1:10, 1:2]
tag_hkk             

#畫出圖形
ggplot(tag_hkk)+
  geom_col(mapping = aes(x = Location, y = Freq))




#爬10000則有「#gretathunberg」的貼文，找location
greta <- search_tweets("#gretathunberg",10000)
user_info <- lookup_users(unique(greta$user_id))
discard(user_info$location, `==`, "") %>% 
  ggmap::geocode() -> coded

coded$location <- discard(user_info$location, `==`, "")
user_info <- left_join(user_info, coded, "location")

#篩選出locaiotn不為空白的值
tag_greta_location <- user_info %>%
  select(location) %>%
  filter(location !="")

#計算「相同發訊位置」的貼文
tag_greta_location <- as.data.frame(table(tag_greta_location$location))

#欄位「Var1」改成「Location」
colnames(tag_greta_location)[1] <- "Location"

#按照tag次數由大到小排序
tag_greta <- tag_greta_location %>% 
  arrange(desc(Freq)) 

#取前10
tag_greta <- tag_greta[1:10, 1:2]
tag_greta              

#作圖
ggplot(tag_greta)+
  geom_col(mapping = aes(x = Location, y = Freq))


