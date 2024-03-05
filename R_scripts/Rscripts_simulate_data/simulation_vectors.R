###Stacy Mowry 
###10/28/22
###Simulation for Fl work 

##load packages 
library(readxl)
library(usmap) #to plot sampling locations
library(ggplot2) #to plot sampling locations
library(readxl)
library(simcausal)

library(rnaturalearth)
library(rnaturalearthdata)

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

##load functions
normalize<-function(value, min, max) {
  normalized = (value - min) / (max - min)
  return(normalized)
}

##Load in 10 runs of individual species MAP estimates
m1.mcmc_run1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/m1.csv")
m1.mcmc_run2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/m1.csv")
m1.mcmc_run3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/m1.csv")
m1.mcmc_run4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/m1.csv")
m1.mcmc_run5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/m1.csv")
m1.mcmc_run6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/m1.csv")
m1.mcmc_run7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/m1.csv")
m1.mcmc_run8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/m1.csv")
m1.mcmc_run9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/m1.csv")
m1.mcmc_run10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/m1.csv")

##append all rows together and save columns of interest
m1.mcmc<-rbind(m1.mcmc_run1, m1.mcmc_run2, m1.mcmc_run3,m1.mcmc_run4,m1.mcmc_run5, m1.mcmc_run6,
               m1.mcmc_run7, m1.mcmc_run8, m1.mcmc_run9, m1.mcmc_run10)

m1.mcmc<-m1.mcmc[,2:61]

##write combined sampled to summary folder
#write.csv(m1.mcmc,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Summary/m1_combined_mcmc.csv")

#Ambam
b_0.ambam<-m1.mcmc[,"b_0.1"]
b_1.ambam<-m1.mcmc[,"b_1.1"]
b_2.ambam<-m1.mcmc[,"b_2.1"]
b_3.ambam<-m1.mcmc[,"b_3.1"]
b_4.ambam<-m1.mcmc[,"b_4.1"]
b_5.ambam<-m1.mcmc[,"b_5.1"]
b_6.ambam<-m1.mcmc[,"b_6.1"]
b_7.ambam<-m1.mcmc[,"b_7.1"]
b_9.ambam<-m1.mcmc[,"b_9.1"]
b_10.ambam<-m1.mcmc[,"b_10.1"]



#Ambma
b_0.ambma<-m1.mcmc[,"b_0.2"]
b_1.ambma<-m1.mcmc[,"b_1.2"]
b_2.ambma<-m1.mcmc[,"b_2.2"]
b_3.ambma<-m1.mcmc[,"b_3.2"]
b_4.ambma<-m1.mcmc[,"b_4.2"]
b_5.ambma<-m1.mcmc[,"b_5.2"]
b_6.ambma<-m1.mcmc[,"b_6.2"]
b_7.ambma<-m1.mcmc[,"b_7.2"]
b_9.ambma<-m1.mcmc[,"b_9.2"]
b_10.ambma<-m1.mcmc[,"b_10.2"]

#Ixosc
b_0.ixosc<-m1.mcmc[,"b_0.5"]
b_1.ixosc<-m1.mcmc[,"b_1.5"]
b_2.ixosc<-m1.mcmc[,"b_2.5"]
b_3.ixosc<-m1.mcmc[,"b_3.5"]
b_4.ixosc<-m1.mcmc[,"b_4.5"]
b_5.ixosc<-m1.mcmc[,"b_5.5"]
b_6.ixosc<-m1.mcmc[,"b_6.5"]
b_7.ixosc<-m1.mcmc[,"b_7.5"]
b_9.ixosc<-m1.mcmc[,"b_9.5"]
b_10.ixosc<-m1.mcmc[,"b_10.5"]

#Derva
b_0.derva<-m1.mcmc[,"b_0.3"]
b_1.derva<-m1.mcmc[,"b_1.3"]
b_2.derva<-m1.mcmc[,"b_2.3"]
b_3.derva<-m1.mcmc[,"b_3.3"]
b_4.derva<-m1.mcmc[,"b_4.3"]
b_5.derva<-m1.mcmc[,"b_5.3"]
b_6.derva<-m1.mcmc[,"b_6.3"]
b_7.derva<-m1.mcmc[,"b_7.3"]
b_9.derva<-m1.mcmc[,"b_9.3"]
b_10.derva<-m1.mcmc[,"b_10.3"]

##sample 10 values of each parameter 
set.seed(100)
sample(b_1.ambam,10)
set.seed(100)
sample(b_2.ambam,10)
set.seed(100)
sample(b_3.ambam,10)
set.seed(100)
sample(b_4.ambam,10)
set.seed(100)
sample(b_5.ambam,10)
set.seed(100)
sample(b_6.ambam,10)
set.seed(100)
sample(b_7.ambam,10)
set.seed(100)
sample(b_9.ambam,10)
set.seed(100)
sample(b_10.ambam,10)

set.seed(100)
sample(b_1.ambma,10)
set.seed(100)
sample(b_2.ambma,10)
set.seed(100)
sample(b_3.ambma,10)
set.seed(100)
sample(b_4.ambma,10)
set.seed(100)
sample(b_5.ambma,10)
set.seed(100)
sample(b_6.ambma,10)
set.seed(100)
sample(b_7.ambma,10)
set.seed(100)
sample(b_9.ambma,10)
set.seed(100)
sample(b_10.ambma,10)

set.seed(100)
sample(b_1.derva,10)
set.seed(100)
sample(b_2.derva,10)
set.seed(100)
sample(b_3.derva,10)
set.seed(100)
sample(b_4.derva,10)
set.seed(100)
sample(b_5.derva,10)
set.seed(100)
sample(b_6.derva,10)
set.seed(100)
sample(b_7.derva,10)
set.seed(100)
sample(b_9.derva,10)
set.seed(100)
sample(b_10.derva,10)

