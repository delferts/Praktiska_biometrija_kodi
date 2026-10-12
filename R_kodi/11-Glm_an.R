# Vispārinātie lineārie modeļi
## Dati
nezales <- read.table(file = "nezales.txt", header = TRUE)
str(nezales)

head(nezales)
summary(nezales)

veids1 <- read.table(file = "veids1.txt", header = TRUE, sep = "\t", dec = ".")
str(veids1)

head(veids1)

veids2 <- read.table(file = "veids2.txt", header = TRUE, sep = "\t", dec = ".")
str(veids2)

head(veids2)

veids3 <- read.table(file = "veids3.txt", header = TRUE, sep = "\t", dec = ".")
str(veids3)

head(veids3)

## Puasona regresija
mod <- glm(skaits ~ grupa * pH, family = poisson("log"), data = nezales)
summary(mod)
anova(mod, test = "Chisq")

mod2 <- glm(skaits ~ grupa, family = poisson("log"), data = nezales)
summary(mod2)

anova(mod, mod2, test = "Chisq")
AIC(mod, mod2)

## Binārā loģistiskā regresija
mod1 <- glm(
  bojajums ~ skirne + veids,
  family = binomial("logit"),
  data = veids1
)
summary(mod1)

mod2 <- glm(
  cbind(bojats, nebojats) ~ skirne + veids,
  family = binomial("logit"),
  data = veids2
)
summary(mod2)

mod3 <- glm(
  procents ~ skirne + veids,
  weights = skaits,
  family = binomial("logit"),
  data = veids3
)
summary(mod3)

predict(mod3)
predict(mod3, type = "response")
