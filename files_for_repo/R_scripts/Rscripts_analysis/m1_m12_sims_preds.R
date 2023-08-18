##load libraries 
library(raster)
library(caret)


data_s<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/true_vec_dist.csv")

crop = data_s$landcover_2
GS = data_s$landcover_5 + data_s$landcover_7
forest = data_s$landcover_6 + data_s$landcover_11 + data_s$landcover_14 + data_s$landcover_15
wetland = data_s$landcover_18 


##load functions
pred.m1<-function(data_s,file_out)
{
  
  dtw = data_s$dtw
  tmax = data_s$tmax
  phdi = data_s$PHDI_average
  ndvi = data_s$ndvi
  prcp = data_s$prcp
  urban = data_s$landcover_1
  crop = data_s$landcover_2
  GS = data_s$landcover_5 + data_s$landcover_7
  forest = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15
  wetland = data_s$landcover_18 
  
  m1.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/mcmc_samples_m1path_c_10.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m1.mcmc),4)) 
  
  for (i in 1:nrow(m1.mcmc))
  {
    for (j in 1:4)
    {
      est<- ((m1.mcmc$b_0.1[i] + m1.mcmc$b_1.1[i]*dtw + m1.mcmc$b_2.1[i]*tmax + m1.mcmc$b_3.1[i]*phdi 
              + m1.mcmc$b_4.1[i]*ndvi + m1.mcmc$b_5.1[i]*prcp + m1.mcmc$b_6.1[i]*urban 
              + m1.mcmc$b_7.1[i]*crop + m1.mcmc$b_9.1[i]*forest + m1.mcmc$b_10.1[i]*wetland
      )*ifelse(j==1,1,0) +
        (m1.mcmc$b_0.2[i] + m1.mcmc$b_1.2[i]*dtw + m1.mcmc$b_2.2[i]*tmax + m1.mcmc$b_3.2[i]*phdi 
         + m1.mcmc$b_4.2[i]*ndvi + m1.mcmc$b_5.2[i]*prcp + m1.mcmc$b_6.2[i]*urban 
         + m1.mcmc$b_7.2[i]*crop  + m1.mcmc$b_9.2[i]*forest + m1.mcmc$b_10.2[i]*wetland
        )*ifelse(j==2,1,0) +
        (m1.mcmc$b_0.3[i] + m1.mcmc$b_1.3[i]*dtw + m1.mcmc$b_2.3[i]*tmax + m1.mcmc$b_3.3[i]*phdi 
         + m1.mcmc$b_4.3[i]*ndvi + m1.mcmc$b_5.3[i]*prcp + m1.mcmc$b_6.3[i]*urban 
         + m1.mcmc$b_7.3[i]*crop  + m1.mcmc$b_9.3[i]*forest + m1.mcmc$b_10.3[i]*wetland
        )*ifelse(j==3,1,0) +
        
        (m1.mcmc$b_0.4[i] + m1.mcmc$b_1.4[i]*dtw + m1.mcmc$b_2.4[i]*tmax + m1.mcmc$b_3.4[i]*phdi 
         + m1.mcmc$b_4.4[i]*ndvi + m1.mcmc$b_5.4[i]*prcp + m1.mcmc$b_6.4[i]*urban 
         + m1.mcmc$b_7.4[i]*crop  + m1.mcmc$b_9.4[i]*forest + m1.mcmc$b_10.4[i]*wetland
        )*ifelse(j==4,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,4)) 
  diff<-array(numeric(),c(nrow(data_s),1,4))
  mean<-array(numeric(),c(nrow(data_s),1,4))
  
  for (j in 1 : 4)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975),na.rm=TRUE)
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m1<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4])
  
  unc_m1<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4])
  
  colnames(pred_m1) <- c("pred_ambam_m1", "pred_ambma_m1", "pred_derva_m1", "pred_ixosc_m1")
  colnames(unc_m1) <- c("unc_ambam_m1", "unc_ambma_m1", "unc_derva_m1",  "unc_ixosc_m1")
  
  data_s<-cbind(data_s,pred_m1, unc_m1)
  write.csv(data_s,file_out)
}