set.seed(100)
sample(b_1.ixosc,10)
set.seed(100)
sample(b_2.ixosc,10)
set.seed(100)
sample(b_3.ixosc,10)
set.seed(100)
sample(b_4.ixosc,10)
set.seed(100)
sample(b_5.ixosc,10)
set.seed(100)
sample(b_6.ixosc,10)
set.seed(100)
sample(b_7.ixosc,10)
set.seed(100)
sample(b_9.ixosc,10)
set.seed(100)
sample(b_10.ixosc,10)

##Load is Fl grid
fl_grid<-read.csv("/Users/stacymowry/Desktop/Fl_V2/fl2_grid_covars_scaled_newpoints.csv")

dtw = fl_grid$dtw
tmax = fl_grid$tmax
phdi = fl_grid$PHDI_average
ndvi = fl_grid$ndvi
prcp = fl_grid$prcp
urban = fl_grid$landcover_1
crop = fl_grid$landcover_2
GS = fl_grid$landcover_5 + fl_grid$landcover_7
forest = fl_grid$landcover_6 + fl_grid$landcover_11 + fl_grid$landcover_14 + fl_grid$landcover_15
wetland = fl_grid$landcover_18 

##Estimate species presence at each location based on MAP

ambam_pres<-matrix(nrow=nrow(fl_grid),ncol=10)
ambma_pres<-matrix(nrow=nrow(fl_grid),ncol=10)
derva_pres<-matrix(nrow=nrow(fl_grid),ncol=10)
ixosc_pres<-matrix(nrow=nrow(fl_grid),ncol=10)

#Ambam
for (i in 1:10)
{

ambam_pres[,i]<-(exp( b_0.ambam[i] + b_1.ambam[i]*dtw + b_2.ambam[i]*tmax
                          + b_3.ambam[i]*phdi + b_4.ambam[i]*ndvi + b_5.ambam[i]*prcp
                          + b_6.ambam[i]*urban + b_7.ambam[i]*crop  
                          + b_9.ambam[i]*forest + b_10.ambam[i]*wetland)/
                       (1 + exp( b_0.ambam[i] + b_1.ambam[i]*dtw + b_2.ambam[i]*tmax
                                 + b_3.ambam[i]*phdi + b_4.ambam[i]*ndvi + b_5.ambam[i]*prcp
                                 + b_6.ambam[i]*urban + b_7.ambam[i]*crop  
                                 + b_9.ambam[i]*forest + b_10.ambam[i]*wetland)))

#Ambma
ambma_pres[,i]<-(exp( b_0.ambma[i] + b_1.ambma[i]*dtw + b_2.ambma[i]*tmax
                          + b_3.ambma[i]*phdi + b_4.ambma[i]*ndvi + b_5.ambma[i]*prcp
                          + b_6.ambma[i]*urban + b_7.ambma[i]*crop  
                          + b_9.ambma[i]*forest + b_10.ambma[i]*wetland)/
                       (1 + exp( b_0.ambma[i] + b_1.ambma[i]*dtw + b_2.ambma[i]*tmax
                                 + b_3.ambma[i]*phdi + b_4.ambma[i]*ndvi + b_5.ambma[i]*prcp
                                 + b_6.ambma[i]*urban + b_7.ambma[i]*crop  
                                 + b_9.ambma[i]*forest + b_10.ambma[i]*wetland)))

#Ixosc
ixosc_pres[,i]<-(exp( b_0.ixosc[i] + b_1.ixosc[i]*dtw + b_2.ixosc[i]*tmax
                          + b_3.ixosc[i]*phdi + b_4.ixosc[i]*ndvi + b_5.ixosc[i]*prcp
                          + b_6.ixosc[i]*urban + b_7.ixosc[i]*crop  
                          + b_9.ixosc[i]*forest + b_10.ixosc[i]*wetland)/
                       (1 + exp( b_0.ixosc[i] + b_1.ixosc[i]*dtw + b_2.ixosc[i]*tmax
                                 + b_3.ixosc[i]*phdi + b_4.ixosc[i]*ndvi + b_5.ixosc[i]*prcp
                                 + b_6.ixosc[i]*urban + b_7.ixosc[i]*crop  
                                 + b_9.ixosc[i]*forest + b_10.ixosc[i]*wetland)))


#Derva
derva_pres[,i]<-(exp( b_0.derva[i] + b_1.derva[i]*dtw + b_2.derva[i]*tmax
                          + b_3.derva[i]*phdi + b_4.derva[i]*ndvi + b_5.derva[i]*prcp
                          + b_6.derva[i]*urban + b_7.derva[i]*crop  
                          + b_9.derva[i]*forest + b_10.derva[i]*wetland)/
                       (1 + exp( b_0.derva[i] + b_1.derva[i]*dtw + b_2.derva[i]*tmax
                                 + b_3.derva[i]*phdi + b_4.derva[i]*ndvi + b_5.derva[i]*prcp
                                 + b_6.derva[i]*urban + b_7.derva[i]*crop  
                                 + b_9.derva[i]*forest + b_10.derva[i]*wetland)))
}

vector_preds<-cbind(ambam_pres,ambma_pres,derva_pres,ixosc_pres)
colnames(vector_preds)<-c("ambam_1","ambam_2","ambam_3","ambam_4","ambam_5",
                          "ambam_6","ambam_7","ambam_8","ambam_9","ambam_10",
                          "ambma_1","ambma_2","ambma_3","ambma_4","ambma_5",
                          "ambma_6","ambma_7","ambma_8","ambma_9","ambma_10",
                          "derva_1","derva_2","derva_3","derva_4","derva_5",
                          "derva_6","derva_7","derva_8","derva_9","derva_10",
                          "ixosc_1","ixosc_2","ixosc_3","ixosc_4","ixosc_5",
                          "ixosc_6","ixosc_7","ixosc_8","ixosc_9","ixosc_10"
                          )

