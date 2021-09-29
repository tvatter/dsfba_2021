# Create a vector in R
x <- c(5, 29, 13, 87)
x

x <- rnorm(50)
x
x[13]

"a"
"fox"
"a fox"

T == TRUE
1/0
-1/0
0/0
Inf < 5
-Inf < 5

c(1L, TRUE, FALSE)
c(1L, 2.5)
as.integer(TRUE)
as.character(TRUE)

TRUE + TRUE
TRUE + TRUE + FALSE

x <- c(NA, 5, NA, 10, 11)
x == 5
mean(is.na(x))
sum(!is.na(x))

x <- c(a = 1, b = 2, c = 3)
x
x['b']
names(x)
is.double(x)
is.character(names(x))

matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)

b <- 1:6
dim(b) <- c(3, 2)
b
dim(b) <- c(5, 2) # error !
dim(b) <- c(2, 3)
b
rbind(b, b)
cbind(b, b)
t(b)

factor(c("b", "b", "a", "c"))

1:3
matrix(1:3, nrow = 1)
matrix(1:3, ncol = 1)

x <- 0
x
class(x) <- "Date"
x
x - 1
x + 1

df1 <- data.frame(
  x = 4:6,
  y = letters[1:3]
)
attributes(df1)

df2 <- list(
  x = 4:6,
  y = letters[1:3]
)
class(df2) <- "data.frame"
rownames(df2) <- 1:3
df2

df3 <- list(
  x = 4:5,
  y = letters[1:3]
)
class(df3) <- "data.frame"
rownames(df3) <- 1:3
df3

library(tibble)
is_tibble(df1)

library(tidyverse)

x <- c(2.1, 4.2, 3.3, 5.4)
x[c(TRUE, FALSE)]
x[c(TRUE, FALSE, TRUE, FALSE)]
x[c(4, NA, 2)]

a <- matrix(1:9, nrow = 3)
colnames(a) <- c("A", "B", "C")
a
a[,c(1, 3)]

x <- 1:3
x[0]

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df$x == 2
df[df$x == 2, ]
