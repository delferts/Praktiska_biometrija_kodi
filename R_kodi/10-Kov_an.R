# Kovariācijas analīze
## Dati
dieta <- read.table(file = "dieta.txt", header = TRUE, sep = "\t", dec = ".")
str(dieta)

summary(dieta)

## Dispersijas analīze
mod <- lm(samazinajums ~ metode, data = dieta)
anova(mod)

with(dieta, tapply(samazinajums, metode, mean))

with(dieta, boxplot(samazinajums ~ metode))

## Kvantitatīva mainīgā iekļaušana modelī
mod1 <- lm(samazinajums ~ metode + svars, data = dieta)
anova(mod1)

summary(mod1)

mod2 <- lm(samazinajums ~ metode * svars, data = dieta)
anova(mod2)

AIC(mod, mod1, mod2)

jauns <- seq(60, 140, 5)
pred.esana <- predict(
  mod1,
  data.frame(svars = jauns, metode = rep("esana", 17))
)
pred.kopa <- predict(mod1, data.frame(svars = jauns, metode = rep("kopa", 17)))
plot(
  dieta$samazinajums ~ dieta$svars,
  pch = as.numeric(factor(dieta$metode)),
  xlab = "Sakotnejais svars",
  ylab = "Svara samazinajums"
)
lines(pred.kopa ~ jauns, lty = 1)
lines(pred.esana ~ jauns, lty = 2)