fl_grid<-cbind(fl_grid,vector_preds)

#write.csv(fl_grid,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/true_vec_dist.csv")


#fl_grid<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/true_vec_dist.csv")

##Select sampling sites
#ambam
set.seed(12)
ambam_large_locations<-sample(c(1:nrow(fl_grid)),size=500, replace = FALSE)
ambam_samples_large_1<-fl_grid[ambam_large_locations,]
ambam_samples_large_2<-fl_grid[ambam_large_locations,]
ambam_samples_large_3<-fl_grid[ambam_large_locations,]
ambam_samples_large_4<-fl_grid[ambam_large_locations,]
ambam_samples_large_5<-fl_grid[ambam_large_locations,]
ambam_samples_large_6<-fl_grid[ambam_large_locations,]
ambam_samples_large_7<-fl_grid[ambam_large_locations,]
ambam_samples_large_8<-fl_grid[ambam_large_locations,]
ambam_samples_large_9<-fl_grid[ambam_large_locations,]
ambam_samples_large_10<-fl_grid[ambam_large_locations,]


#ambma
set.seed(15)
ambma_large_locations<-sample(c(1:nrow(fl_grid)),size=470, replace = FALSE)
ambma_samples_large_1<-fl_grid[ambma_large_locations,]
ambma_samples_large_2<-fl_grid[ambma_large_locations,]
ambma_samples_large_3<-fl_grid[ambma_large_locations,]
ambma_samples_large_4<-fl_grid[ambma_large_locations,]
ambma_samples_large_5<-fl_grid[ambma_large_locations,]
ambma_samples_large_6<-fl_grid[ambma_large_locations,]
ambma_samples_large_7<-fl_grid[ambma_large_locations,]
ambma_samples_large_8<-fl_grid[ambma_large_locations,]
ambma_samples_large_9<-fl_grid[ambma_large_locations,]
ambma_samples_large_10<-fl_grid[ambma_large_locations,]


#derva
set.seed(19)
derva_large_locations<-sample(c(1:nrow(fl_grid)),size=500, replace = FALSE)
derva_samples_large_1<-fl_grid[derva_large_locations,]
derva_samples_large_2<-fl_grid[derva_large_locations,]
derva_samples_large_3<-fl_grid[derva_large_locations,]
derva_samples_large_4<-fl_grid[derva_large_locations,]
derva_samples_large_5<-fl_grid[derva_large_locations,]
derva_samples_large_6<-fl_grid[derva_large_locations,]
derva_samples_large_7<-fl_grid[derva_large_locations,]
derva_samples_large_8<-fl_grid[derva_large_locations,]
derva_samples_large_9<-fl_grid[derva_large_locations,]
derva_samples_large_10<-fl_grid[derva_large_locations,]


#ixosc
set.seed(22)
ixosc_large_locations<-sample(c(1:nrow(fl_grid)),size=500, replace = FALSE)
ixosc_samples_large_1<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_2<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_3<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_4<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_5<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_6<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_7<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_8<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_9<-fl_grid[ixosc_large_locations,]
ixosc_samples_large_10<-fl_grid[ixosc_large_locations,]


#ambma biased small
set.seed(400)
ambma_small_locations<-sample(c(1:nrow(fl_grid)),size=30, replace = FALSE)
ambma_samples_small_1<-fl_grid[ambma_small_locations,]
ambma_samples_small_2<-fl_grid[ambma_small_locations,]
ambma_samples_small_3<-fl_grid[ambma_small_locations,]
ambma_samples_small_4<-fl_grid[ambma_small_locations,]
ambma_samples_small_5<-fl_grid[ambma_small_locations,]
ambma_samples_small_6<-fl_grid[ambma_small_locations,]
ambma_samples_small_7<-fl_grid[ambma_small_locations,]
ambma_samples_small_8<-fl_grid[ambma_small_locations,]
ambma_samples_small_9<-fl_grid[ambma_small_locations,]
ambma_samples_small_10<-fl_grid[ambma_small_locations,]


#ixosc biased small
set.seed(4000)
ixosc_small_locations<-sample(c(1:nrow(fl_grid)),size=30, replace = FALSE)
ixosc_samples_small_1<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_2<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_3<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_4<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_5<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_6<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_7<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_8<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_9<-fl_grid[ixosc_small_locations,]
ixosc_samples_small_10<-fl_grid[ixosc_small_locations,]





##Simulated true presence

#Ambam (large)
for (i in 1:nrow(ambam_samples_large_1)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_1[i,"ambam_1"],ambam_samples_large_1$pred_samp[i]<-0,
         ambam_samples_large_1$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_2)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_2[i,"ambam_2"],ambam_samples_large_2$pred_samp[i]<-0,
         ambam_samples_large_2$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_3)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_3[i,"ambam_3"],ambam_samples_large_3$pred_samp[i]<-0,
         ambam_samples_large_3$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_4)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_4[i,"ambam_4"],ambam_samples_large_4$pred_samp[i]<-0,
         ambam_samples_large_4$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_5)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_5[i,"ambam_5"],ambam_samples_large_5$pred_samp[i]<-0,
         ambam_samples_large_5$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_6)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_6[i,"ambam_6"],ambam_samples_large_6$pred_samp[i]<-0,
         ambam_samples_large_6$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_7)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_7[i,"ambam_7"],ambam_samples_large_7$pred_samp[i]<-0,
         ambam_samples_large_7$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_8)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_8[i,"ambam_8"],ambam_samples_large_8$pred_samp[i]<-0,
         ambam_samples_large_8$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_9)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_9[i,"ambam_9"],ambam_samples_large_9$pred_samp[i]<-0,
         ambam_samples_large_9$pred_samp[i]<-1)}

