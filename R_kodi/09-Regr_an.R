# Regresijas analīze
## Dati
augi2 <- read.table(file = "augi2.txt", header = TRUE, sep = "\t", dec = ".")
str(augi2)

summary(augi2)

## Pāru regresija
mod1 <- lm(biomasa ~ gaisma, data = augi2)
summary(mod1)

plot(
  augi2$biomasa ~ augi2$gaisma,
  xlab = "Gaismas daudzums",
  ylab = "Augu biomasa"
)
abline(lm(augi2$biomasa ~ augi2$gaisma))

## Regresijas analīzes pieņēmumu pārbaude
par(mfrow = c(2, 2))
plot(mod1)

atlikums <- resid(mod1)
par(mfrow = c(2, 2))
plot(atlikums ~ augi2$jun.nokr)
plot(atlikums ~ augi2$jul.nokr)
plot(atlikums ~ augi2$aug.nokr)
plot(atlikums ~ augi2$pH)

## Vērtību prognozēšana
progn <- data.frame(gaisma = c(10, 50, 100))
predict(mod1, progn, interval = "prediction")

## Daudzfaktoru regresija
pairs(augi2)

round(cor(augi2), 2)

mod2 <- lm(biomasa ~ gaisma + jun.nokr + jul.nokr + aug.nokr + pH, data = augi2)
summary(mod2)

mod3 <- lm(biomasa ~ gaisma + jun.nokr + jul.nokr + pH, data = augi2)
summary(mod3)

mod4 <- lm(biomasa ~ gaisma + jun.nokr + jul.nokr, data = augi2)
summary(mod4)

AIC(mod2, mod4)

par(mfrow = c(2, 2))
plot(mod4)
