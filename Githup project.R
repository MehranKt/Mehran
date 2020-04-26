install.packages("tidyverse")
install.packages("gapminder")

library(gapminder)
library(dplyr)
library(ggplot2)

# Create gapminder_1952
gapminder_1952 <- gapminder %>%
  filter(year == 1952)
gapminder_Asia <- gapminder %>%
  filter(continent =="Asia")
# Comparing population and GDP per capita ----

# To create a scatter plot with GDP per capita on the x-axis and life expectancy on the y-axis. 
#When you're exploring data visually, you'll often need to try different combinations of variables and aesthetics.


#Instructions

# Create the scatter plot of gapminder_1952 so that (pop) is on the x-axis and GDP per capita (gdpPercap) is on the y-axis.

# Put pop on the x-axis and gdpPercap on the y-axis

ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()
ggplot(gapminder_Asia,aes(x=year,y=lifeExp,))+geom_point()+scale_x_log10()
# Comparing population and life expectancy ---- 

# In this exercise, you'll use ggplot2 to create a scatter plot from scratch, 
#to compare each country's population with its life expectancy in the year 1952.

# Instructions

# Create a scatter plot of gapminder_1952 with population (pop) is on the x-axis 
#and life expectancy (lifeExp) on the y-axis.

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a scatter plot with pop on the x-axis and lifeExp on the y-axis


# Putting the y-axis on a log scale ---- 

# Instructions

# Change the existing scatter plot (code provided) 
#to put the y-axis (representing population) on a log scale.

# Change this plot to put the y-axis on a log scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() + scale_y_log10()

# Putting the x- and y- axes on a log scale ----

# Suppose you want to create a scatter plot with population on the x-axis and GDP per capita on the y-axis. 
#Both population and GDP per-capita are better represented with log scales, since they vary over many orders of magnitude.

# Instructions

#Create a scatter plot with population (pop) on the x-axis and GDP per capita (gdpPercap) on the y-axis. 
#Put both the x- and y- axes on a log scale.

# Scatter plot comparing pop and gdpPercap, with both axes on a log scale

ggplot(gapminder_1952, aes(x= pop, y= gdpPercap)) + geom_point() + scale_x_log10() + scale_y_log10()

# Adding color to a scatter plot ----

# In this lesson you learned how to use the color aesthetic, 
#which can be used to show which continent each point in a scatter plot represents.

# Instructions

# Create a scatter plot with population (pop) on the x-axis, life expectancy (lifeExp) on the y-axis,
#and with continent (continent) represented by the color of the points. Put the x-axis on a log scale.

# Scatter plot comparing pop and lifeExp, with color representing continent

ggplot(gapminder_1952, aes(x=pop, y=lifeExp, color = continent)) + 
  geom_point()+ scale_x_log10()

# Adding size and color to a plot ---- 

# In the last exercise, you created a scatter plot communicating information about each country's population, life expectancy, and continent. 
#Now you'll use the size of the points to communicate even more.

# Instructions

# Modify the scatter plot so that the size of the points represents each country's GDP per capita (gdpPercap).

# Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) +
  geom_point() +
  scale_x_log10()


# Creating a subgraph for each continent ---- 

# Instructions

# Create a scatter plot of gapminder_1952 with the x-axis representing population (pop), 
#the y-axis representing life expectancy (lifeExp), and faceted to have one subplot per continent (continent).
#Put the x-axis on a log scale.

# Scatter plot comparing pop and lifeExp, faceted by continent

ggplot(gapminder_1952, aes(x=pop, y=lifeExp)) + geom_point()+ scale_x_log10() + facet_wrap(~continent)

# Faceting by year ----

# All of the graphs in this chapter have been visualizing statistics within one year. 
#Now that you're able to use faceting, however, you can create a graph showing all the country-level data from 1952 to 2007, 
#to understand how global statistics have changed over time.

# Instructions

# Create a scatter plot of the gapminder data:

# Put GDP per capita (gdpPercap) on the x-axis and life expectancy (lifeExp) on the y-axis,
#with continent (continent) represented by color and population (pop) represented by size.