for (i in 1:nrow(ambam_samples_large_10)){
  p<-runif(1,0,1) 
  ifelse(p > ambam_samples_large_10[i,"ambam_10"],ambam_samples_large_10$pred_samp[i]<-0,
         ambam_samples_large_10$pred_samp[i]<-1)}

#Ambma (large)
for (i in 1:nrow(ambma_samples_large_1)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_1[i,"ambma_1"],ambma_samples_large_1$pred_samp[i]<-0,
         ambma_samples_large_1$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_2)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_2[i,"ambma_2"],ambma_samples_large_2$pred_samp[i]<-0,
         ambma_samples_large_2$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_3)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_3[i,"ambma_3"],ambma_samples_large_3$pred_samp[i]<-0,
         ambma_samples_large_3$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_4)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_4[i,"ambma_4"],ambma_samples_large_4$pred_samp[i]<-0,
         ambma_samples_large_4$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_5)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_5[i,"ambma_5"],ambma_samples_large_5$pred_samp[i]<-0,
         ambma_samples_large_5$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_6)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_6[i,"ambma_6"],ambma_samples_large_6$pred_samp[i]<-0,
         ambma_samples_large_6$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_7)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_7[i,"ambma_7"],ambma_samples_large_7$pred_samp[i]<-0,
         ambma_samples_large_7$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_8)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_8[i,"ambma_8"],ambma_samples_large_8$pred_samp[i]<-0,
         ambma_samples_large_8$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_9)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_9[i,"ambma_9"],ambma_samples_large_9$pred_samp[i]<-0,
         ambma_samples_large_9$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_large_10)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_large_10[i,"ambma_10"],ambma_samples_large_10$pred_samp[i]<-0,
         ambma_samples_large_10$pred_samp[i]<-1)}

#Derva (large)
for (i in 1:nrow(derva_samples_large_1)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_1[i,"derva_1"],derva_samples_large_1$pred_samp[i]<-0,
         derva_samples_large_1$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_2)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_2[i,"derva_2"],derva_samples_large_2$pred_samp[i]<-0,
         derva_samples_large_2$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_3)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_3[i,"derva_3"],derva_samples_large_3$pred_samp[i]<-0,
         derva_samples_large_3$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_4)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_4[i,"derva_4"],derva_samples_large_4$pred_samp[i]<-0,
         derva_samples_large_4$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_5)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_5[i,"derva_5"],derva_samples_large_5$pred_samp[i]<-0,
         derva_samples_large_5$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_6)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_6[i,"derva_6"],derva_samples_large_6$pred_samp[i]<-0,
         derva_samples_large_6$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_7)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_7[i,"derva_7"],derva_samples_large_7$pred_samp[i]<-0,
         derva_samples_large_7$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_8)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_8[i,"derva_8"],derva_samples_large_8$pred_samp[i]<-0,
         derva_samples_large_8$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_9)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_9[i,"derva_9"],derva_samples_large_9$pred_samp[i]<-0,
         derva_samples_large_9$pred_samp[i]<-1)}

for (i in 1:nrow(derva_samples_large_10)){
  p<-runif(1,0,1) 
  ifelse(p > derva_samples_large_10[i,"derva_10"],derva_samples_large_10$pred_samp[i]<-0,
         derva_samples_large_10$pred_samp[i]<-1)}

#Ixosc (large)
for (i in 1:nrow(ixosc_samples_large_1)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_1[i,"ixosc_1"],ixosc_samples_large_1$pred_samp[i]<-0,
         ixosc_samples_large_1$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_2)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_2[i,"ixosc_2"],ixosc_samples_large_2$pred_samp[i]<-0,
         ixosc_samples_large_2$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_3)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_3[i,"ixosc_3"],ixosc_samples_large_3$pred_samp[i]<-0,
         ixosc_samples_large_3$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_4)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_4[i,"ixosc_4"],ixosc_samples_large_4$pred_samp[i]<-0,
         ixosc_samples_large_4$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_5)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_5[i,"ixosc_5"],ixosc_samples_large_5$pred_samp[i]<-0,
         ixosc_samples_large_5$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_6)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_6[i,"ixosc_6"],ixosc_samples_large_6$pred_samp[i]<-0,
         ixosc_samples_large_6$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_7)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_7[i,"ixosc_7"],ixosc_samples_large_7$pred_samp[i]<-0,
         ixosc_samples_large_7$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_8)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_8[i,"ixosc_8"],ixosc_samples_large_8$pred_samp[i]<-0,
         ixosc_samples_large_8$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_9)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_9[i,"ixosc_9"],ixosc_samples_large_9$pred_samp[i]<-0,
         ixosc_samples_large_9$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_large_10)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_large_10[i,"ixosc_10"],ixosc_samples_large_10$pred_samp[i]<-0,
         ixosc_samples_large_10$pred_samp[i]<-1)}

