# Datu izzināšana un normalitātes testi
## Datu izzināšana
niedr <- read.table(file = "niedres2.txt", header = TRUE, sep = "\t", dec = ".")
str(niedr)

plot(niedr$garums)

plot(niedr$garums, niedr$platums)

boxplot(niedr$garums)

boxplot(niedr$garums ~ niedr$paraug)

stripchart(niedr$garums)

stripchart(niedr$garums, method = "stack", vert = TRUE)

hist(niedr$garums)

## Normalitātes testi
### Grafiskā analīze
qqnorm(niedr$garums)
qqline(niedr$garums)

library(car)
qqPlot(niedr$garums)

### Analītiskā analīze
shapiro.test(niedr$garums)

tapply(niedr$garums, niedr$paraug, shapiro.test)

library(nortest)
ad.test(niedr$garums)