##M2

pred.m2<-function(data_s,file_out)
{
  dtw = data_s$dtw
  tmax = data_s$tmax
  phdi = data_s$PHDI_average
  ndvi = data_s$ndvi
  prcp = data_s$prcp
  urban = data_s$landcover_1
  crop = data_s$landcover_2
  GS = data_s$landcover_5 + data_s$landcover_7
  forest = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15
  wetland = data_s$landcover_18 
  m2.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/mcmc_samples_m2path_c_10.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m2.mcmc),4)) 
  
  for (i in 1:nrow(m2.mcmc))
  {
    for (j in 1:4)
    {
      est<- ((m2.mcmc$b_0.1[i] + m2.mcmc$b_1.1[i]*dtw + m2.mcmc$b_2.1[i]*tmax + m2.mcmc$b_3.1[i]*phdi 
              + m2.mcmc$b_4.1[i]*ndvi + m2.mcmc$b_5.1[i]*prcp + m2.mcmc$b_6.1[i]*urban 
              + m2.mcmc$b_7.1[i]*crop + m2.mcmc$b_9.1[i]*forest + m2.mcmc$b_10.1[i]*wetland
      )*ifelse(j==1,1,0) +
        (m2.mcmc$b_0.2[i] + m2.mcmc$b_1.2[i]*dtw + m2.mcmc$b_2.2[i]*tmax + m2.mcmc$b_3.2[i]*phdi 
         + m2.mcmc$b_4.2[i]*ndvi + m2.mcmc$b_5.2[i]*prcp + m2.mcmc$b_6.2[i]*urban 
         + m2.mcmc$b_7.2[i]*crop  + m2.mcmc$b_9.2[i]*forest + m2.mcmc$b_10.2[i]*wetland
        )*ifelse(j==2,1,0) +
        (m2.mcmc$b_0.3[i] + m2.mcmc$b_1.3[i]*dtw + m2.mcmc$b_2.3[i]*tmax + m2.mcmc$b_3.3[i]*phdi 
         + m2.mcmc$b_4.3[i]*ndvi + m2.mcmc$b_5.3[i]*prcp + m2.mcmc$b_6.3[i]*urban 
         + m2.mcmc$b_7.3[i]*crop  + m2.mcmc$b_9.3[i]*forest + m2.mcmc$b_10.3[i]*wetland
        )*ifelse(j==3,1,0) +
        (m2.mcmc$b_0.4[i] + m2.mcmc$b_1.4[i]*dtw + m2.mcmc$b_2.4[i]*tmax + m2.mcmc$b_3.4[i]*phdi 
         + m2.mcmc$b_4.4[i]*ndvi + m2.mcmc$b_5.4[i]*prcp + m2.mcmc$b_6.4[i]*urban 
         + m2.mcmc$b_7.4[i]*crop  + m2.mcmc$b_9.4[i]*forest + m2.mcmc$b_10.4[i]*wetland
        )*ifelse(j==4,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
      
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,4)) 
  diff<-array(numeric(),c(nrow(data_s),1,4))
  mean<-array(numeric(),c(nrow(data_s),1,4))
  
  for (j in 1 : 4)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,4)) 
  diff<-array(numeric(),c(nrow(data_s),1,4))
  mean<-array(numeric(),c(nrow(data_s),1,4))
  
  for (j in 1 : 4)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-quantile(unc_full[n,,j], probs = 0.5)
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m2<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4])
  
  unc_m2<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4])
  
  colnames(pred_m2) <- c("pred_ambam_m2", "pred_ambma_m2", "pred_derva_m2", "pred_ixosc_m2")
  colnames(unc_m2) <- c("unc_ambam_m2", "unc_ambma_m2", "unc_derva_m2", "unc_ixosc_m2")
  
  data_s<-cbind(data_s,pred_m2, unc_m2)
  write.csv(data_s,file_out)
}


