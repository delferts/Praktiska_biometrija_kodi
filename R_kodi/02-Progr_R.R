# Ievads darbā ar programmu R
## Kas ir programma R un kā uzsākt darbu?
### R vide
### R instalācija un papildus pakotnes
library(grid)

### Palīdzības iegūšana
help(plot)

??plot

## Darbs ar R
### Komandu veidošana
### Kalkulators
4 + 7
log(8, 2)
exp(2)

### Datu veidi
### Datu struktūras
#### Vektors
pirmais <- c(1, 5, 7, 4, 8, 10)
pirmais
otrais <- c("A", "B", "C", "D", "E", "F")
otrais

#### Matrice
tresais <- matrix(1:15, ncol = 3)
tresais

ceturtais <- cbind(pirmais, otrais)
ceturtais

piektais <- list(vekt1 = pirmais, matr1 = tresais, matr2 = ceturtais)
piektais

#### Datu rāmis (data frame)
sestais <- data.frame(pirmais, otrais)
sestais
septitais <- data.frame(kol1 = c(1, 2, 3, 4), kol2 = c(5, 6, 7, 8))
septitais

### Datu importēšana
#### Teksta failu importēšana
dati <- read.table(file = "niedres.txt", header = TRUE, sep = "\t", dec = ".")
dati2 <- read.csv(file = "niedres.txt", header = TRUE, sep = "\t", dec = ".")
dati3 <- read.csv2(file = "niedres.txt", header = TRUE, sep = "\t", dec = ".")
dati[1:10, ]

#### Excel failu importēšana
library(readxl)
dati.ex <- read_excel("faila.nosaukums.xlsx")

#### Iekļauto datu importēšana
data()
data(package = .packages(all.available = TRUE))

data(cars)
data(cars, package = "datasets")
cars[1:10, ]

### Datu eksportēšana
write.table(
  x = dati,
  file = "eksports.txt",
  row.names = FALSE,
  sep = "\t",
  dec = "."
)

### Darbs ar datiem
str(dati)
str(sestais)
str(piektais)
str(tresais)
str(otrais)

head(dati)
tail(dati)

#### Daļas no objekta atlasīšana
otrais[1]

otrais[c(1, 4)]

otrais[-3]

tresais[2, 2]

tresais[1, ]
tresais[, 2]

piektais$vekt1
piektais[[2]]

piektais[[2]][1, ]

sestais$pirmais
sestais["pirmais"]

sestais[5, 1]

garums

### Darba vides sakārtošana
ls()

rm(pirmais)
