v <- 1
v

v <- 1:10

v <- c(1, 2, 3, 4, 5, 6, 7, 8 , 9 , 10)

v1 <- c(1,2,3)
v2 <- c(4,5,6)
v3 <- c(v1, v2)

v4 <- c(c(1,2,3), c(4,5,6))

v5 <- c(1, "A")
v6 <- c(1, TRUE)
v7 <- c(1, FALSE, "ABC")

v8 <- 1:10

v9 <- seq(10)
seq(from=5, to = 100, length.out=3)

rep(1, times=5)
rep(c(1,3,5), times=5, each=2)

v <- rnorm(10, mean = 0, sd = 1)
v

v <- 1:100
sample1 <- sample(v, size = 10, replace = FALSE)
sample1


v1 <- 1:5
v2 <- 1:5
v3 <- v1 + v2

v4 <- v1 * v2
v5 <- v1 / v2

v1 <- 1:5
v2 <- c(1,2,3)
v3 <- v1 + v2


v1 <- c(1,2,3,4,NA)
sum(v1)
sum(v1, na.rm = TRUE)

v1 <- c(TRUE, TRUE, FALSE)
sum(v1)/length(v1)

v1 <- 1:10
v1[1:5]
v1[c(1,3,5)]

b1 <- rep(TRUE, 5)
b2 <- rep(FALSE, 5)
b3 <- c(b1, b2)


grades <- c(75, 80, 60, 90)
grades_above75 <- grades >= 75

students <- c("Bob", "Bert", "Sam", "Lizzie")
honour_role <- c("Bert", "Lizzie")


m <- matrix(nrow = 2, ncol = 2)
m[1,1] <- 1
m[1,2] <- 2

v <- c(3,4)
m[2,] <- v

v <- c(5,6)
m[,1] <- v


v1 <- 1:5
v2 <- 6:10
m <- rbind(v1,v2)
m <- cbind(v1, v2)



v1 <- c(90, 80, 70, 30)
v2 <- c("A", "A", "A", "A")
v3 <- c(TRUE, TRUE, TRUE, TRUE)

df1 <- data.frame(Percent.Grade = v1, Letter.Grade = v2, Pass.Fail = v3, stringsAsFactors = FALSE)


df1$Letter.Grade[df1$Percent.Grade <50] <- "F"
df1$Letter.Grade[df1$Percent.Grade >=70] <- "B"
df1$Letter.Grade[df1$Percent.Grade >=80] <- "A"


df1$Pass.Fail[df1$Percent.Grade < 50] <- FALSE

v1 <- c(1, 2, 3)
v2 <- 1:100
m1 <- matrix(nrow =2, ncol = 2)

l <- list(Few.Numbers = v1, Lots.of.Numbers = v2, Empty.Mat = m1)



df1 <- data.frame(x = c(TRUE, FALSE, TRUE))
l$Random.DF.Object <- df1

l[[5]] <- df1