##M3

pred.m3<-function(data_s,file_out)
{
  
  dtw = data_s$dtw
  tmax = data_s$tmax
  phdi = data_s$PHDI_average
  ndvi = data_s$ndvi
  prcp = data_s$prcp
  urban = data_s$landcover_1
  crop = data_s$landcover_2
  GS = data_s$landcover_5 + data_s$landcover_7
  forest = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15
  wetland = data_s$landcover_18  
  
  m3.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/mcmc_samples_m3path_c_10.csv")
  m3.mcmc<-m3.mcmc[1:10000,]
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m3.mcmc),4)) 
  
  for (i in 1:nrow(m3.mcmc))
  {
    for (j in 1:4)
    {
      est<- ((m3.mcmc$b_0.1[i] + m3.mcmc$b_1.1[i]*dtw + m3.mcmc$b_2.1[i]*tmax + m3.mcmc$b_3.1[i]*phdi 
              + m3.mcmc$b_4.1[i]*ndvi + m3.mcmc$b_5.1[i]*prcp + m3.mcmc$b_6.1[i]*urban 
              + m3.mcmc$b_7.1[i]*crop  + m3.mcmc$b_9.1[i]*forest + m3.mcmc$b_10.1[i]*wetland
      )*ifelse(j==1,1,0) +
        (m3.mcmc$b_0.2[i] + m3.mcmc$b_1.2[i]*dtw + m3.mcmc$b_2.2[i]*tmax + m3.mcmc$b_3.2[i]*phdi 
         + m3.mcmc$b_4.2[i]*ndvi + m3.mcmc$b_5.2[i]*prcp + m3.mcmc$b_6.2[i]*urban 
         + m3.mcmc$b_7.2[i]*crop  + m3.mcmc$b_9.2[i]*forest + m3.mcmc$b_10.2[i]*wetland
        )*ifelse(j==2,1,0) +
        (m3.mcmc$b_0.3[i] + m3.mcmc$b_1.3[i]*dtw + m3.mcmc$b_2.3[i]*tmax + m3.mcmc$b_3.3[i]*phdi 
         + m3.mcmc$b_4.3[i]*ndvi + m3.mcmc$b_5.3[i]*prcp + m3.mcmc$b_6.3[i]*urban 
         + m3.mcmc$b_7.3[i]*crop  + m3.mcmc$b_9.3[i]*forest + m3.mcmc$b_10.3[i]*wetland
        )*ifelse(j==3,1,0) +
        (m3.mcmc$b_0.4[i] + m3.mcmc$b_1.4[i]*dtw + m3.mcmc$b_2.4[i]*tmax + m3.mcmc$b_3.4[i]*phdi 
         + m3.mcmc$b_4.4[i]*ndvi + m3.mcmc$b_5.4[i]*prcp + m3.mcmc$b_6.4[i]*urban 
         + m3.mcmc$b_7.4[i]*crop  + m3.mcmc$b_9.4[i]*forest + m3.mcmc$b_10.4[i]*wetland
        )*ifelse(j==4,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,4)) 
  diff<-array(numeric(),c(nrow(data_s),1,4))
  mean<-array(numeric(),c(nrow(data_s),1,4))
  
  for (j in 1 : 4)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m3<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4])
  
  unc_m3<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4])
  
  colnames(pred_m3) <- c("pred_ambam_m3", "pred_ambma_m3", "pred_derva_m3", "pred_ixosc_m3")
  colnames(unc_m3) <- c("unc_ambam_m3", "unc_ambma_m3", "unc_derva_m3", "unc_ixosc_m3")
  
  data_s<-cbind(data_s,pred_m3, unc_m3)
  write.csv(data_s,file_out)
}

