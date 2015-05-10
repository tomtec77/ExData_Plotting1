# Coursera Exploratory Data Analysis course
# Course Project 1 - plot 4

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
png(filename="plot4.png",
    width=480,
    height=480)

# Plot 4 is a multiplot (4x4) of: global active power as a function of datetime,
# voltage as a function of datetime, energy sub metering as a function of
# datetime (for three different sub meterings) and global reactive power as a
# function of datetime

# First we initialise the plot
with(df, plot(Datetime, Sub_metering_1, type="n",
              xlab="",
              ylab="Energy sub metering"))

# Now add the three columns to plot
line.colours <- c("black", "red", "blue")
with(df, lines(Datetime, Sub_metering_1, col=line.colours[1]))
with(df, lines(Datetime, Sub_metering_2, col=line.colours[2]))
with(df, lines(Datetime, Sub_metering_3, col=line.colours[3]))

# Finally, add a legend
legend("topright", col=line.colours, lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the graphics device
dev.off()