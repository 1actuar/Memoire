set.seed(908144032)

## GRAPHIQUE 1 ##
s0 <- 100
n <- 500
## On simule des temps d'arrivée Gamma
t <- c(0,rep(cumsum(rgamma(n,0.5)),each=2))
## On simule des sauts gaussiens
j <- head(c(0,0,rep(cumsum(rnorm(n,0.005/365,0.0025)),each=2)),-1)
## On trace le parcours
cbind(t,j)
pdf("CH3-SIMGAMMAGAUSS.pdf")
plot(t,s0*exp(j),type="l",xlab="t",ylab="Y(t)",main=" ")
dev.off()
write.csv(data.frame(Temps=t,Prix=s0*exp(j)),file="CH3-SIMGAMMAGAUSS.csv")

## GRAPHIQUE 2 ##
source("../contenus/r/code/rGAL.r")

d1 <- rGALkappa(2500,0,1,2,1)
pdf("CH3-SIMULGAL0121.pdf")
hist(d1,prob=TRUE,col="grey",breaks=25,xlab="y",ylab="f(y)",main="")
lines(density(d1),lwd=3)
dev.off()