#Ambma (small)
for (i in 1:nrow(ambma_samples_small_1)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_1[i,"ambma_1"],ambma_samples_small_1$pred_samp[i]<-0,
         ambma_samples_small_1$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_2)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_2[i,"ambma_2"],ambma_samples_small_2$pred_samp[i]<-0,
         ambma_samples_small_2$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_3)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_3[i,"ambma_3"],ambma_samples_small_3$pred_samp[i]<-0,
         ambma_samples_small_3$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_4)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_4[i,"ambma_4"],ambma_samples_small_4$pred_samp[i]<-0,
         ambma_samples_small_4$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_5)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_5[i,"ambma_5"],ambma_samples_small_5$pred_samp[i]<-0,
         ambma_samples_small_5$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_6)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_6[i,"ambma_6"],ambma_samples_small_6$pred_samp[i]<-0,
         ambma_samples_small_6$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_7)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_7[i,"ambma_7"],ambma_samples_small_7$pred_samp[i]<-0,
         ambma_samples_small_7$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_8)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_8[i,"ambma_8"],ambma_samples_small_8$pred_samp[i]<-0,
         ambma_samples_small_8$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_9)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_9[i,"ambma_9"],ambma_samples_small_9$pred_samp[i]<-0,
         ambma_samples_small_9$pred_samp[i]<-1)}

for (i in 1:nrow(ambma_samples_small_10)){
  p<-runif(1,0,1) 
  ifelse(p > ambma_samples_small_10[i,"ambma_10"],ambma_samples_small_10$pred_samp[i]<-0,
         ambma_samples_small_10$pred_samp[i]<-1)}


#Ixosc (small)
for (i in 1:nrow(ixosc_samples_small_1)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_1[i,"ixosc_1"],ixosc_samples_small_1$pred_samp[i]<-0,
         ixosc_samples_small_1$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_2)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_2[i,"ixosc_2"],ixosc_samples_small_2$pred_samp[i]<-0,
         ixosc_samples_small_2$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_3)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_3[i,"ixosc_3"],ixosc_samples_small_3$pred_samp[i]<-0,
         ixosc_samples_small_3$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_4)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_4[i,"ixosc_4"],ixosc_samples_small_4$pred_samp[i]<-0,
         ixosc_samples_small_4$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_5)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_5[i,"ixosc_5"],ixosc_samples_small_5$pred_samp[i]<-0,
         ixosc_samples_small_5$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_6)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_6[i,"ixosc_6"],ixosc_samples_small_6$pred_samp[i]<-0,
         ixosc_samples_small_6$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_7)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_7[i,"ixosc_7"],ixosc_samples_small_7$pred_samp[i]<-0,
         ixosc_samples_small_7$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_8)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_8[i,"ixosc_8"],ixosc_samples_small_8$pred_samp[i]<-0,
         ixosc_samples_small_8$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_9)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_9[i,"ixosc_9"],ixosc_samples_small_9$pred_samp[i]<-0,
         ixosc_samples_small_9$pred_samp[i]<-1)}

for (i in 1:nrow(ixosc_samples_small_10)){
  p<-runif(1,0,1) 
  ifelse(p > ixosc_samples_small_10[i,"ixosc_10"],ixosc_samples_small_10$pred_samp[i]<-0,
         ixosc_samples_small_10$pred_samp[i]<-1)}

##simulate observation process

##ambma (small)

#1
for (i in 1:nrow(ambma_samples_small_1))
{
  ambma_samples_small_1$obs[i]<-rbern(1,ambma_samples_small_1$pred_samp[i]*0.75)
}


#2
for (i in 1:nrow(ambma_samples_small_2))
{
  ambma_samples_small_2$obs[i]<-rbern(1,ambma_samples_small_2$pred_samp[i]*0.75)
}



#3
for (i in 1:nrow(ambma_samples_small_3))
{
  ambma_samples_small_3$obs[i]<-rbern(1,ambma_samples_small_3$pred_samp[i]*0.75)
}



#4
for (i in 1:nrow(ambma_samples_small_4))
{
  ambma_samples_small_4$obs[i]<-rbern(1,ambma_samples_small_4$pred_samp[i]*0.75)
}


#5
for (i in 1:nrow(ambma_samples_small_5))
{
  ambma_samples_small_5$obs[i]<-rbern(1,ambma_samples_small_5$pred_samp[i]*0.75)
}


#6
for (i in 1:nrow(ambma_samples_small_6))
{
  ambma_samples_small_6$obs[i]<-rbern(1,ambma_samples_small_6$pred_samp[i]*0.75)
}


#7
for (i in 1:nrow(ambma_samples_small_7))
{
  ambma_samples_small_7$obs[i]<-rbern(1,ambma_samples_small_7$pred_samp[i]*0.75)
}


#8
for (i in 1:nrow(ambma_samples_small_8))
{
  ambma_samples_small_8$obs[i]<-rbern(1,ambma_samples_small_8$pred_samp[i]*0.75)
}


#9
for (i in 1:nrow(ambma_samples_small_9))
{
  ambma_samples_small_9$obs[i]<-rbern(1,ambma_samples_small_9$pred_samp[i]*0.75)
}


#10
for (i in 1:nrow(ambma_samples_small_10))
{
  ambma_samples_small_10$obs[i]<-rbern(1,ambma_samples_small_10$pred_samp[i]*0.75)
}


#ambma (large)
#1
for (i in 1:nrow(ambma_samples_large_1))
{
  ambma_samples_large_1$obs[i]<-rbern(1,ambma_samples_large_1$pred_samp[i]*0.75)
}


#2
for (i in 1:nrow(ambma_samples_large_2))
{
  ambma_samples_large_2$obs[i]<-rbern(1,ambma_samples_large_2$pred_samp[i]*0.75)
}


#3
for (i in 1:nrow(ambma_samples_large_3))
{
  ambma_samples_large_3$obs[i]<-rbern(1,ambma_samples_large_3$pred_samp[i]*0.75)
}


#4
for (i in 1:nrow(ambma_samples_large_4))
{
  ambma_samples_large_4$obs[i]<-rbern(1,ambma_samples_large_4$pred_samp[i]*0.75)
}


