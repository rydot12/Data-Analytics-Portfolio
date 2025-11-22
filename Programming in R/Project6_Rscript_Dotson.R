#1
library(readxl)
setwd("C:/Users/rdots/Downloads/")
SP500 <- read_excel("SP500.xls")
head(SP500)

#2
num_rows <- nrow(SP500)
num_cols <- ncol(SP500)
cat("Number of rows:", num_rows, "\n")
cat("Number of columns:", num_cols, "\n")

#3
SP500_selected <- SP500[, c("SP500", "CPI", "Rate")]
head(SP500_selected)

#4
SP500_rows <- SP500[c(10, 100, 500, 1500), ]
SP500_rows

#5
SP500_condition1 <- subset(SP500, SP500 > 2000 | CPI < 100)
head(SP500_condition1)

#6
SP500_condition2 <- subset(SP500, Earnings > 50 & Rate < 3, select = c("SP500", "Dividend"))
head(SP500_condition2)

#7
SP500_noRate <- SP500[, !(names(SP500) %in% "Rate")]
head(SP500_noRate)

#8
CPI_latest <- tail(SP500$CPI, 1)  # latest CPI value
SP500$RealPrice <- SP500$SP500 * SP500$CPI / CPI_latest
head(SP500)

#9
SP500$RealEarnings <- SP500$Earnings * SP500$CPI / CPI_latest
head(SP500)

#10
SP500$PERatio <- SP500$RealPrice / SP500$RealEarnings
head(SP500)

#11
sum_earnings <- 0
count <- 0
for (i in 1:nrow(SP500)) {
  if (!is.na(SP500$Earnings[i])) {
    sum_earnings <- sum_earnings + SP500$Earnings[i]
    count <- count + 1
  }
}
avg_earnings_for <- sum_earnings / count
cat("Average Earnings (for loop):", avg_earnings_for, "\n")

#12
sum_earnings <- 0
count <- 0
i <- 1
while (i <= nrow(SP500)) {
  if (!is.na(SP500$Earnings[i])) {
    sum_earnings <- sum_earnings + SP500$Earnings[i]
    count <- count + 1
  }
  i <- i + 1
}
avg_earnings_while <- sum_earnings / count
cat("Average Earnings (while loop):", avg_earnings_while, "\n")

#13
sum_earnings <- 0
count <- 0
i <- 1
repeat {
  if (!is.na(SP500$Earnings[i])) {
    sum_earnings <- sum_earnings + SP500$Earnings[i]
    count <- count + 1
  }
  i <- i + 1
  if (i > nrow(SP500)) break
}
avg_earnings_repeat <- sum_earnings / count
cat("Average Earnings (repeat loop):", avg_earnings_repeat, "\n")

#14
sum_earnings <- 0
count <- 0
for (i in 1:nrow(SP500)) {
  if (!is.na(SP500$Earnings[i]) & !is.na(SP500$Dividend[i]) & SP500$Dividend[i] > 25) {
    sum_earnings <- sum_earnings + SP500$Earnings[i]
    count <- count + 1
  }
}
avg_earnings_div25_for <- sum_earnings / count
cat("Average Earnings (Div > 25, for loop):", avg_earnings_div25_for, "\n")

#15
sum_earnings <- 0
count <- 0
i <- 1
while (i <= nrow(SP500)) {
  if (!is.na(SP500$Earnings[i]) & !is.na(SP500$Dividend[i]) & SP500$Dividend[i] > 25) {
    sum_earnings <- sum_earnings + SP500$Earnings[i]
    count <- count + 1
  }
  i <- i + 1
}
avg_earnings_div25_while <- sum_earnings / count
cat("Average Earnings (Div > 25, while loop):", avg_earnings_div25_while, "\n")

#16
sum_earnings <- 0
count <- 0
i <- 1
repeat {
  if (!is.na(SP500$Earnings[i]) & !is.na(SP500$Dividend[i]) & SP500$Dividend[i] > 25) {
    sum_earnings <- sum_earnings + SP500$Earnings[i]
    count <- count + 1
  }
  i <- i + 1
  if (i > nrow(SP500)) break
}
avg_earnings_div25_repeat <- sum_earnings / count
cat("Average Earnings (Div > 25, repeat loop):", avg_earnings_div25_repeat, "\n")