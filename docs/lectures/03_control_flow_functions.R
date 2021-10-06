condition <- TRUE
if (condition) 1
if (condition) 1 else 2

condition <- FALSE
if (condition) 1
if (condition) 1 else 2

condition <- TRUE
if (condition) {
  1
}
if (condition) {
  1
} else {
  2
}

condition <- FALSE
if (condition) {
  1
}
if (condition) {
  1
} else {
  2
}

if ("TRUE") 1
as.logical("TRUE")
as.logical("x")

TRUE == NA

if(c(TRUE, FALSE)) 1
if(any(c(TRUE, FALSE))) 1
if(all(c(TRUE, FALSE))) 1 else 2
if(!any(c(TRUE, FALSE))) 1
if(!all(c(TRUE, FALSE))) 1 else 2

ifelse(c(TRUE, FALSE), 1, 2)
ifelse(c(TRUE, FALSE, TRUE, FALSE, FALSE), 1, 2)

# https://en.wikipedia.org/wiki/Modular_arithmetic#Congruence
?`%%`
x <- 1:9
x %% 5
x %% 5 == 0
ifelse(x %% 5 == 0, "XXX", as.character(x))
ifelse(x %% 2 == 0, "even", "odd")
x[1:2] <- NA
x
ifelse(x %% 2 == 0, "even", "odd")

# Modular arithmetic
2 * (5 %/% 2) + 5 %% 2 == 5


# Let's say 5:10 is encoded as 510
510 %% 100
510 %/% 100

# dplyr::case_when(
#   condition1 ~ action1,
#   condition2 ~ action2,
#   condition3 ~ action3,
#   TRUE ~ action4
# )
# if (condition1) {
#   action1
# } else if (condition2) {
#   action2
# } else if (condition3) {
#   action3
# } else {
#   action4
# }

library(tidyverse)
df <- tibble(a = rnorm(10),
             b = rnorm(10),
             c = rnorm(10),
             d = rnorm(10))
df
seq_along(df)
df$a
df[["a"]]
df[[1]]
df[1]
df[1:2]

l <- list(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
l$a
l[["a"]]
l[[1]]
l[1]
l[1:2]


n <- 10
out <- c()
set.seed(0)
for (i in 1:n) {
  out <- c(out, mean(rnorm(1000)))
}

out2 <- vector("double", n)
set.seed(0)
for (i in 1:n) {
  out2[i] <- mean(rnorm(1000))
}

out
all(out == out2)

f1 <- function(n) {
  out <- c()
  for (i in 1:n) {
    out <- c(out, i)
  }
}
f2 <- function(n) {
  out2 <- vector("double", n)
  for (i in 1:n) {
    out2[i] <- i
  }
}
system.time(f1(10000))
system.time(f2(10000))

means <- c(1, 50, 20)
out <- vector("list", length(means))
for (i in 1:length(means)) {
  out[[i]] <- rnorm(10, means[[i]])
}
out

1:3
1:-1

means <- c()
out <- vector("list", length(means))
for (i in 1:length(means)) {
  out[[i]] <- rnorm(10, means[[i]])
}

for (i in seq_along(means)) {
  out[[i]] <- rnorm(10, means[[i]])
}

means <- c(1, 50, 20)
seq_along(means)

i <- 0
while(i < 10) {
  print(i)
  i <- i + 1
}
i
## beware of the infinite loop !!
# while(TRUE) {
#   i <- i + 1
# }

i <- 0
while(TRUE) {
  print(i)
  i <- i + 1
  if (i == 10) {
    break
  }
}

i <- 0
repeat({
  print(i)
  i <- i + 1
  if (i == 10) {
    break
  }
})
i

f02 <- function(x, y) {
  # A comment
  x + y
}
typeof(f02)
typeof(l)
typeof(df)

log(1)
log("a")

?sapply
?map

x <- 10
g01 <- function() {
  x <- 20
  x
}
g01()
x

g11 <- function() {
  if (!exists("a")) {
    a <- 1
  } else {
    a <- a + 1
  }
  a
}
g11()
g11()

a <- 2
g11()
g11()

a <- 2
a <- g11()
a
g11()

a <- 3
g11()
a <- 4
g11()

g12 <- function() {
  if (!exists("a")) {
    a <- 1
  } else {
    a <<- a + 1
  }
  a
}
rm(a)
g12()
g12()
a <- 1
g12()
a

set.seed(0)
runif(1)
set.seed(0)
runif(1)
set.seed(0)
runif(1)
runif(1)