#5
for (i in 1:nrow(ambma_samples_large_5))
{
  ambma_samples_large_5$obs[i]<-rbern(1,ambma_samples_large_5$pred_samp[i]*0.75)
}


#6
for (i in 1:nrow(ambma_samples_large_6))
{
  ambma_samples_large_6$obs[i]<-rbern(1,ambma_samples_large_6$pred_samp[i]*0.75)
}


#7
for (i in 1:nrow(ambma_samples_large_7))
{
  ambma_samples_large_7$obs[i]<-rbern(1,ambma_samples_large_7$pred_samp[i]*0.75)
}


#8 
for (i in 1:nrow(ambma_samples_large_8))
{
  ambma_samples_large_8$obs[i]<-rbern(1,ambma_samples_large_8$pred_samp[i]*0.75)
}


#9
for (i in 1:nrow(ambma_samples_large_9))
{
  ambma_samples_large_9$obs[i]<-rbern(1,ambma_samples_large_9$pred_samp[i]*0.75)
}


#10
for (i in 1:nrow(ambma_samples_large_10))
{
  ambma_samples_large_10$obs[i]<-rbern(1,ambma_samples_large_10$pred_samp[i]*0.75)
}


##ambam (large)
#1
for (i in 1:nrow(ambam_samples_large_1))
{
  ambam_samples_large_1$obs[i]<-rbern(1,ambam_samples_large_1$pred_samp[i]*0.75)
}


#2
for (i in 1:nrow(ambam_samples_large_2))
{
  ambam_samples_large_2$obs[i]<-rbern(1,ambam_samples_large_2$pred_samp[i]*0.75)
}



#3
for (i in 1:nrow(ambam_samples_large_3))
{
  ambam_samples_large_3$obs[i]<-rbern(1,ambam_samples_large_3$pred_samp[i]*0.75)
}


#4
for (i in 1:nrow(ambam_samples_large_4))
{
  ambam_samples_large_4$obs[i]<-rbern(1,ambam_samples_large_4$pred_samp[i]*0.75)
}


#5
for (i in 1:nrow(ambam_samples_large_5))
{
  ambam_samples_large_5$obs[i]<-rbern(1,ambam_samples_large_5$pred_samp[i]*0.75)
}


#6
for (i in 1:nrow(ambam_samples_large_6))
{
  ambam_samples_large_6$obs[i]<-rbern(1,ambam_samples_large_6$pred_samp[i]*0.75)
}


#7
for (i in 1:nrow(ambam_samples_large_7))
{
  ambam_samples_large_7$obs[i]<-rbern(1,ambam_samples_large_7$pred_samp[i]*0.75)
}


#8
for (i in 1:nrow(ambam_samples_large_8))
{
  ambam_samples_large_8$obs[i]<-rbern(1,ambam_samples_large_8$pred_samp[i]*0.75)
}


#9
for (i in 1:nrow(ambam_samples_large_9))
{
  ambam_samples_large_9$obs[i]<-rbern(1,ambam_samples_large_9$pred_samp[i]*0.75)
}


#10
for (i in 1:nrow(ambam_samples_large_10))
{
  ambam_samples_large_10$obs[i]<-rbern(1,ambam_samples_large_10$pred_samp[i]*0.75)
}



##derva (large)

#1
for (i in 1:nrow(derva_samples_large_1))
{
  derva_samples_large_1$obs[i]<-rbern(1,derva_samples_large_1$pred_samp[i]*0.75)
}


#1
for (i in 1:nrow(derva_samples_large_2))
{
  derva_samples_large_2$obs[i]<-rbern(1,derva_samples_large_2$pred_samp[i]*0.75)
}



#3
for (i in 1:nrow(derva_samples_large_3))
{
  derva_samples_large_3$obs[i]<-rbern(1,derva_samples_large_3$pred_samp[i]*0.75)
}


#4
for (i in 1:nrow(derva_samples_large_4))
{
  derva_samples_large_4$obs[i]<-rbern(1,derva_samples_large_4$pred_samp[i]*0.75)
}


##5 
for (i in 1:nrow(derva_samples_large_5))
{
  derva_samples_large_5$obs[i]<-rbern(1,derva_samples_large_5$pred_samp[i]*0.75)
}


#6
for (i in 1:nrow(derva_samples_large_6))
{
  derva_samples_large_6$obs[i]<-rbern(1,derva_samples_large_6$pred_samp[i]*0.75)
}


#7
for (i in 1:nrow(derva_samples_large_7))
{
  derva_samples_large_7$obs[i]<-rbern(1,derva_samples_large_7$pred_samp[i]*0.75)
}


#8
for (i in 1:nrow(derva_samples_large_8))
{
  derva_samples_large_8$obs[i]<-rbern(1,derva_samples_large_8$pred_samp[i]*0.75)
}


#9
for (i in 1:nrow(derva_samples_large_9))
{
  derva_samples_large_9$obs[i]<-rbern(1,derva_samples_large_9$pred_samp[i]*0.75)
}


#10
for (i in 1:nrow(derva_samples_large_10))
{
  derva_samples_large_10$obs[i]<-rbern(1,derva_samples_large_10$pred_samp[i]*0.75)
}




##Ixosc (large)
#1
for (i in 1:nrow(ixosc_samples_large_1))
{
  ixosc_samples_large_1$obs[i]<-rbern(1,ixosc_samples_large_1$pred_samp[i]*0.75)
}



#2
for (i in 1:nrow(ixosc_samples_large_2))
{
  ixosc_samples_large_2$obs[i]<-rbern(1,ixosc_samples_large_2$pred_samp[i]*0.75)
}


#3
for (i in 1:nrow(ixosc_samples_large_3))
{
  ixosc_samples_large_3$obs[i]<-rbern(1,ixosc_samples_large_3$pred_samp[i]*0.75)
}


