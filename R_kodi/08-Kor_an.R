# Korelācijas analīze
## Korelācijas analīze programmā R
### Grafiskā pārbaude
smiltaji <- read.table(
  file = "smiltaji.txt",
  header = TRUE,
  sep = "\t",
  dec = "."
)

pairs(smiltaji)

par(mfrow = c(2, 2))
library(car)
for (i in 1:4) {
  qqPlot(smiltaji[, i], main = names(smiltaji)[i])
}

### Pīrsona korelācijas analīze
cor(smiltaji[, 1:3])

library(ltm)
rcor.test(smiltaji[, 1:3])

cor.test(smiltaji$pH, smiltaji$sunas)

### Rangu korelācijas analīze
cor.test(smiltaji$sugas, smiltaji$smilts, method = "spearman")
cor.test(smiltaji$sugas, smiltaji$smilts, method = "kendall")

### Autokorelācija
priede <- read.table(file = "priede.txt", header = TRUE, sep = "\t", dec = ".")
str(priede)

acf(priede)

akor <- acf(priede, plot = FALSE)
akor