# Put the x-axis on a log scale

# Facet by the year variable

# Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year

ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, color=continent, size=pop))+
  geom_point() + scale_x_log10() + scale_y_log10() + facet_wrap(~ year)

# Summarizing the median life expectancy ---- 

# mean() and sum() are only two of the functions R provides for summarizing a collection of numbers. 
#Here, you'll learn to use the median() function in combination with summarize().

# By the way, dplyr displays some messages when it's loaded. They'll show up in red and start with:

# Attaching package: 'dplyr'

# The following objects are masked from 'package:stats':

# This will occur in future exercises each time you load dplyr: it's mentioning some built-in functions that are overwritten by dplyr. 
#You won't need to worry about this message within this course.

# Use the median() function within a summarize() to find the median life expectancy. 
#Save it into a column called medianLifeExp.

# Summarize to find the median life expectancy
gapminder %>%
  summarize(medianLifeExp = median(lifeExp))



# Summarizing the median life expectancy in 1957 ----

# Rather than summarizing the entire dataset, you may want to find the median life expectancy for only one particular year. 
#In this case, you'll find the median in the year 1957.

# Instructions

# Filter for the year 1957, then use the median() function within a summarize() to calculate the median life expectancy into a column called medianLifeExp.

# Filter for 1957 then summarize the median life expectancy

gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp=median(lifeExp))

# Summarizing by year ---- 

# In a previous exercise, you found the median life expectancy and the maximum GDP per capita in the year 1957. 
#Now, you'll perform those two summaries within each year in the dataset, using the group_by verb.

# Instructions

# Find the median life expectancy (lifeExp) and maximum GDP per capita (gdpPercap) within each year, 
#saving them into medianLifeExp and maxGdpPercap, respectively.

# Find median life expectancy and maximum GDP per capita in each year

gapminder%>%
  group_by(year)%>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Summarizing by continent ---- 

# You can group by any variable in your dataset to create a summary. 
#Rather than comparing across time, you might be interested in comparing among continents. 
#You'll want to do that within one year of the dataset: let's use 1957.

# Instructions

# Filter the gapminder data for the year 1957. 
#Then find the median life expectancy (lifeExp) and maximum GDP per capita (gdpPercap) within each continent,
#saving them into medianLifeExp and maxGdpPercap, respectively.

# Find median life expectancy and maximum GDP per capita in each continent in 1957

gapminder%>%
  filter(year==1957)%>%
  group_by(continent)%>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))


# Summarizing by continent and year ---- 

# Instead of grouping just by year, or just by continent, 
#you'll now group by both continent and year to summarize within each.

# Instructions

# Find the median life expectancy (lifeExp) and maximum GDP per capita (gdpPercap) within each combination of continent and year, 
#saving them into medianLifeExp and maxGdpPercap, respectively.

# Find median life expectancy and maximum GDP per capita in each continent/year combination

gapminder%>%
  group_by(continent,year)%>%
  summarize(medianLifeExp= median(lifeExp), maxGdpPercap = max(gdpPercap))

# Visualizing median GDP per capita over time ---- 

#A line plot is useful for visualizing trends over time. 
#In this exercise, you'll examine how the median GDP per capita has changed over time.

# Instructions

# Use group_by() and summarize() to find the median GDP per capita within each year, calling the output column medianGdpPercap. 
#Use the assignment operator <- to save it to a dataset called by_year.

# Use the by_year dataset to create a line plot showing the change in median GDP per capita over time. 
#Be sure to use expand_limits(y = 0) to include 0 on the y-axis.

# Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year, aes(x = year, y = medianGdpPercap)) +
  geom_line() +
  expand_limits(y = 0)
# Visualizing median GDP per capita per continent over time ----

# In the last exercise you were able to see how the median life expectancy of countries changed over time. 
#Now you'll examine the median GDP per capita instead, and see how the trend differs among continents.

# Instructions

# Summarize the gapminder dataset by continent and year, finding the median GDP per capita (gdpPercap) within each and putting it into a column called medianGdpPercap. 
#Use the assignment operator <- to save this summarized data as by_year_continent.

