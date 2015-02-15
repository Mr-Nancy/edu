library(jsonlite)

#myapp = oauth_app("twitter", key="yourConsumerKey", secret = "yourConsumerKeyHere", secret="yourConsumerSecretHere")
myapp = oauth_app("twitter", key="Lqa8SAZvF65RfWuOYyHEX2NsG", secret="mGuF6szSYGtRWCNGhESLn6NVq0bHU5HFKEZ9T9959OKVagSnxn")

#sig = sign_oauth1.0(myapp, token="yourTokenHere", token_secret = "yourTokenSecretHere")
sig = sign_oauth1.0(myapp, token="1556166618-1llcSq8roFMxVnfmtQ4N3HFmW9jA33ZSDX6vNiL", token_secret = "xdhUl2OoOxuyWSwHZ8H94qdNiABKCDLXgqyUkaYzFKo2G")

#https://dev.twitter.com/rest/reference/get/statuses/home_timeline
homeTL = GET("https://api.twitter.com/1.1/statuses/user_timeline.json", sig)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]