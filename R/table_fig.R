library(broman)
tab <- read.table("table.txt", header=TRUE)

bgcolor <- rgb(0.1, 0.1, 0.1, maxColorValue=1)

pdf("../Figs/table_fig.pdf", height=4, width=4, pointsize=12)
par(bg=bgcolor, fg="white", col.axis="white", col.main="white", col.lab="white")
layout(cbind(1,2,3), width=c(1.65,1,1))
xlab <- expression(paste(-log[10], " P"))
lev <- factor(tab[,1], levels=tab[,1])
par(mar=c(4.1,5.6,3.1,0.6))
dotplot(lev, -log10(tab[,2]), rotate=TRUE, main=colnames(tab)[2], ylab="", xlim=c(0, 31),
        xaxs="i", xlab=xlab, bg="violetred", cex=1.5, bgcolor="gray88")
par(mar=c(4.1,0.6, 3.1,0.6))
nam <- " "
for(i in 2:10) nam <- c(" ", paste0(" ", nam))
nam <- factor(nam, levels=nam)
dotplot(nam, -log10(tab[,3]), rotate=TRUE,yat=NA, main=colnames(tab)[3], xlim=c(0, 31),
        xaxs="i", xlab=xlab, bg="violetred", cex=1.5, bgcolor="gray88")
dotplot(nam, -log10(tab[,4]), rotate=TRUE,yat=NA, main=colnames(tab)[4], xlim=c(0, 31),
        xaxs="i", xlab=xlab, bg="violetred", cex=1.5, bgcolor="gray88")

dev.off()


tab <- tab[order(tab[,2]),]
lev <- factor(tab[,1], levels=tab[,1])
pdf("../Figs/table_fig_B.pdf", height=4, width=4, pointsize=12)
par(bg=bgcolor, fg="white", col.axis="white", col.main="white", col.lab="white")
layout(cbind(1,2,3), width=c(1.65,1,1))
xlab <- expression(paste(-log[10], " P"))
par(mar=c(4.1,5.6,3.1,0.6))
dotplot(lev, -log10(tab[,2]), rotate=TRUE, main=colnames(tab)[2], ylab="", xlim=c(0, 31),
        xaxs="i", xlab=xlab, bg="violetred", cex=1.5, bgcolor="gray88")
par(mar=c(4.1,0.6, 3.1,0.6))
dotplot(nam, -log10(tab[,3]), rotate=TRUE,yat=NA, main=colnames(tab)[3], xlim=c(0, 31),
        xaxs="i", xlab=xlab, bg="violetred", cex=1.5, bgcolor="gray88")
dotplot(nam, -log10(tab[,4]), rotate=TRUE,yat=NA, main=colnames(tab)[4], xlim=c(0, 31),
        xaxs="i", xlab=xlab, bg="violetred", cex=1.5, bgcolor="gray88")

dev.off()
