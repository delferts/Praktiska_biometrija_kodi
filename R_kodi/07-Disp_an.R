# Dispersijas analīze
## Dati
augi <- read.table(file = "augi.txt", header = TRUE, sep = "\t", dec = ".")
str(augi)

summary(augi)

tapply(augi$biomasa, augi$barv, mean)
tapply(augi$biomasa, augi$udens, mean)

## Dispersiju homogenitāte
with(augi, bartlett.test(biomasa, barv))

with(augi, bartlett.test(biomasa, udens))

## Modeļu definēšana
mod1 <- aov(biomasa ~ barv * udens, data = augi)
summary(mod1)

mod2 <- aov(biomasa ~ barv, data = augi)
summary(mod2)

## Gradācijas klašu salīdzināšana
TukeyHSD(mod2, "barv")

## Rezultātu grafiskā attēlošana
boxplot(augi$biomasa ~ augi$barv)

library(gplots)
plotmeans(augi$biomasa ~ augi$barv, connect = FALSE, xlab = "baribas vielas")