##M4 

pred.m4<-function(data_s,file_out)
{
  m4.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/mcmc_samples_m4path_c_10.csv")
  
  dtw = data_s$dtw
  tmax = data_s$tmax
  phdi = data_s$PHDI_average
  ndvi = data_s$ndvi
  prcp = data_s$prcp
  urban = data_s$landcover_1
  crop = data_s$landcover_2
  GS = data_s$landcover_5 + data_s$landcover_7
  forest = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15
  wetland = data_s$landcover_18 
  
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m4.mcmc),4)) 
  
  
  for (i in 1:nrow(m4.mcmc))
  {
    for (j in 1:4)
    {
      est<- ((m4.mcmc$b_0.1[i] + m4.mcmc$b_1.1[i]*dtw + m4.mcmc$b_2.1[i]*tmax + m4.mcmc$b_3.1[i]*phdi 
              + m4.mcmc$b_4.1[i]*ndvi + m4.mcmc$b_5.1[i]*prcp + m4.mcmc$b_6.1[i]*urban 
              + m4.mcmc$b_7.1[i]*crop + m4.mcmc$b_9.1[i]*forest + m4.mcmc$b_10.1[i]*wetland
              + m4.mcmc$e.1[i])*ifelse(j==1,1,0) +
               (m4.mcmc$b_0.1[i] + m4.mcmc$b_1.1[i]*dtw + m4.mcmc$b_2.1[i]*tmax + m4.mcmc$b_3.1[i]*phdi 
                + m4.mcmc$b_4.1[i]*ndvi + m4.mcmc$b_5.1[i]*prcp + m4.mcmc$b_6.1[i]*urban 
                + m4.mcmc$b_7.1[i]*crop + m4.mcmc$b_9.1[i]*forest + m4.mcmc$b_10.1[i]*wetland
                + m4.mcmc$e.1[i])*ifelse(j==2,1,0) +
               (m4.mcmc$b_0.2[i] + m4.mcmc$b_1.2[i]*dtw + m4.mcmc$b_2.2[i]*tmax + m4.mcmc$b_3.2[i]*phdi 
                + m4.mcmc$b_4.2[i]*ndvi + m4.mcmc$b_5.2[i]*prcp + m4.mcmc$b_6.2[i]*urban 
                + m4.mcmc$b_7.2[i]*crop + m4.mcmc$b_9.2[i]*forest + m4.mcmc$b_10.2[i]*wetland
                + m4.mcmc$e.3[i])*ifelse(j==3,1,0) +
               (m4.mcmc$b_0.3[i] + m4.mcmc$b_1.3[i]*dtw + m4.mcmc$b_2.3[i]*tmax + m4.mcmc$b_3.3[i]*phdi 
                + m4.mcmc$b_4.3[i]*ndvi + m4.mcmc$b_5.3[i]*prcp + m4.mcmc$b_6.3[i]*urban 
                + m4.mcmc$b_7.3[i]*crop  + m4.mcmc$b_9.3[i]*forest + m4.mcmc$b_10.3[i]*wetland
                + m4.mcmc$e.4[i])*ifelse(j==4,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  
  quants<-array(numeric(),c(nrow(data_s),2,4)) 
  diff<-array(numeric(),c(nrow(data_s),1,4))
  mean<-array(numeric(),c(nrow(data_s),1,4))
  
  for (j in 1 : 4)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m4<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4])
  
  unc_m4<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4])
  
  colnames(pred_m4) <- c("pred_ambam_m4", "pred_ambma_m4", "pred_derva_m4", "pred_ixosc_m4")
  colnames(unc_m4) <- c("unc_ambam_m4", "unc_ambma_m4", "unc_derva_m4", "unc_ixosc_m4")
  
  data_s<-cbind(data_s,pred_m4, unc_m4)
  write.csv(data_s,file_out)
}

##m5