#4
for (i in 1:nrow(ixosc_samples_large_4))
{
  ixosc_samples_large_4$obs[i]<-rbern(1,ixosc_samples_large_4$pred_samp[i]*0.75)
}


#5
for (i in 1:nrow(ixosc_samples_large_5))
{
  ixosc_samples_large_5$obs[i]<-rbern(1,ixosc_samples_large_5$pred_samp[i]*0.75)
}


#6
for (i in 1:nrow(ixosc_samples_large_6))
{
  ixosc_samples_large_6$obs[i]<-rbern(1,ixosc_samples_large_6$pred_samp[i]*0.75)
}


#7
for (i in 1:nrow(ixosc_samples_large_7))
{
  ixosc_samples_large_7$obs[i]<-rbern(1,ixosc_samples_large_7$pred_samp[i]*0.75)
}


#8
for (i in 1:nrow(ixosc_samples_large_8))
{
  ixosc_samples_large_8$obs[i]<-rbern(1,ixosc_samples_large_8$pred_samp[i]*0.75)
}


#9
for (i in 1:nrow(ixosc_samples_large_9))
{
  ixosc_samples_large_9$obs[i]<-rbern(1,ixosc_samples_large_9$pred_samp[i]*0.75)
}


#10
for (i in 1:nrow(ixosc_samples_large_10))
{
  ixosc_samples_large_10$obs[i]<-rbern(1,ixosc_samples_large_10$pred_samp[i]*0.75)
}



##Ixosc (small)
#1

for (i in 1:nrow(ixosc_samples_small_1))
{
  ixosc_samples_small_1$obs[i]<-rbern(1,ixosc_samples_small_1$pred_samp[i]*0.75)
}


#2
for (i in 1:nrow(ixosc_samples_small_2))
{
  ixosc_samples_small_2$obs[i]<-rbern(1,ixosc_samples_small_2$pred_samp[i]*0.75)
}


#3
for (i in 1:nrow(ixosc_samples_small_3))
{
  ixosc_samples_small_3$obs[i]<-rbern(1,ixosc_samples_small_3$pred_samp[i]*0.75)
}


#4
for (i in 1:nrow(ixosc_samples_small_4))
{
  ixosc_samples_small_4$obs[i]<-rbern(1,ixosc_samples_small_4$pred_samp[i]*0.75)
}


#5
for (i in 1:nrow(ixosc_samples_small_5))
{
  ixosc_samples_small_5$obs[i]<-rbern(1,ixosc_samples_small_5$pred_samp[i]*0.75)
}



#6
for (i in 1:nrow(ixosc_samples_small_6))
{
  ixosc_samples_small_6$obs[i]<-rbern(1,ixosc_samples_small_6$pred_samp[i]*0.75)
}


#7
for (i in 1:nrow(ixosc_samples_small_7))
{
  ixosc_samples_small_7$obs[i]<-rbern(1,ixosc_samples_small_7$pred_samp[i]*0.75)
}


#8
for (i in 1:nrow(ixosc_samples_small_8))
{
  ixosc_samples_small_8$obs[i]<-rbern(1,ixosc_samples_small_8$pred_samp[i]*0.75)
}


#9
for (i in 1:nrow(ixosc_samples_small_9))
{
  ixosc_samples_small_9$obs[i]<-rbern(1,ixosc_samples_small_9$pred_samp[i]*0.75)
}


#10
for (i in 1:nrow(ixosc_samples_small_10))
{
  ixosc_samples_small_10$obs[i]<-rbern(1,ixosc_samples_small_10$pred_samp[i]*0.75)
}



##Put together simulation data sets


##Simulation A
Sim_A_1<-rbind(ambam_samples_large_1,ambma_samples_large_1, ambma_samples_small_1,derva_samples_large_1,ixosc_samples_large_1)
Sim_A_1$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_1$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_2<-rbind(ambam_samples_large_2,ambma_samples_large_2, ambma_samples_small_2,derva_samples_large_2,ixosc_samples_large_2)
Sim_A_2$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_2$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_3<-rbind(ambam_samples_large_3,ambma_samples_large_3, ambma_samples_small_3,derva_samples_large_3,ixosc_samples_large_3)
Sim_A_3$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_3$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_4<-rbind(ambam_samples_large_4,ambma_samples_large_4, ambma_samples_small_4,derva_samples_large_4,ixosc_samples_large_4)
Sim_A_4$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_4$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_5<-rbind(ambam_samples_large_5,ambma_samples_large_5, ambma_samples_small_5,derva_samples_large_5,ixosc_samples_large_5)
Sim_A_5$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_5$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_6<-rbind(ambam_samples_large_6,ambma_samples_large_6, ambma_samples_small_6,derva_samples_large_6,ixosc_samples_large_6)
Sim_A_6$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_6$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_7<-rbind(ambam_samples_large_7,ambma_samples_large_7, ambma_samples_small_7,derva_samples_large_7,ixosc_samples_large_7)
Sim_A_7$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_7$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_8<-rbind(ambam_samples_large_8,ambma_samples_large_8, ambma_samples_small_8,derva_samples_large_8,ixosc_samples_large_8)
Sim_A_8$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_8$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_9<-rbind(ambam_samples_large_9,ambma_samples_large_9, ambma_samples_small_9,derva_samples_large_9,ixosc_samples_large_9)
Sim_A_9$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_9$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

Sim_A_10<-rbind(ambam_samples_large_10,ambma_samples_large_10, ambma_samples_small_10,derva_samples_large_10,ixosc_samples_large_10)
Sim_A_10$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,500))
Sim_A_10$genus<-c(rep(1,1000),rep(2,500),rep(3,500))

