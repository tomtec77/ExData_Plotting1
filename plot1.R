# Coursera Exploratory Data Analysis course
# Course Project 1 - plot 1

# The data for this plot should be in a file called data/exdata1.RData which is
# created by the prepare_data.R script. If we don't find it, we source that
# script to create the data
if (!file.exists("data/exdata1.RData")) {
    source("prepare_data.R")
}

load("data/exdata1.RData")

# Plots should be saved to a PNG file
png(filename="plot1.png",
    width=480,
    height=480)

# Plot 1 is a histogram of global active power in kilowatts
hist(df$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# Close the graphics device
dev.off()