pred.m5<-function(data_s,file_out)
{
  m5.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/mcmc_samples_m5path_c_10.csv")
  
  dtw = data_s$dtw
  tmax = data_s$tmax
  phdi = data_s$PHDI_average
  ndvi = data_s$ndvi
  prcp = data_s$prcp
  urban = data_s$landcover_1
  crop = data_s$landcover_2
  GS = data_s$landcover_5 + data_s$landcover_7
  forest = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15
  wetland = data_s$landcover_18 
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m5.mcmc),4)) 
  
  
  for (i in 1:nrow(m5.mcmc))
  {
    for (j in 1:4)
    {
      est<- ((m5.mcmc$b_0.1[i] + m5.mcmc$b_1.1[i]*dtw + m5.mcmc$b_2.1[i]*tmax + m5.mcmc$b_3.1[i]*phdi 
              + m5.mcmc$b_4.1[i]*ndvi + m5.mcmc$b_5.1[i]*prcp + m5.mcmc$b_6.1[i]*urban 
              + m5.mcmc$b_7.1[i]*crop + m5.mcmc$b_9.1[i]*forest + m5.mcmc$b_10.1[i]*wetland
              + m5.mcmc$e.1[i])*ifelse(j==1,1,0) +
               (m5.mcmc$b_0.1[i] + m5.mcmc$b_1.1[i]*dtw + m5.mcmc$b_2.1[i]*tmax + m5.mcmc$b_3.1[i]*phdi 
                + m5.mcmc$b_4.1[i]*ndvi + m5.mcmc$b_5.1[i]*prcp + m5.mcmc$b_6.1[i]*urban 
                + m5.mcmc$b_7.1[i]*crop + m5.mcmc$b_9.1[i]*forest + m5.mcmc$b_10.1[i]*wetland
                + m5.mcmc$e.1[i])*ifelse(j==2,1,0) +
               (m5.mcmc$b_0.2[i] + m5.mcmc$b_1.2[i]*dtw + m5.mcmc$b_2.2[i]*tmax + m5.mcmc$b_3.2[i]*phdi 
                + m5.mcmc$b_4.2[i]*ndvi + m5.mcmc$b_5.2[i]*prcp + m5.mcmc$b_6.2[i]*urban 
                + m5.mcmc$b_7.2[i]*crop + m5.mcmc$b_9.2[i]*forest + m5.mcmc$b_10.2[i]*wetland
                + m5.mcmc$e.3[i])*ifelse(j==3,1,0) +
               (m5.mcmc$b_0.3[i] + m5.mcmc$b_1.3[i]*dtw + m5.mcmc$b_2.3[i]*tmax + m5.mcmc$b_3.3[i]*phdi 
                + m5.mcmc$b_4.3[i]*ndvi + m5.mcmc$b_5.3[i]*prcp + m5.mcmc$b_6.3[i]*urban 
                + m5.mcmc$b_7.3[i]*crop  + m5.mcmc$b_9.3[i]*forest + m5.mcmc$b_10.3[i]*wetland
                + m5.mcmc$e.4[i])*ifelse(j==4,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  
  quants<-array(numeric(),c(nrow(data_s),2,4)) 
  diff<-array(numeric(),c(nrow(data_s),1,4))
  mean<-array(numeric(),c(nrow(data_s),1,4))
  
  for (j in 1 : 4)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m5<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4])
  
  unc_m5<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4])
  
  colnames(pred_m5) <- c("pred_ambam_m5", "pred_ambma_m5", "pred_derva_m5", "pred_ixosc_m5")
  colnames(unc_m5) <- c("unc_ambam_m5", "unc_ambma_m5", "unc_derva_m5","unc_ixosc_m5")
  
  data_s<-cbind(data_s,pred_m5, unc_m5)
  write.csv(data_s,file_out)
}


##m6

