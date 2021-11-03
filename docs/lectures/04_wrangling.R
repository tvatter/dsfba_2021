library(tidyverse)
library(nycflights13)

x <- 1
x <- x + 1
y <- x + 1

a1 <- group_by(flights, year, month, day)
a2 <- select(a1, arr_delay, dep_delay)
a3 <- summarize(a2,
                arr = mean(arr_delay, na.rm = TRUE),
                dep = mean(dep_delay, na.rm = TRUE))
filter(a3, arr > 30 | dep > 30)

x <- 1:10
mean(x^2)
x^2 %>% mean

system.time(mean(1:2000))
system.time({
  y <- 0
  for(i in 1:2000) {
    y <- y + i
  }
  y / 2000
})

df <- tibble(
  country = rep(c("Switzerland", "Italy"), each = 3),
  region = rep(1:3, 2),
  polution = rnorm(6)
) %>%
  bind_rows(
    tibble(
      country = rep("Switzerland", 2),
      region = 4:5,
      polution = rnorm(2)
    )
  )
df %>%
  group_by(country) %>%
  summarize(n_regions = length(polution),
            mean_polution = mean(polution))

vignette("pivot")

table5 %>%
  unite(something, century, year, sep = "...")

stocks <- tibble(
  year
  = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr
  = c(
    1,
    2,
    3,
    4,
    2,
    3,
    4),
  return = c(1.88, 0.59, 0.35,
             NA, 0.92, 0.17, 2.66)
)
stocks
drop_na(stocks)

stocks %>% 
  complete(year, qtr) %>%
  summarize(n_missing = sum(is.na(return)),
            prop_missing = mean(is.na(return)))

(sqrt(2)^2) == 2
sqrt(2)^2 - 2

filter(flights, month %in% 1:6)

flights
arrange(flights, year, month, day, desc(arr_delay))
arrange(flights, desc(arr_delay))

flights %>%
  select(contains("dep"), contains("arr_"), everything())

(flights_sml <- select(flights,
                       ends_with("delay"),
                       distance,
                       air_time))

mutate(flights_sml,
       air_time = air_time / 60)

mutate(flights,
  gain = arr_delay - dep_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours) %>%
  select(gain, hours, gain_per_hour)

flights_sml %>%
  transmute(long_flight = air_time / 60 >= 3)

long_flight <- c(1, 3, 5, 5, 2) >=3
mean(long_flight)

flights %>% 
  group_by(year, month, day) %>%
  summarize(delay = mean(dep_delay, na.rm = TRUE))

not_cancelled <- flights %>% filter(!is.na(dep_delay))
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay),
            sd = sd(dep_delay),
            max = max(dep_delay),
            min = min(dep_delay))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(dep_delay = mean(dep_delay),
            sd = sd(dep_delay),
            min = min(dep_delay),
            max = max(dep_delay))

flights %>%
  group_by(year, month, day) %>%
  summarize(n_flights = sum(air_time / 60 >= 3, na.rm = TRUE),
            prop_flights = mean(air_time / 60 >= 3, na.rm = TRUE))

flights %>%
  group_by(year, month, day) %>%
  summarize(n = n())

flights %>%
  count(year, month, day)

arrange(summarize(group_by(not_cancelled, dest), carriers = n_distinct(carrier)), desc(carriers))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(hour_perc = mean(arr_delay > 60, na.rm = TRUE)) %>%
  arrange(desc(hour_perc))

daily <- group_by(flights, year, month, day)
per_day <- summarize(daily, flights = n())

# data %>%
#   group_by(university) %>%
#   summarize(income = mean(income))

per_day %>%
  summarize(flights = sum(flights))

per_day %>%
  ungroup() %>%
  summarize(flights = sum(flights))

(popular_dests <- flights %>%
    group_by(dest) %>%
    filter(n() > 365))

popular_dests %>%
  ungroup() %>%
  summarize(mean = mean(arr_delay, na.rm = TRUE))

flights %>%
  summarize(mean = mean(arr_delay, na.rm = TRUE))

popular_dests %>%
  mutate(scaled_delay = (dep_delay - mean(dep_delay, na.rm = TRUE)) / sd(dep_delay, na.rm = TRUE))

flights %>%
  filter(dep_delay > 0) %>%
  group_by(month, day) %>%
  mutate(dep_delay = dep_delay - min(dep_delay)) %>%
  summarize(min = min(dep_delay))

daily %>%
  ungroup() %>%
  filter() %>%
  mutate()

# multiple tables

airports %>% count(faa) %>% filter(n > 1) # primary key
airports %>% count(name) %>% filter(n > 1) # not a primary key
airports %>% count(lon, lat) %>% filter(n > 1) # primary key

flights %>% select(year:day, tailnum, origin, dest) %>% left_join(planes)
flights %>% select(year:day, tailnum, origin, dest) %>% left_join(planes, by = "tailnum")

left_join(x, y, by = c("keyx1" = "keyy1", "keyx2" = "keyy2"))

top_dest <- flights %>%
  count(dest, sort = TRUE) %>%
  head(10)

flights %>%
  anti_join(planes,
            by = "tailnum")
