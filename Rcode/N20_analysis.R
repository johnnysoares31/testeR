setwd("C:/Users/johnny.soares/Desktop/testeR")

# Reading file based on Absolue path  (setwd does not matter)
N2O2014<-read.csv("C:/Users/johnny.soares/Desktop/testeR/data/N2O2014.csv")

#Reading file based on relative pah (setwd is important)
N2O2014<-read.csv("./data/N2O2014.csv")

# Historgam of N20 on log scale
png("Output/histogram_N20.png")  # to open the file 
hist(x=N2O2014$N2Olog)
dev.off()   # To close the file

#ANOVA for N20
anova<-aov(N2O2014$N2Olog~N2O2014$Fonte)

#Output of ANOVA
summary(anova)

# Plot of N20
png("Output/N20_plot.png")
plot(N2O2014$Fonte, N2O2014$N2Olog)
dev.off()

#Normal distribution
shapiro.test(resid(anova))

#Histogram of residuals of anova
hist(x=resid(anova))

#read N2O means
N2Omean<-read.csv("./data/N2O2014Media.csv")

#plot N2Omeans
#first read package
library(ggplot2)

plot_of_N20 <- ggplot(data=N2Omean, aes(x= as.factor(Fonte), y= N2O))
plot_of_N20 <- plot_of_N20 + geom_bar(stat="identity", aes(fill="factor(Fonte)"))
plot(plot_of_N20)

#plot box plot
plot(N2O2014, x=N2O2014$Fonte, y=N2O2014$N2Olog)

# box plot in ggplot2
boxplot_of_N20 <- ggplot(data=N2O2014, aes(x= as.factor(N2O2014$Fonte), y= N2O2014$N2Olog))
boxplot_of_N20 + geom_boxplot()
#adding replicates values
boxplot_of_N20 + geom_boxplot() + geom_jitter()
#putting color
boxplot_of_N20 + geom_boxplot(aes(fill = N2O2014$Fonte)) + geom_jitter()
#changing color
boxplot_of_N20 + geom_boxplot(aes(fill = N2O2014$Fonte)) + geom_jitter() + scale_fill_grey() + theme_classic()
# editing axis, title
boxplot_of_N20 + geom_boxplot() + geom_jitter() +  xlab("N source") + ylab("Cumulative N2O-N Emission (log g/ha)")


