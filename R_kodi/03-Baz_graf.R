# Grafiskās iespējas programmā R
## Pamatgrafiki
niedres <- read.table(file = "niedres.txt", header = TRUE, sep = "\t", dec = ".")
str(niedres)

### plot()
plot(niedres$platums)

### boxplot()
boxplot(niedres$platums)

### hist()
hist(niedres$platums)

### barplot()
barplot(niedres$platums)

## Dati grafiku veidošanai
plot(niedres$platums)
with(niedres, plot(platums))

plot(niedres$platums, niedres$garums)
plot(niedres$garums ~ niedres$platums)

## Grafiku parametru noteikšana
### Grafiku izvietojums lapā
par(mfrow = c(2, 2))
par(mfcol = c(2, 2))
layout(matrix(c(1, 2, 3, 4), ncol = 2))
plot(niedres$garums)
hist(niedres$garums)
boxplot(niedres$garums)
barplot(niedres$garums)

layout(matrix(c(1, 1, 2, 3), ncol = 2))
plot(niedres$garums)
hist(niedres$garums)
boxplot(niedres$garums)

### plot() grafiku tipi
par(mfrow = c(2, 3))
plot(niedres$garums, type = "l", main = "type=\"l\"")
plot(niedres$garums, type = "h", main = "type=\"h\"")
plot(niedres$garums, type = "b", main = "type=\"b\"")
plot(niedres$garums, type = "o", main = "type=\"o\"")
plot(niedres$garums, type = "s", main = "type=\"s\"")
plot(niedres$garums, type = "p", main = "type=\"p\"")

### Līniju parametri
x <- rep(10, 10)
plot(x, type = "l", lty = 1, ylim = c(3, 11), axes = FALSE, ann = FALSE, lwd = 2)
lines(x - 1, lty = 2, lwd = 2)
lines(x - 2, lty = 3, lwd = 2)
lines(x - 3, lty = 4, lwd = 2)
lines(x - 4, lty = 5, lwd = 2)
lines(x - 5, lty = 6, lwd = 2)
lines(x - 6, lty = "664422", lwd = 2)
box()

layout(matrix(c(1, 3, 5, 2, 4, 5), ncol = 2))
plot(niedres$garums, type = "l")
plot(niedres$garums, type = "l", lty = 4)
plot(niedres$garums, type = "l", lty = 4, lwd = 12)
plot(niedres$garums, type = "l", lty = 4, lwd = 12, lend = "butt")
plot(niedres$garums, type = "l", lty = 4, lwd = 12, lend = "butt", ljoin = "bevel")

### Simbolu veidi
par(mar = c(2, 2, 1, 1))
layout(matrix(1:9, ncol = 3))
x <- rnorm(10)
plot(x, ann = FALSE)
plot(x, pch = 0, ann = FALSE)
plot(x, pch = 5, ann = FALSE)
plot(x, pch = 8, ann = FALSE)
plot(x, pch = 12, ann = FALSE)
plot(x, pch = 17, ann = FALSE)
plot(x, pch = 23, ann = FALSE)
plot(x, pch = ".", ann = FALSE)
plot(x, pch = "A", ann = FALSE)

### Virsraksti un teksti pie asīm
plot(niedres$garums,
  main = "Parasta niedre", xlab = "Kartas skaitlis",
  ylab = "Lapas garums (cm)"
)

plot(niedres$garums, ann = FALSE)
title("Parasta niedre")
mtext("Kartas skaitlis", side = 1, line = 1)
mtext("Lapas garums (cm)", side = 2, line = 3)

### Teksts grafika iekšienē
plot(niedres$garums)
text(20, 20, "pirmais")
text(40, 40, "otrais", pos = 3, srt = 25)

### Tekstu parametri
plot(niedres$garums,
  main = "Parasta niedre", xlab = "Kartas skaitlis",
  ylab = "Lapas garums (cm)", cex.main = 3, cex.lab = 1.5, cex.axis = 0.8,
  font.main = 3, font.axis = 4, font.lab = 2
)

### Asis
par(mfcol = c(1, 2))
plot(niedres$garums)
plot(niedres$garums, xlim = c(10, 40), ylim = c(-10, 80))

par(mfcol = c(1, 2))
plot(niedres$garums)
plot(niedres$garums, axes = FALSE)
axis(1, at = seq(0, 50, 15), las = 2)
axis(2, at = c(20, 40, 60), labels = c("aa", "bb", "cc"), las = 1)
box()

### Divas y asis
par(mar = c(5, 5, 2, 5))
plot(niedres$garums, type = "l")
par(new = TRUE)
plot(niedres$platums, type = "l", lty = 3, axes = FALSE, ann = FALSE)
axis(4, at = seq(0, 8, 2))
mtext(side = 4, line = 2, "platums")

### Krāsas
par(bg = "lightblue")
plot(niedres$garums,
  fg = "red", main = "Slikts grafiks",
  col.main = "green", col.axis = "yellow"
)

### Leģenda
par(mar = c(5, 5, 2, 5))
plot(niedres$garums, type = "l")
par(new = TRUE)
plot(niedres$platums, type = "l", lty = 3, axes = FALSE, ann = FALSE)
axis(4, at = seq(0, 8, 2))
mtext(side = 4, line = 2, "platums")
legend(0, 7, lty = c(1, 3), c("garums", "platums"))

### Līnijas grafikos
plot(niedres$garums ~ niedres$platums)
abline(lm(niedres$garums ~ niedres$platums))
abline(h = c(30, 40), lty = c(2, 3))
abline(v = c(3, 5), col = "grey55")

## Grafiku saglabāšana
