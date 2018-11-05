## Assignment: Course Project 2
## Question:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.


# Read in emissions dataset
emissions.df <- readRDS('summarySCC_PM25.rds')
scc.df <- readRDS('Source_Classification_Code.rds')

# Get the emissions in Baltimore City
baltimore.emissions.df = emissions.df[emissions.df$fips == '24510', ]

# Get the total emissions in Baltimore City by year
baltimore.emission.totals.by.year <- aggregate(Emissions ~ year, data = baltimore.emissions.df, FUN = sum)

# Create Plot
png(filename='plot2.png', width=480, height=480, units='px')
options(scipen=10)
with(baltimore.emission.totals.by.year, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='Total PM2.5 Emissions in Baltimore City')
})

# Close png device
dev.off()