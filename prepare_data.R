library(lubridate)
library(dplyr)

# Coursera Exploratory Data Analysis course
# Course Project 1
# This file loads the original datasets and extracts only the rows which 
# correspond to data for 2007-02-01 and 2007-02-02. 
# Run this script before calling the plotting scripts to prepare the 
# necessary data.

# Start by downloading the data and storing it in a directory called data
# which will be created if it doesn't exist
if (!file.exists("data")) {
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="data/household_power_consumption.zip", method="curl")

# Record the date in which we downloaded the file
dateDownloaded <- date()

# Extract the zipped file we just downloaded
basewd <- getwd()
setwd(paste(basewd, "data", sep="/"))
unzip("household_power_consumption.zip")
setwd(basewd)

# Load the dataset into R
# Separator is ';' and missing values are coded as '?'
df <- read.table("data/household_power_consumption.txt", sep=";",
                 na.strings="?", header=TRUE, stringsAsFactors=FALSE)

# We only need data for from the dates 2007-02-01 and 2007-02-02
# The first two columns in the dataset are 'Date' and 'Time' but are loaded as
# of class 'character' - convert them to datetime objects
# I'll leave the timezone as UTC 
df$Datetime <- dmy_hms(paste(df$Date, df$Time))

time.period <- interval(ymd_hms("2007-02-01 00:00:00"),
                        ymd_hms("2007-02-02 23:59:59"))
df <- filter(df, Datetime %within% time.period)
df <- select(df, -Date, -Time)

# Save the final dataset
save(df, dateDownloaded, file="data/exdata1.RData")
