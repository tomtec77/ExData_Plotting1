# Coursera Exploratory Data Analysis course
# Course Project 1 - plot 2

# The data for this plot should be in a file called data/exdata1.RData which is
# created by the prepare_data.R script. If we don't find it, we source that
# script to create the data
if (!file.exists("data/exdata1.RData")) {
    source("prepare_data.R")
}

load("data/exdata1.RData")

# This is to set my locale to en_US so that dates are printed in English,
# otherwise they appear in Spanish in the plot :)
Sys.setlocale(locale="en_US.UTF-8")

# Plots should be saved to a PNG file
png(filename="plot2.png",
    width=480,
    height=480)

# Plot 2 is a plot of global active power (in kilowatts) as a function of 
# date and time
plot(df$Datetime, df$Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Close the graphics device
dev.off()