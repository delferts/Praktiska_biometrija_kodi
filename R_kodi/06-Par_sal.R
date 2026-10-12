# Paraugkopu salīdzināšana
## Paraugkopu salīdzināšana programmā R
### Datu sagatavošana
niedr <- read.table(
  file = "niedres2.txt",
  header = TRUE,
  sep = "\t",
  dec = ".",
  stringsAsFactors = TRUE
)
str(niedr)

summary(niedr)

niedr2 <- niedr[niedr$paraug == "Austr" | niedr$paraug == "Riet", ]
str(niedr2)
niedr2 <- droplevels(niedr2)
str(niedr2)

### Divu neatkarīgu paraugkopu salīdzināšana ar parametriskajām metodēm
var.test(niedr2$garums ~ niedr2$paraug)

t.test(niedr2$garums ~ niedr2$paraug, var.equal = TRUE)

t.test(niedr2$garums ~ niedr2$paraug)

### Vairāku neatkarīgu paraugkopu salīdzināšana ar parametriskajām metodēm
library(car)
leveneTest(niedr$platums ~ niedr$paraug)

pairwise.t.test(niedr$platums, niedr$paraug)

### Atkarīgu paraugkopu salīdzināšana ar parametriskām metodēm
rokas <- read.table(file = "rokas.txt", header = TRUE, sep = "\t", dec = ".")
str(rokas)

t.test(rokas$laba, rokas$kreisa, paired = TRUE)

t.test(rokas$laba, rokas$kreisa)

### Vienas paraugkopas t-tests
t.test(niedr$platums, mu = 3.0)

### Divu neatkarīgu paraugkopu salīdzināšana ar neparametriskajām metodēm
wilcox.test(niedr2$garums ~ niedr2$paraug)

### Divu atkarīgu paraugkopu salīdzināšana ar neparametriskajām metodēm
wilcox.test(rokas$laba, rokas$kreisa, paired = TRUE)

### $\chi^2$ tests
zirni <- c(315, 108, 101, 32)
teor.zirni <- c(9, 3, 3, 1) / 16
chisq.test(x = zirni, p = teor.zirni)

koki <- matrix(c(12, 34, 56, 23, 8, 27, 33, 47, 14, 11), ncol = 2)
rownames(koki) <- c("Priede", "Egle", "Bērzs", "Ozols", "Kļava")
colnames(koki) <- c("Paraug A", "Paraug B")
koki
chisq.test(koki)

### Paraugkopu grafiskā salīdzināšana
boxplot(niedr$platums ~ niedr$paraug)

### Permutāciju un randomizēšanas tests paraugkopu salīdzināšanai
par1 <- niedr$garums[niedr$paraug == "Austr"]
par2 <- niedr$garums[niedr$paraug == "Riet"]
t.test(par1, par2)
vid.st <- mean(par1) - mean(par2)
vid.st

set.seed(76757)
kopa <- c(par1, par2)
starpibas <- NULL
for (i in 1:999) {
  paraug <- sample(1:34, 17)
  vid1 <- mean(kopa[paraug])
  vid2 <- mean(kopa[-paraug])
  starpibas[i] <- vid1 - vid2
}
starpibas[1000] <- vid.st

hist(starpibas)

mean(abs(starpibas) >= abs(vid.st))
