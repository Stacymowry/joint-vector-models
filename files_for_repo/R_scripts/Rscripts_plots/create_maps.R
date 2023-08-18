##Script to make maps
##Stacy Mowry r
##06/20/2023

##load libraries
library(raster)

##load in predictions
data_m1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m1_m6/Sim_C/full_preds/m1c_run1_full.csv")
data_m2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m1_m6/Sim_C/full_preds/m2c_run1_full.csv")
data_m3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m1_m6/Sim_C/full_preds/m3c_run1_full.csv")
data_m4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m1_m6/Sim_C/full_preds/m4c_run1_full.csv")
data_m5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m1_m6/Sim_C/full_preds/m5c_run1_full.csv")
data_m6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m1_m6/Sim_C/full_preds/m6c_run1_full.csv")
data_m7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m7c_run1_full.csv")
data_m8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m8c_run1_full.csv")
data_m9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m9c_run1_full.csv")
data_m10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m10c_run1_full.csv")
data_m11<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m11c_run1_full.csv")
data_m12<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m12c_run1_full.csv")


##load in outline
outline<-read.csv("/Users/stacymowry/Desktop/Research/REDI-NET/data_outputs/grids/Fl/gridsp.csv")

ouline_r<- rasterFromXYZ(outline[, c('x1', 'x2', 'out')])
m1_ixosc_r <- rasterFromXYZ(data_m1[, c('x', 'y', 'pred_ixosc_m1')])
true_ixosc_r <- rasterFromXYZ(data_m1[, c('x', 'y', 'ixosc_1')])
m2_ixosc_r <- rasterFromXYZ(data_m2[, c('x', 'y', 'pred_ixosc_m2')])
m3_ixosc_r <- rasterFromXYZ(data_m3[, c('x', 'y', 'pred_ixosc_m3')])
m4_ixosc_r <- rasterFromXYZ(data_m4[, c('x', 'y', 'pred_ixosc_m4')])
m5_ixosc_r <- rasterFromXYZ(data_m5[, c('x', 'y', 'pred_ixosc_m5')])
m6_ixosc_r <- rasterFromXYZ(data_m6[, c('x', 'y', 'pred_ixosc_m6')])
m7_ixosc_r <- rasterFromXYZ(data_m7[, c('x', 'y', 'pred_ixosc_m1')])
m8_ixosc_r <- rasterFromXYZ(data_m8[, c('x', 'y', 'pred_ixosc_m2')])
m9_ixosc_r <- rasterFromXYZ(data_m9[, c('x', 'y', 'pred_ixosc_m3')])
m10_ixosc_r <- rasterFromXYZ(data_m10[, c('x', 'y', 'pred_ixosc_m4')])
m11_ixosc_r <- rasterFromXYZ(data_m11[, c('x', 'y', 'pred_ixosc_m5')])
m12_ixosc_r <- rasterFromXYZ(data_m12[, c('x', 'y', 'pred_ixosc_m6')])
data_m12$diff<-(data_m12$pred_ixosc_m6-data_m12$ixosc_1)
data_m11$diff<-(data_m11$pred_ixosc_m5-data_m12$ixosc_1)
data_m10$diff<-(data_m10$pred_ixosc_m4-data_m12$ixosc_1)
data_m9$diff<-(data_m9$pred_ixosc_m3-data_m12$ixosc_1)
data_m8$diff<-(data_m8$pred_ixosc_m2-data_m12$ixosc_1)
data_m7$diff<-(data_m7$pred_ixosc_m1-data_m12$ixosc_1)
data_m6$diff<-(data_m6$pred_ixosc_m6-data_m12$ixosc_1)
data_m5$diff<-(data_m5$pred_ixosc_m5-data_m12$ixosc_1)
data_m4$diff<-(data_m4$pred_ixosc_m4-data_m12$ixosc_1)
data_m3$diff<-(data_m3$pred_ixosc_m3-data_m12$ixosc_1)
data_m2$diff<-(data_m2$pred_ixosc_m2-data_m12$ixosc_1)
data_m1$diff<-(data_m1$pred_ixosc_m1-data_m12$ixosc_1)
m12_diff_r <- rasterFromXYZ(data_m12[, c('x', 'y', 'diff')])
m11_diff_r <- rasterFromXYZ(data_m11[, c('x', 'y', 'diff')])
m10_diff_r <- rasterFromXYZ(data_m10[, c('x', 'y', 'diff')])
m9_diff_r <- rasterFromXYZ(data_m9[, c('x', 'y', 'diff')])
m8_diff_r <- rasterFromXYZ(data_m8[, c('x', 'y', 'diff')])
m7_diff_r <- rasterFromXYZ(data_m7[, c('x', 'y', 'diff')])
m6_diff_r <- rasterFromXYZ(data_m6[, c('x', 'y', 'diff')])
m5_diff_r <- rasterFromXYZ(data_m5[, c('x', 'y', 'diff')])
m4_diff_r <- rasterFromXYZ(data_m4[, c('x', 'y', 'diff')])
m3_diff_r <- rasterFromXYZ(data_m3[, c('x', 'y', 'diff')])
m2_diff_r <- rasterFromXYZ(data_m2[, c('x', 'y', 'diff')])
m1_diff_r <- rasterFromXYZ(data_m1[, c('x', 'y', 'diff')])


cuts_base=c(1) #set breaks
pal_base<- colorRampPalette(c("grey","grey"))

cuts=c(seq(-.5,0.35,.05)) #set breaks
pal <- colorRampPalette(c("lemonchiffon","khaki1","lightgoldenrod","gold","orange","chocolate1", "orangered","red","red2","red3","darkred"))
pal2 <- colorRampPalette(c("blue4","blue2","dodgerblue","deepskyblue1","white","white", "white","red","red2","red3","darkred"))


plot(ouline_r, col = "grey", legend = NULL )
plot(m2_ixosc_r, add=TRUE, col=pal2(18), breaks=cuts)
plot(m12_ixosc_r, add=TRUE)
