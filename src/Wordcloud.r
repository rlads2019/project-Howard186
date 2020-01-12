#twitter API authorization process
consumer_key <- "NE7CD02PNt7nAxQ1cTVlFxRf7"
consumer_secret <-"VpZwEaeN4cRRK64VxBZhKDCFZyVyOeyofOruZRqCM7BO0bs3ai"
access_token <- "1207590157643202560-Tg2SdoeuD7CIg9LCYkVhNnqsFPhREX"
access_secret <- "qvjmT7i4uWgIGKHZUfakRuWhiiE5zzDejKMhOprIE8BGx"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


#hongkong
#search examples #1000筆資料
hongkong_tweets <- searchTwitter("hongkong", lang="en", n=1000, resultType = "recent")

#convert list to vector
hongkong_tweets_text <- sapply(hongkong_tweets, function(x) x$getText())

#create corpus from vector od tweets
hongkong_corpus <- Corpus(VectorSource(hongkong_tweets_text))
hongkong_corpus
inspect(hongkong_corpus[1])

#cleaning data
hongkong_clean <- tm_map(hongkong_corpus, removePunctuation)
hongkong_clean <- tm_map(hongkong_clean, content_transformer(tolower))
hongkong_clean <- tm_map(hongkong_clean, removeWords, stopwords("english"))
hongkong_clean <- tm_map(hongkong_clean, removeNumbers)
hongkong_clean <- tm_map(hongkong_clean, stripWhitespace)
hongkong_clean <- tm_map(hongkong_clean, removeWords, c("hongkong","the","hong","kong"))   

#create a wordcloud
wordcloud(hongkong_clean, random.order=F, scale = c(3,0.5))




#greta thunberg
#search examples 
gretathunberg_tweets <- searchTwitter("greta+thunberg", lang="en", n=1000, resultType = "recent")

#convert list to vector
gretathunberg_tweets_text <- sapply(gretathunberg_tweets, function(x) x$getText())

#create corpus from vector od tweets
gretathunberg_corpus <- Corpus(VectorSource(gretathunberg_tweets_text))
gretathunberg_corpus
inspect(gretathunberg_corpus[1])

#cleaning data
gretathunberg_clean <- tm_map(gretathunberg_corpus, removePunctuation)
gretathunberg_clean <- tm_map(gretathunberg_clean, content_transformer(tolower))
gretathunberg_clean <- tm_map(gretathunberg_clean, removeWords, stopwords("english"))
gretathunberg_clean <- tm_map(gretathunberg_clean, removeNumbers)
gretathunberg_clean <- tm_map(gretathunberg_clean, stripWhitespace)
gretathunberg_clean <- tm_map(gretathunberg_clean, removeWords, c("greta","thunberg","gretathunberg","the","@gretathunberg"))   

#create a wordcloud
wordcloud(gretathunberg_clean, random.order=F, scale = c(3,0.5))


