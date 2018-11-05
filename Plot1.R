## Assignment: Course Project 2
## Question:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission
## from all sources for each of the years 1999, 2002, 2005, and 2008.


# Read in emissions dataset
emissions.df <- readRDS('summarySCC_PM25.rds')
scc.df <- readRDS('Source_Classification_Code.rds')

# Get the total emissions by year
emission.totals.by.year <- aggregate(Emissions ~ year, data = emissions.df, FUN = sum)

#Create Plot
png(filename='plot1.png', width=480, height=480, units='px')
options(scipen=10)
with(emission.totals.by.year, {
  plot(year, Emissions, type = 'b',  
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='Total PM2.5 Emissions in U.S.A.')
})

# Close png device
dev.off()

