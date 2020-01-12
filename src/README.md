
##  Rscript 說明
要重置此專案，需分別執行以下Rscript：  
（由於Twitter API限制，只能爬到7-9天前之歷史資料，故每次執行程式結果會略有不同）
1. Wordcloud.R：  
* 製作文字雲
   + 用Twitter API爬取最近1000筆出現「hongkong」、「greta thunberg」的貼文，分別將list儲存在`hongkong_tweets`和`gretathunberg_tweets`  
   + 接著將list轉換成vector，並儲存在`hongkong_tweets_text`以及`gretathunberg_tweets_text`  
   + 分別建立專屬corpus  
   + 清理資料：去除標點符號、stopwords、數字、空格等等，並手動去除一些出現率高的字彙。分別儲存在`hongkong_clean`與`gretathunberg_clean`
2. Retweet_Count.R：  
   + 計算近3200則分別提到「hongkong」、「greta thunberg」的貼文，被轉發（retweet）的次數
   + 繪製圖片  
   
3. Location.R：  
* 尋找locaiton
   + 用TwitterAPI分別爬取10000筆「#hongkongprotester」、「#gretathunberg」的貼文，尋找location並儲存在`user_info`
   + 計算`user_info`裡相同loction的貼文數量，儲存在`tag_hongkong_location`及`tag_greta_location`
   + 整理並取前十大location
*  繪製bar chart  

 

   