# Title: make-shots-charts-script.R
# Description: workout1 - plot shots each player make
# Input(s): andre-iguodala.csv draymond-green.csv kevin-durant.csv klay-thompson.csv stephen-curry.csv
# Output(s):make-shots-charts-script.R
# Author(s): Chenganji Fan
# Date: 3-12-2019

library(ggplot2)
library(jpeg)
library(grid)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

pdf(file="../images/andre-iguodala-shot-chart.pdf",width=6.5,height=5)
ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x=x, y=y, color=shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala") +
  theme_minimal()
dev.off()

pdf(file="../images/draymond-green-shot-chart.pdf",width=6.5,height=5)
ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x=x, y=y, color=shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green") +
  theme_minimal()
dev.off()

pdf(file="../images/kevin-durant-shot-chart.pdf",width=6.5,height=5)
ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x=x, y=y, color=shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant") +
  theme_minimal()
dev.off()

pdf(file="../images/stephen-curry-shot-chart.pdf",width=6.5,height=5)
ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x=x, y=y, color=shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry") +
  theme_minimal()
dev.off()

pdf(file="../images/klay-thompson-shot-chart.pdf",width=6.5,height=5)
ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x=x, y=y, color=shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson") +
  theme_minimal()
dev.off()

pdf(file="../images/gsw-shot-charts.pdf",width=8,height=7)
ggplot(data = shots_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x=x, y=y, color=shot_made_flag)) + 
  ylim(-50, 420) +
  facet_wrap(~name) +
  theme_minimal()
dev.off()

png(file = "../images/gsw-shot-charts.png")
ggplot(data = shots_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x=x, y=y, color=shot_made_flag)) + 
  ylim(-50, 420) +
  facet_wrap(~name) +
  theme_minimal()
dev.off()
