# Statistiskie rādītāji un ticamības intervāli
## Statistiskie rādītāji
### Statistisko rādītāju aprēķināšana programmā R
niedr <- read.table(file = "niedres2.txt", header = TRUE, sep = "\t", dec = ".")
str(niedr)

mean(niedr$garums)
sd(niedr$garums)
var(niedr$garums)
median(niedr$garums)

round(mean(niedr$garums), 2)

set.seed(1234)
x <- c(rnorm(20), NA)
mean(x)

mean(x, na.rm = TRUE)

min(niedr$garums)
max(niedr$garums)
range(niedr$garums)

quantile(niedr$garums)

quantile(niedr$garums, probs = c(0.025, 0.975))

summary(niedr$garums)

summary(niedr)

tapply(niedr$garums, niedr$paraug, sd)

## Ticamības intervāli
### Ticamības intervālu aprēķināšana
robeza <- qt((1 - 0.01 / 2), 49) * (sd(niedr$garums)) / sqrt(50)
augsa <- mean(niedr$garums) + robeza
apaksa <- mean(niedr$garums) - robeza
round(apaksa, 2)
round(augsa, 2)

tests <- t.test(niedr$garums, conf.level = 0.99)
names(tests)
round(tests$conf.int, 2)

### Bootstrap ticamības intervāli
set.seed(1234)
library(boot)
videjie <- function(data, indices) {
  d <- data[indices]
  mean(d)
}
dat <- boot(data = niedr$garums, statistic = videjie, R = 1000)

plot(dat)

boot.ci(dat, conf = 0.99)

videjie <- tapply(niedr$garums, niedr$paraug, mean)
videjie

vid.rob <- tapply(
  niedr$garums,
  niedr$paraug,
  function(x) (qt((1 - 0.01 / 2), length(x)) * sd(x) / sqrt(length(x)))
)
vid.rob

library(plotrix)
plotCI(
  1:3,
  as.vector(videjie),
  as.vector(vid.rob),
  axes = FALSE,
  xlab = "Puse",
  ylab = "Videjais garums",
  ylim = c(0, 50),
  lwd = 2
)
axis(1, at = 1:3, labels = c("A", "R", "Z"))
axis(2, at = seq(0, 50, 10))
box()
