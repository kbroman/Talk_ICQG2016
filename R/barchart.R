set.seed(20160615)
g <- rep(c("A", "B"), each=14)
x <- rep(0, length(g))
x[g=="A"] <- rnorm(sum(g=="A"), 10, 3)
x[g=="B"] <- rnorm(sum(g=="B"), rep(c(5,15), each=7), 1.5)


library(RColorBrewer)
library(plotrix) # for pie3D
library(broman)

bgcolor <- rgb(0.1, 0.1, 0.1, maxColorValue=1)

pdf("../Figs/barchart.pdf", height=5, width=9, pointsize=18)
par(bg=bgcolor, fg="white", col.lab="white", col.axis="white")
par(mar=c(3.1, 3.1, 1.1, 1.1))
par(mfrow=c(1,2))
dotplot(g, x, bgcolor="gray88", type="n", ylim=c(0, max(x)*1.05), yaxs="i")
me <- tapply(x, g, mean)
se <- tapply(x, g, function(a) sd(a)/sqrt(length(a)))
rect(0.75, 0, 1.25, me[1], col="slateblue", border="black")
segments(1, me[1], 1, me[1]+2*se[1], lwd=2, col="black")
segments(0.9, me[1]+2*se[1], 1.1, me[1]+2*se[1], lwd=2, col="black")
rect(1.75, 0, 2.25, me[2], col="violetred", border="black")
segments(2, me[2], 2, me[2]+2*se[2], lwd=2, col="black")
segments(1.9, me[2]+2*se[2], 2.1, me[2]+2*se[2], lwd=2, col="black")
box()

dotplot(g, x, bgcolor="gray88",
        pch=21, bg=rep(c("slateblue", "violetred"), each=14), ylim=c(0, max(x)*1.05), yaxs="i")
dev.off()
