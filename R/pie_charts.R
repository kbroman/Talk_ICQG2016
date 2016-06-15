x <- 18:22
names(x) <- LETTERS[seq(along=x)]

library(RColorBrewer)
library(plotrix) # for pie3D
library(broman)

bgcolor <- rgb(0.1, 0.1, 0.1, maxColorValue=1)

pdf("../Figs/piechartsA.pdf", height=5, width=9, pointsize=18)
par(bg=bgcolor, fg="white")
par(mar=rep(1.6, 4))
par(mfrow=c(1,3))
pie(x, names(x), col=brewer.pal(5, "Set2"))
dev.off()

pdf("../Figs/piechartsB.pdf", height=5, width=9, pointsize=18)
par(bg=bgcolor, fg="white")
par(mar=rep(1.6, 4))
par(mfrow=c(1,3))
pie(x, names(x), col=brewer.pal(5, "Set2"))
pie3D(x, labels=names(x), explode=0.1, col=brewer.pal(5, "Set2"),
      mar=rep(1.6,4), labelcex=1)
dev.off()

pdf("../Figs/piechartsC.pdf", height=5, width=9, pointsize=18)
par(bg=bgcolor, fg="white")
par(mar=rep(1.6, 4))
par(mfrow=c(1,3))
pie(x, names(x), col=brewer.pal(5, "Set2"))
pie3D(x, labels=names(x), explode=0.1, col=brewer.pal(5, "Set2"),
      mar=rep(1.6,4), labelcex=1)
par(pty="s", col.axis="white")
dotplot(names(x), x, rotate=TRUE, xlim=c(0, 25), bgcolor="gray88",
        pch=21, bg="violetred", cex=1.8, xaxs="i")
dev.off()