##Simulation B
Sim_B_1<-rbind(ambam_samples_large_1,ambma_samples_small_1,derva_samples_large_1,ixosc_samples_large_1)
Sim_B_1$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_1$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_2<-rbind(ambam_samples_large_2,ambma_samples_small_2,derva_samples_large_2,ixosc_samples_large_2)
Sim_B_2$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_2$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_3<-rbind(ambam_samples_large_3,ambma_samples_small_3,derva_samples_large_3,ixosc_samples_large_3)
Sim_B_3$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_3$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_4<-rbind(ambam_samples_large_4,ambma_samples_small_4,derva_samples_large_4,ixosc_samples_large_4)
Sim_B_4$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_4$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_5<-rbind(ambam_samples_large_5,ambma_samples_small_5,derva_samples_large_5,ixosc_samples_large_5)
Sim_B_5$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_5$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_6<-rbind(ambam_samples_large_6,ambma_samples_small_6,derva_samples_large_6,ixosc_samples_large_6)
Sim_B_6$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_6$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_7<-rbind(ambam_samples_large_7,ambma_samples_small_7,derva_samples_large_7,ixosc_samples_large_7)
Sim_B_7$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_7$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_8<-rbind(ambam_samples_large_8,ambma_samples_small_8,derva_samples_large_8,ixosc_samples_large_8)
Sim_B_8$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_8$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_9<-rbind(ambam_samples_large_9,ambma_samples_small_9,derva_samples_large_9,ixosc_samples_large_9)
Sim_B_9$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_9$genus<-c(rep(1,530),rep(2,500),rep(3,500))

Sim_B_10<-rbind(ambam_samples_large_10,ambma_samples_small_10,derva_samples_large_10,ixosc_samples_large_10)
Sim_B_10$species<-c(rep(1,500),rep(2,30),rep(3,500),rep(4,500))
Sim_B_10$genus<-c(rep(1,530),rep(2,500),rep(3,500))

##Simulation C
Sim_C_1<-rbind(ambam_samples_large_1,ambma_samples_large_1, ambma_samples_small_1,derva_samples_large_1,ixosc_samples_small_1)
Sim_C_1$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_1$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_2<-rbind(ambam_samples_large_2,ambma_samples_large_2, ambma_samples_small_2,derva_samples_large_2,ixosc_samples_small_2)
Sim_C_2$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_2$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_3<-rbind(ambam_samples_large_3,ambma_samples_large_3, ambma_samples_small_3,derva_samples_large_3,ixosc_samples_small_3)
Sim_C_3$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_3$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_4<-rbind(ambam_samples_large_4,ambma_samples_large_4, ambma_samples_small_4,derva_samples_large_4,ixosc_samples_small_4)
Sim_C_4$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_4$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_5<-rbind(ambam_samples_large_5,ambma_samples_large_5, ambma_samples_small_5,derva_samples_large_5,ixosc_samples_small_5)
Sim_C_5$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_5$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_6<-rbind(ambam_samples_large_6,ambma_samples_large_6, ambma_samples_small_6,derva_samples_large_6,ixosc_samples_small_6)
Sim_C_6$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_6$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_7<-rbind(ambam_samples_large_7,ambma_samples_large_7, ambma_samples_small_7,derva_samples_large_7,ixosc_samples_small_7)
Sim_C_7$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_7$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_8<-rbind(ambam_samples_large_8,ambma_samples_large_8, ambma_samples_small_8,derva_samples_large_8,ixosc_samples_small_8)
Sim_C_8$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_8$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_9<-rbind(ambam_samples_large_9,ambma_samples_large_9, ambma_samples_small_9,derva_samples_large_9,ixosc_samples_small_9)
Sim_C_9$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_9$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

Sim_C_10<-rbind(ambam_samples_large_10,ambma_samples_large_10, ambma_samples_small_10,derva_samples_large_10,ixosc_samples_small_10)
Sim_C_10$species<-c(rep(1,500),rep(2,500),rep(3,500),rep(4,30))
Sim_C_10$genus<-c(rep(1,1000),rep(2,500),rep(3,30))

##Export simulated vec

write.csv(Sim_A_1,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_1.csv")
write.csv(Sim_A_2,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_2.csv")
write.csv(Sim_A_3,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_3.csv")
write.csv(Sim_A_4,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_4.csv")
write.csv(Sim_A_5,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_5.csv")
write.csv(Sim_A_6,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_6.csv")
write.csv(Sim_A_7,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_7.csv")
write.csv(Sim_A_8,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_8.csv")
write.csv(Sim_A_9,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_9.csv")
write.csv(Sim_A_10,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_10.csv")

write.csv(Sim_B_1,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_1.csv")
write.csv(Sim_B_2,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_2.csv")
write.csv(Sim_B_3,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_3.csv")
write.csv(Sim_B_4,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_4.csv")
write.csv(Sim_B_5,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_5.csv")
write.csv(Sim_B_6,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_6.csv")
write.csv(Sim_B_7,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_7.csv")
write.csv(Sim_B_8,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_8.csv")
write.csv(Sim_B_9,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_9.csv")
write.csv(Sim_B_10,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_10.csv")

write.csv(Sim_C_1,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_1.csv")
write.csv(Sim_C_2,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_2.csv")
write.csv(Sim_C_3,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_3.csv")
write.csv(Sim_C_4,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_4.csv")
write.csv(Sim_C_5,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_5.csv")
write.csv(Sim_C_6,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_6.csv")
write.csv(Sim_C_7,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_7.csv")
write.csv(Sim_C_8,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_8.csv")
write.csv(Sim_C_9,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_9.csv")
write.csv(Sim_C_10,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_10.csv")
