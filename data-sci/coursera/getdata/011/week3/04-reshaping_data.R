# The goal is:
#    TIDY DATA
# 1. Each variable forms a column
# 2. Each observation forms a row
# 3. Each table/file stores data around one kind of observation (e.g. people/hospitals)

library (reshape2)
head(mtcars, n=3)
#                   mpg   cyl disp  hp  drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160   110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160   110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108   93  3.85 2.320 18.61  1  1    4    1

mtcars$carname <-rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head(carMelt, n=3)
#       carname      gear cyl   variable value
# 1     Mazda RX4      4   6      mpg    21.0
# 2     Mazda RX4 Wag  4   6      mpg    21.0
# 3     Datsun 710     4   4      mpg    22.8

tail(carMelt, n=3)
#     carname        gear cyl variable value
# 62  Ferrari Dino   5    6   hp       175
# 63  Maserati Bora  5    8   hp       335
# 64  Volvo 142E     4    4   hp       109

# Casting Data Frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData
#     cyl mpg hp
# 1   4   11  11
# 2   6   7   7
# 3   8   14  14

cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData
#     cyl      mpg        hp
# 1   4       26.66364   82.63636
# 2   6       19.74286   122.28571
# 3   8       15.10000   209.21429

# Avreaging values
head(InsectSprays)
#      count spray
# 1    10     A
# 2     7     A
# 3    20     A
# 4    14     A
# 5    14     A
# 6    12     A
tapply(InsectSprays$count, InsectSprays$spray, sum)
# A    B   C   D   E   F 
# 174 184  25  59  42 200

# Split Data
spIns <- split(InsectSprays$count, InsectSprays$spray)
spIns
# $A
# [1] 10  7 20 14 14 12 10 23 17 20 14 13

# $B
# [1] 11 17 21 11 16 14 17 17 19 21  7 13
# ...............

# Apply
sprCount = lapply(spIns, sum)
sprCount
# $A
# [1] 174

# $B
# [1] 184

# Combine
unlist(sprCount)
# A   B    C   D   E   F 
# 174 184  25  59  42  200

sapply(spIns, sum)
# A   B    C   D   E   F 
# 174 184  25  59  42  200

# plyr Package
ddply(InsectSprays, .(spray), summarize, sum=sum(count))
#   spray sum
# 1     A 174
# 2     B 184
# 3     C  25
# 4     D  59
# 5     E  42
# 6     F 200

# Creating a new variable
spraySums <- ddply(InsectSprays, .(spray), summarize, sum=ave(count, FUN=sum))
head(spraySums, n=3)
#   spray sum
# 1     A 174
# 2     A 174
# 3     A 174
