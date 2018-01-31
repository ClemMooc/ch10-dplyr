### Exercise 2: Data Frame Practice with dplyr

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame

## Install (if you haven't already) and load the `dplyr`package
library("dplyr")

#install.packages("fueleconomy")
library("fueleconomy")
# You should have have access to the `vehicles` data.frame


# Create a data.frame of vehicles from 1997

  cars_97 = filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame

  unique(cars_97$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city

  two.wheel = filter(vehicles, drive == "2-Wheel Drive", cty == 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?

  worst.MPG = two.wheel %>% filter(hwy == min(hwy)) %>% select(id)
  #vehicle.ID = worst.MPG %>% select(id)
  
# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year

  most.MPG.year = function(y, m){
    best.model = vehicles %>% filter(year == y, make == m) %>% filter(hwy == max(hwy))
    print(best.model)
  }

# What was the most efficient honda model of 1995?

  most.efficient.Honda.1995 = vehicles %>% filter(year == 1995, make == "Honda") 