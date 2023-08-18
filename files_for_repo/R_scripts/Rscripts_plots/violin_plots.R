library(ggplot2)


data<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/violin_plot.csv")
data_b6<-subset(data,data$parameter=="b_6")


##create plot

p <- ggplot(data_b6, aes(x=model, y=value, fill=as.factor(disease))) + 
  geom_violin(trim=FALSE)
p + geom_hline(yintercept= -0.5189722)

# Rotate the violin plot
p + coord_flip()
# Set trim argument to FALSE
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_violin(trim=FALSE)