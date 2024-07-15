############################################################################
# Basic Analytics with R
# Description  :   Connect to Twitter app and extract sample tweets
############################################################################

#load the package
#install.packages("twitteR")

#library(openssl)
#library(httpuv)
library(twitteR)
library(ROAuth)
library(openssl)
library(httpuv)

install.packages("ROAuth")
#set the credentials
CONSUMER_SECRET <- 'zHHyEKJc2AEvp872tXRMShF6bM1LpzG0R5AsfPgrCBn5uSqozI'
CONSUMER_KEY <- 'u57YAhkHFdVvXIcbYOKb1xEVT'
ACCESS_SECRET <- 'gADsM08Qkvl8yniRxyFz8Ldna6ngtVV2L6wApwDyTHcSu'
ACCESS_TOKEN <- "1533805509161017345-mZfuyLWStOrp5EH9qYSTtPZQ8O0Aev"

#connect to twitter app
setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)
  
  
#Access token and secret should be provided due to API change in July 2018.

# set twitter user
twitterUser <- getUser("lenirobredo")
class(twitterUser)
str(twitterUser)

# extract a few sample tweets from this user's timeline
tweets <- userTimeline(twitterUser, n = 10)
tweets <- userTimeline(twitterUser, n = 10, includeRts = T)
tweets <- userTimeline(twitterUser, n = 3200, includeRts = T)
#The Search API is not complete index of all Tweets, but instead an index of recent Tweets. At the moment that index includes between 6-9 days of Tweets.
#This method can only return up to 3,200 of a user's most recent Tweets. Native retweets of other statuses by the user is included in this total, regardless of whether include_rts is set to false when requesting this resource.



# display attributes and function of tweet object
tweets[[1]]$getClass()
#class(tweets[[1]]

# display main body(text) of tweet
tweets[[5]]$text

# display favorite count
tweets[[1]]$favoriteCount

# display retweet count
tweets[[1]]$retweetCount

# check current rate limit (Check /statuses/user_timeline)
getCurRateLimitInfo()
