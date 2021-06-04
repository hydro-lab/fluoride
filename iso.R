library(readr)

x <- read_csv("FeSO4-iso.csv")

for (i in 1:nrow(x)) {
  x$C[i] <- (x$`C 1`[i] + x$`C 2`[i] + x$`C 3`[i])/3 # averages the three measurements of each trial; assumes mg/l
}

vol <- 0.05 # ml, volume of reactor

m <- vol * x$C # mg, calculates the mass remaining in solution in each reactor
control.mass <- m[1] # assumes that the first line is the control

sorbed.mass <- array(0, dim = (nrow(x)))
for (i in 2:nrow(x)) {
  sorbed.mass[i] <- control.mass - m[i]
}

Cstar <- sorbed.mass/x$`FeSO4 (g)`

plot(x$C, Cstar)