pred.m6<-function(data_s,file_out)
{
  m6.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/mcmc_samples_m6path_c_10.csv")
  
  dtw = data_s$dtw
  tmax = data_s$tmax
  phdi = data_s$PHDI_average
  ndvi = data_s$ndvi
  prcp = data_s$prcp
  urban = data_s$landcover_1
  crop = data_s$landcover_2
  GS = data_s$landcover_5 + data_s$landcover_7
  forest = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15
  wetland = data_s$landcover_18 
  
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m6.mcmc),4)) 
  
  
  for (i in 1:nrow(m6.mcmc))
  {
    for (j in 1:4)
    {
      est<- ((m6.mcmc$b_0[i] + m6.mcmc$b_1[i]*dtw + m6.mcmc$b_2[i]*tmax + m6.mcmc$b_3[i]*phdi 
              + m6.mcmc$b_4[i]*ndvi + m6.mcmc$b_5[i]*prcp + m6.mcmc$b_6[i]*urban 
              + m6.mcmc$b_7[i]*crop + m6.mcmc$b_9[i]*forest + m6.mcmc$b_10[i]*wetland
              + m6.mcmc$e.1[i])*ifelse(j==1,1,0) +
               (m6.mcmc$b_0[i] + m6.mcmc$b_1[i]*dtw + m6.mcmc$b_2[i]*tmax + m6.mcmc$b_3[i]*phdi 
                + m6.mcmc$b_4[i]*ndvi + m6.mcmc$b_5[i]*prcp + m6.mcmc$b_6[i]*urban 
                + m6.mcmc$b_7[i]*crop + m6.mcmc$b_9[i]*forest + m6.mcmc$b_10[i]*wetland
                + m6.mcmc$e.2[i])*ifelse(j==2,1,0) +
               (m6.mcmc$b_0[i] + m6.mcmc$b_1[i]*dtw + m6.mcmc$b_2[i]*tmax + m6.mcmc$b_3[i]*phdi 
                + m6.mcmc$b_4[i]*ndvi + m6.mcmc$b_5[i]*prcp + m6.mcmc$b_6[i]*urban 
                + m6.mcmc$b_7[i]*crop + m6.mcmc$b_9[i]*forest + m6.mcmc$b_10[i]*wetland
                + m6.mcmc$e.3[i] )*ifelse(j==3,1,0) +
               (m6.mcmc$b_0[i] + m6.mcmc$b_1[i]*dtw + m6.mcmc$b_2[i]*tmax + m6.mcmc$b_3[i]*phdi 
                + m6.mcmc$b_4[i]*ndvi + m6.mcmc$b_5[i]*prcp + m6.mcmc$b_6[i]*urban 
                + m6.mcmc$b_7[i]*crop  + m6.mcmc$b_9[i]*forest + m6.mcmc$b_10[i]*wetland
                + m6.mcmc$e.4[i])*ifelse(j==4,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  
  quants<-array(numeric(),c(nrow(data_s),2,4)) 
  diff<-array(numeric(),c(nrow(data_s),1,4))
  mean<-array(numeric(),c(nrow(data_s),1,4))
  
  for (j in 1 : 4)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m6<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4])
  
  unc_m6<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4])
  
  colnames(pred_m6) <- c("pred_ambam_m6", "pred_ambma_m6", "pred_derva_m6", "pred_ixosc_m6")
  colnames(unc_m6) <- c("unc_ambam_m6", "unc_ambma_m6", "unc_derva_m6", "unc_ixosc_m6")
  
  data_s<-cbind(data_s,pred_m6, unc_m6)
  write.csv(data_s,file_out)
}

##Run functions
pred.m1(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m7c_run10_full.csv")
pred.m2(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m8c_run10_full.csv")
pred.m3(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m9c_run10_full.csv")
pred.m4(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m10c_run10_full.csv")
pred.m5(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m11c_run10_full.csv")
pred.m6(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m12c_run10_full.csv")
