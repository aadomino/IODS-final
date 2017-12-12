# IODS final project
# Agata Dominowska
# 12.12.2017
# This file contains the R code for IODS 2017: final project
# The package used in this project comes from FactoMineR.
# The goal of the project is to perform Multiple Correspondence Analysis on the pre-processed data set.


# Accessing the necessary libraries.
library(FactoMineR)
library(dplyr)

# Importing the data set, having a look at it
data("hobbies")
glimpse(hobbies)

# There are 8403 observations and 23 variables in the data.
# The data will be explored in more detail on the final project website.

# Removing the data points without value attached - this way only complete cases are left in the data set.
complete_hobbies <- filter(hobbies, complete.cases(hobbies) == TRUE)
glimpse(complete_hobbies)

# The number of observations is now diminished to 6905.

# Renaming the fwo-factor levels, which are either 1 or 0, to 'yes' and 'no', in order to use them for labels later on.
# TV is the only one with more than 2 levels.
levels(complete_hobbies$Reading) <- c('No','Yes')
levels(complete_hobbies$`Listening music`) <- c('No','Yes')
levels(complete_hobbies$Cinema) <- c('No','Yes')
levels(complete_hobbies$Show) <- c('No','Yes')
levels(complete_hobbies$Exhibition) <- c('No','Yes')
levels(complete_hobbies$Computer) <- c('No','Yes')
levels(complete_hobbies$Sport) <- c('No','Yes')
levels(complete_hobbies$Walking) <- c('No','Yes')
levels(complete_hobbies$Travelling) <- c('No','Yes')
levels(complete_hobbies$`Playing music`) <- c('No','Yes')
levels(complete_hobbies$Collecting) <- c('No','Yes')
levels(complete_hobbies$Volunteering) <- c('No','Yes')
levels(complete_hobbies$Mechanic) <- c('No','Yes')
levels(complete_hobbies$Gardening) <- c('No','Yes')
levels(complete_hobbies$Knitting) <- c('No','Yes')
levels(complete_hobbies$Cooking) <- c('No','Yes')
levels(complete_hobbies$Fishing) <- c('No','Yes')

# The columns to be kept in the data. I am interested in the most of the variables, but I leave out music-related data 
# (not very interesting from the point of view of my hypotheses) and the number of activities.
keep_columns <- c("Reading", "Cinema", "Show", "Exhibition", "Computer", "Sport", "Walking", "Travelling", "Collecting", "Volunteering", 
                  "Mechanic", "Gardening", "Knitting", "Cooking", "Fishing", "Sex", "Age", "Marital status", "Profession")
complete_hobbies <-select(complete_hobbies, one_of(keep_columns))
summary(complete_hobbies)

# Saving the data set to a .csv file.
setwd("~\\GitHub\\IODS-final")
write.csv(complete_hobbies, file = "hobbies.csv", row.names=TRUE)
