setwd("C:/Users/johnny.soares/Desktop/testeR")

# Reading file based on Absolue path  (setwd does not matter)
N2O2014<-read.csv("C:/Users/johnny.soares/Desktop/testeR/data/N2O2014.csv")

#Reading file based on relative pah (setwd is important)
N2O2014<-read.csv("testeR/data/N2O2014.csv")

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