# Create a scatter plot showing the change in medianGdpPercap by continent over time. 
#Use color to distinguish between continents, and be sure to add expand_limits(y = 0) so that the y-axis starts at zero.

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) +
  geom_point() +
  expand_limits(y = 0)

# Visualizing median GDP per capita by continent ---- 

# A bar plot is useful for visualizing summary statistics, such as the median GDP in each continent.

# Instructions

# Use group_by() and summarize() to find the median GDP per capita within each continent in the year 1952, 
#calling the output column medianGdpPercap. Use the assignment operator <- to save it to a dataset called by_continent.

# Use the by_continent dataset to create a bar plot showing the median GDP per capita in each continent.

# Summarize the median gdpPercap by year and continent in 1952
by_continent<-gapminder%>%
  filter(year == 1952)%>%
  group_by(continent)%>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x= continent, y = medianGdpPercap)) + geom_col()


# Visualizing GDP per capita by country in Oceania ----

# You've created a plot where each bar represents one continent, showing the median GDP per capita for each. 
#But the x-axis of the bar plot doesn't have to be the continent: you can instead create a bar plot where each bar represents a country.

# In this exercise, you'll create a bar plot comparing the GDP per capita between the two countries in the Oceania continent (Australia and New Zealand).

# Instructions

# Filter for observations in the Oceania continent in the year 1952. 
#Save this as oceania_1952.

# Use the oceania_1952 dataset to create a bar plot, with country on the x-axis and gdpPercap on the y-axis.

# Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder %>%
  filter(continent == "Oceania", year == 1952)

# Create a bar plot of gdpPercap by country
ggplot(oceania_1952, aes(x = country, y = gdpPercap)) +
  geom_col()
# Visualizing population ---- 

# A histogram is useful for examining the distribution of a numeric variable. 
#In this exercise, you'll create a histogram showing the distribution of country populations (by millions) in the year 1952.

# Code for generating this dataset, gapminder_1952, is provided.

# Instructions

# Use the gapminder_1952 dataset to create a histogram of country population (pop_by_mil) in the year 1952. 
#Inside the histogram geom, set the number of bins to 50.

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop)
ggplot(gapminder_1952, aes(x=pop)) + geom_histogram()

# Visualizing population with x-axis on a log scale ----

# In the last exercise you created a histogram of populations across countries. 
#You might have noticed that there were several countries with a much higher population than others, which causes the distribution to be very skewed, with most of the distribution crammed into a small part of the graph. 
#(Consider that it's hard to tell the median or the minimum population from that histogram).

# To make the histogram more informative, you can try putting the x-axis on a log scale.

# Instructions

# Use the gapminder_1952 dataset (code is provided) to create a histogram of country population (pop) in the year 1952, 
#putting the x-axis on a log scale with scale_x_log10().

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x=pop))+geom_histogram()+scale_x_log10()

# Comparing GDP per capita across continents ----

# A boxplot is useful for comparing a distribution of values across several groups. 
#In this exercise, you'll examine the distribution of GDP per capita by continent. 
#Since GDP per capita varies across several orders of magnitude, you'll need to put the y-axis on a log scale.

# Instructions

# Use the gapminder_1952 dataset (code is provided) to create a boxplot comparing GDP per capita (gdpPercap) among continents. 
#Put the y-axis on a log scale with scale_y_log10().

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x=continent, y = gdpPercap)) + geom_boxplot() + scale_y_log10()

# Adding a title to your graph ---- 

# There are many other options for customizing a ggplot2 graph, which you can learn about in other DataCamp courses. 
#You can also learn about them from online resources, which is an important skill to develop.

# As the final exercise in this course, you'll practice looking up ggplot2 instructions by completing a task we haven't shown you how to do.

# Instructions

# Add a title to the graph: Comparing GDP per capita across continents. 
#Use a search engine, such as Google or Bing, to learn how to do so.

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() +ggtitle("Comparing GDP per capita across continents")

