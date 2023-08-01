library(readr)
library(ggplot2)
setwd("/Users/jackhostetler/Desktop")

data <- read_csv('AugmentationData.csv')

print(data)

plot(data$C, data$`C*`,
     xlab = "x-axis",
     ylab = "y-axis",
     main = "Plot"
)
ggplot(data, aes(x=C, y=`C*`)) +
  geom_point(aes(color=Augmentation)) +
  labs(title="",x="C (mg/l)", y="C* (mg/g)") +
  scale_color_manual(values=c('#041e42', '#ba0c2f', '#edae49', '#66a182')) +
  theme_classic()
