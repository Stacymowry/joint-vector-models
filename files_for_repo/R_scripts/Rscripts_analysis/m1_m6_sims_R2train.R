##load libraries 
library(raster)
library(caret)

##load simulatio data
sim_a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_1.csv")
sim_a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_2.csv")
sim_a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_3.csv")
sim_a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_4.csv")
sim_a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_5.csv")
sim_a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_6.csv")
sim_a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_7.csv")
sim_a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_8.csv")
sim_a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_9.csv")
sim_a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_A_10.csv")

sim_b_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_1.csv")
sim_b_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_2.csv")
sim_b_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_3.csv")
sim_b_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_4.csv")
sim_b_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_5.csv")
sim_b_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_6.csv")
sim_b_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_7.csv")
sim_b_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_8.csv")
sim_b_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_9.csv")
sim_b_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_B_10.csv")

sim_c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_1.csv")
sim_c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_2.csv")
sim_c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_3.csv")
sim_c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_4.csv")
sim_c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_5.csv")
sim_c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_6.csv")
sim_c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_7.csv")
sim_c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_8.csv")
sim_c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_9.csv")
sim_c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/Sim_C_10.csv")


##identify which run of which sim 
data_s<-sim_c_10

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

##calculate train r^2 for each 
#Sim A
m1a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m7a_run1_full.csv")
m2a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m8a_run1_full.csv")
m3a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m9a_run1_full.csv")
m4a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m10a_run1_full.csv")
m5a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m11a_run1_full.csv")
m6a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m12a_run1_full.csv")

m1a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m7a_run2_full.csv")
m2a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m8a_run2_full.csv")
m3a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m9a_run2_full.csv")
m4a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m10a_run2_full.csv")
m5a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m11a_run2_full.csv")
m6a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m12a_run2_full.csv")

m1a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m7a_run3_full.csv")
m2a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m8a_run3_full.csv")
m3a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m9a_run3_full.csv")
m4a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m10a_run3_full.csv")
m5a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m11a_run3_full.csv")
m6a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m12a_run3_full.csv")

m1a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m7a_run4_full.csv")
m2a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m8a_run4_full.csv")
m3a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m9a_run4_full.csv")
m4a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m10a_run4_full.csv")
m5a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m11a_run4_full.csv")
m6a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m12a_run4_full.csv")

m1a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m7a_run5_full.csv")
m2a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m8a_run5_full.csv")
m3a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m9a_run5_full.csv")
m4a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m10a_run5_full.csv")
m5a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m11a_run5_full.csv")
m6a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m12a_run5_full.csv")

m1a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m7a_run6_full.csv")
m2a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m8a_run6_full.csv")
m3a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m9a_run6_full.csv")
m4a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m10a_run6_full.csv")
m5a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m11a_run6_full.csv")
m6a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m12a_run6_full.csv")

m1a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m7a_run7_full.csv")
m2a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m8a_run7_full.csv")
m3a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m9a_run7_full.csv")
m4a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m10a_run7_full.csv")
m5a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m11a_run7_full.csv")
m6a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m12a_run7_full.csv")

m1a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m7a_run8_full.csv")
m2a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m8a_run8_full.csv")
m3a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m9a_run8_full.csv")
m4a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m10a_run8_full.csv")
m5a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m11a_run8_full.csv")
m6a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m12a_run8_full.csv")

m1a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m7a_run9_full.csv")
m2a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m8a_run9_full.csv")
m3a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m9a_run9_full.csv")
m4a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m10a_run9_full.csv")
m5a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m11a_run9_full.csv")
m6a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m12a_run9_full.csv")

m1a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m7a_run10_full.csv")
m2a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m8a_run10_full.csv")
m3a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m9a_run10_full.csv")
m4a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m10a_run10_full.csv")
m5a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m11a_run10_full.csv")
m6a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m12a_run10_full.csv")

#Sim B
m1b_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_B/full_preds/m1b_run1_full.csv")
m2b_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_B/full_preds/m2b_run1_full.csv")
m3b_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_B/full_preds/m3b_run1_full.csv")
m4b_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_B/full_preds/m4b_run1_full.csv")
m5b_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_B/full_preds/m5b_run1_full.csv")
m6b_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_B/full_preds/m6b_run1_full.csv")

m1b_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_B/full_preds/m1b_run2_full.csv")
m2b_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_B/full_preds/m2b_run2_full.csv")
m3b_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_B/full_preds/m3b_run2_full.csv")
m4b_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_B/full_preds/m4b_run2_full.csv")
m5b_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_B/full_preds/m5b_run2_full.csv")
m6b_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_B/full_preds/m6b_run2_full.csv")

m1b_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_B/full_preds/m1b_run3_full.csv")
m2b_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_B/full_preds/m2b_run3_full.csv")
m3b_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_B/full_preds/m3b_run3_full.csv")
m4b_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_B/full_preds/m4b_run3_full.csv")
m5b_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_B/full_preds/m5b_run3_full.csv")
m6b_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_B/full_preds/m6b_run3_full.csv")

m1b_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_B/full_preds/m1b_run4_full.csv")
m2b_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_B/full_preds/m2b_run4_full.csv")
m3b_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_B/full_preds/m3b_run4_full.csv")
m4b_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_B/full_preds/m4b_run4_full.csv")
m5b_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_B/full_preds/m5b_run4_full.csv")
m6b_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_B/full_preds/m6b_run4_full.csv")

m1b_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_B/full_preds/m1b_run5_full.csv")
m2b_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_B/full_preds/m2b_run5_full.csv")
m3b_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_B/full_preds/m3b_run5_full.csv")
m4b_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_B/full_preds/m4b_run5_full.csv")
m5b_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_B/full_preds/m5b_run5_full.csv")
m6b_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_B/full_preds/m6b_run5_full.csv")

m1b_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_B/full_preds/m1b_run6_full.csv")
m2b_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_B/full_preds/m2b_run6_full.csv")
m3b_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_B/full_preds/m3b_run6_full.csv")
m4b_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_B/full_preds/m4b_run6_full.csv")
m5b_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_B/full_preds/m5b_run6_full.csv")
m6b_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_B/full_preds/m6b_run6_full.csv")

m1b_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_B/full_preds/m1b_run7_full.csv")
m2b_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_B/full_preds/m2b_run7_full.csv")
m3b_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_B/full_preds/m3b_run7_full.csv")
m4b_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_B/full_preds/m4b_run7_full.csv")
m5b_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_B/full_preds/m5b_run7_full.csv")
m6b_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_B/full_preds/m6b_run7_full.csv")

m1b_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_B/full_preds/m1b_run8_full.csv")
m2b_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_B/full_preds/m2b_run8_full.csv")
m3b_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_B/full_preds/m3b_run8_full.csv")
m4b_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_B/full_preds/m4b_run8_full.csv")
m5b_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_B/full_preds/m5b_run8_full.csv")
m6b_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_B/full_preds/m6b_run8_full.csv")

m1b_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_B/full_preds/m1b_run9_full.csv")
m2b_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_B/full_preds/m2b_run9_full.csv")
m3b_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_B/full_preds/m3b_run9_full.csv")
m4b_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_B/full_preds/m4b_run9_full.csv")
m5b_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_B/full_preds/m5b_run9_full.csv")
m6b_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_B/full_preds/m6b_run9_full.csv")

m1b_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_B/full_preds/m1b_run10_full.csv")
m2b_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_B/full_preds/m2b_run10_full.csv")
m3b_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_B/full_preds/m3b_run10_full.csv")
m4b_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_B/full_preds/m4b_run10_full.csv")
m5b_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_B/full_preds/m5b_run10_full.csv")
m6b_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_B/full_preds/m6b_run10_full.csv")

#Sim C
m1c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m7c_run1_full.csv")
m2c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m8c_run1_full.csv")
m3c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m9c_run1_full.csv")
m4c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m10c_run1_full.csv")
m5c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m11c_run1_full.csv")
m6c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/full_preds/m12c_run1_full.csv")

m1c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/full_preds/m7c_run2_full.csv")
m2c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/full_preds/m8c_run2_full.csv")
m3c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/full_preds/m9c_run2_full.csv")
m4c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/full_preds/m10c_run2_full.csv")
m5c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/full_preds/m11c_run2_full.csv")
m6c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/full_preds/m12c_run2_full.csv")

m1c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/full_preds/m7c_run3_full.csv")
m2c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/full_preds/m8c_run3_full.csv")
m3c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/full_preds/m9c_run3_full.csv")
m4c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/full_preds/m10c_run3_full.csv")
m5c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/full_preds/m11c_run3_full.csv")
m6c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/full_preds/m12c_run3_full.csv")

m1c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/full_preds/m7c_run4_full.csv")
m2c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/full_preds/m8c_run4_full.csv")
m3c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/full_preds/m9c_run4_full.csv")
m4c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/full_preds/m10c_run4_full.csv")
m5c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/full_preds/m11c_run4_full.csv")
m6c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/full_preds/m12c_run4_full.csv")

m1c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/full_preds/m7c_run5_full.csv")
m2c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/full_preds/m8c_run5_full.csv")
m3c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/full_preds/m9c_run5_full.csv")
m4c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/full_preds/m10c_run5_full.csv")
m5c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/full_preds/m11c_run5_full.csv")
m6c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/full_preds/m12c_run5_full.csv")

m1c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/full_preds/m7c_run6_full.csv")
m2c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/full_preds/m8c_run6_full.csv")
m3c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/full_preds/m9c_run6_full.csv")
m4c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/full_preds/m10c_run6_full.csv")
m5c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/full_preds/m11c_run6_full.csv")
m6c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/full_preds/m12c_run6_full.csv")

m1c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/full_preds/m7c_run7_full.csv")
m2c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/full_preds/m8c_run7_full.csv")
m3c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/full_preds/m9c_run7_full.csv")
m4c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/full_preds/m10c_run7_full.csv")
m5c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/full_preds/m11c_run7_full.csv")
m6c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/full_preds/m12c_run7_full.csv")

m1c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/full_preds/m7c_run8_full.csv")
m2c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/full_preds/m8c_run8_full.csv")
m3c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/full_preds/m9c_run8_full.csv")
m4c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/full_preds/m10c_run8_full.csv")
m5c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/full_preds/m11c_run8_full.csv")
m6c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/full_preds/m12c_run8_full.csv")

m1c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/full_preds/m7c_run9_full.csv")
m2c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/full_preds/m8c_run9_full.csv")
m3c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/full_preds/m9c_run9_full.csv")
m4c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/full_preds/m10c_run9_full.csv")
m5c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/full_preds/m11c_run9_full.csv")
m6c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/full_preds/m12c_run9_full.csv")

m1c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m7c_run10_full.csv")
m2c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m8c_run10_full.csv")
m3c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m9c_run10_full.csv")
m4c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m10c_run10_full.csv")
m5c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m11c_run10_full.csv")
m6c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/full_preds/m12c_run10_full.csv")







##subset for each sp
m1a_1_ambam<-subset(m1a_1,m1a_1$species == 1)
m1a_1_ambma<-subset(m1a_1,m1a_1$species == 2)
m1a_1_derva<-subset(m1a_1,m1a_1$species == 3)
m1a_1_ixosc<-subset(m1a_1,m1a_1$species == 4)

m1a_2_ambam<-subset(m1a_2,m1a_2$species == 1)
m1a_2_ambma<-subset(m1a_2,m1a_2$species == 2)
m1a_2_derva<-subset(m1a_2,m1a_2$species == 3)
m1a_2_ixosc<-subset(m1a_2,m1a_2$species == 4)

m1a_3_ambam<-subset(m1a_3,m1a_3$species == 1)
m1a_3_ambma<-subset(m1a_3,m1a_3$species == 2)
m1a_3_derva<-subset(m1a_3,m1a_3$species == 3)
m1a_3_ixosc<-subset(m1a_3,m1a_3$species == 4)

m1a_4_ambam<-subset(m1a_4,m1a_4$species == 1)
m1a_4_ambma<-subset(m1a_4,m1a_4$species == 2)
m1a_4_derva<-subset(m1a_4,m1a_4$species == 3)
m1a_4_ixosc<-subset(m1a_4,m1a_4$species == 4)

m1a_5_ambam<-subset(m1a_5,m1a_5$species == 1)
m1a_5_ambma<-subset(m1a_5,m1a_5$species == 2)
m1a_5_derva<-subset(m1a_5,m1a_5$species == 3)
m1a_5_ixosc<-subset(m1a_5,m1a_5$species == 4)

m1a_6_ambam<-subset(m1a_6,m1a_6$species == 1)
m1a_6_ambma<-subset(m1a_6,m1a_6$species == 2)
m1a_6_derva<-subset(m1a_6,m1a_6$species == 3)
m1a_6_ixosc<-subset(m1a_6,m1a_6$species == 4)

m1a_7_ambam<-subset(m1a_7,m1a_7$species == 1)
m1a_7_ambma<-subset(m1a_7,m1a_7$species == 2)
m1a_7_derva<-subset(m1a_7,m1a_7$species == 3)
m1a_7_ixosc<-subset(m1a_7,m1a_7$species == 4)

m1a_8_ambam<-subset(m1a_8,m1a_8$species == 1)
m1a_8_ambma<-subset(m1a_8,m1a_8$species == 2)
m1a_8_derva<-subset(m1a_8,m1a_8$species == 3)
m1a_8_ixosc<-subset(m1a_8,m1a_8$species == 4)

m1a_9_ambam<-subset(m1a_9,m1a_9$species == 1)
m1a_9_ambma<-subset(m1a_9,m1a_9$species == 2)
m1a_9_derva<-subset(m1a_9,m1a_9$species == 3)
m1a_9_ixosc<-subset(m1a_9,m1a_9$species == 4)

m1a_10_ambam<-subset(m1a_10,m1a_10$species == 1)
m1a_10_ambma<-subset(m1a_10,m1a_10$species == 2)
m1a_10_derva<-subset(m1a_10,m1a_10$species == 3)
m1a_10_ixosc<-subset(m1a_10,m1a_10$species == 4)

m2a_1_ambam<-subset(m2a_1,m2a_1$species == 1)
m2a_1_ambma<-subset(m2a_1,m2a_1$species == 2)
m2a_1_derva<-subset(m2a_1,m2a_1$species == 3)
m2a_1_ixosc<-subset(m2a_1,m2a_1$species == 4)

m2a_2_ambam<-subset(m2a_2,m1a_2$species == 1)
m2a_2_ambma<-subset(m2a_2,m1a_2$species == 2)
m2a_2_derva<-subset(m2a_2,m1a_2$species == 3)
m2a_2_ixosc<-subset(m2a_2,m1a_2$species == 4)

m2a_3_ambam<-subset(m2a_3,m2a_3$species == 1)
m2a_3_ambma<-subset(m2a_3,m2a_3$species == 2)
m2a_3_derva<-subset(m2a_3,m2a_3$species == 3)
m2a_3_ixosc<-subset(m2a_3,m2a_3$species == 4)

m2a_4_ambam<-subset(m2a_4,m2a_4$species == 1)
m2a_4_ambma<-subset(m2a_4,m2a_4$species == 2)
m2a_4_derva<-subset(m2a_4,m2a_4$species == 3)
m2a_4_ixosc<-subset(m2a_4,m2a_4$species == 4)

m2a_5_ambam<-subset(m2a_5,m2a_5$species == 1)
m2a_5_ambma<-subset(m2a_5,m2a_5$species == 2)
m2a_5_derva<-subset(m2a_5,m2a_5$species == 3)
m2a_5_ixosc<-subset(m2a_5,m2a_5$species == 4)

m2a_6_ambam<-subset(m2a_6,m2a_6$species == 1)
m2a_6_ambma<-subset(m2a_6,m2a_6$species == 2)
m2a_6_derva<-subset(m2a_6,m2a_6$species == 3)
m2a_6_ixosc<-subset(m2a_6,m2a_6$species == 4)

m2a_7_ambam<-subset(m2a_7,m2a_7$species == 1)
m2a_7_ambma<-subset(m2a_7,m2a_7$species == 2)
m2a_7_derva<-subset(m2a_7,m2a_7$species == 3)
m2a_7_ixosc<-subset(m2a_7,m2a_7$species == 4)

m2a_8_ambam<-subset(m2a_8,m2a_8$species == 1)
m2a_8_ambma<-subset(m2a_8,m2a_8$species == 2)
m2a_8_derva<-subset(m2a_8,m2a_8$species == 3)
m2a_8_ixosc<-subset(m2a_8,m2a_8$species == 4)

m2a_9_ambam<-subset(m2a_9,m2a_9$species == 1)
m2a_9_ambma<-subset(m2a_9,m2a_9$species == 2)
m2a_9_derva<-subset(m2a_9,m2a_9$species == 3)
m2a_9_ixosc<-subset(m2a_9,m2a_9$species == 4)

m2a_10_ambam<-subset(m2a_10,m2a_10$species == 1)
m2a_10_ambma<-subset(m2a_10,m2a_10$species == 2)
m2a_10_derva<-subset(m2a_10,m2a_10$species == 3)
m2a_10_ixosc<-subset(m2a_10,m2a_10$species == 4)

m3a_1_ambam<-subset(m3a_1,m3a_1$species == 1)
m3a_1_ambma<-subset(m3a_1,m3a_1$species == 2)
m3a_1_derva<-subset(m3a_1,m3a_1$species == 3)
m3a_1_ixosc<-subset(m3a_1,m3a_1$species == 4)

m3a_2_ambam<-subset(m3a_2,m3a_2$species == 1)
m3a_2_ambma<-subset(m3a_2,m3a_2$species == 2)
m3a_2_derva<-subset(m3a_2,m3a_2$species == 3)
m3a_2_ixosc<-subset(m3a_2,m3a_2$species == 4)

m3a_3_ambam<-subset(m3a_3,m3a_3$species == 1)
m3a_3_ambma<-subset(m3a_3,m3a_3$species == 2)
m3a_3_derva<-subset(m3a_3,m3a_3$species == 3)
m3a_3_ixosc<-subset(m3a_3,m3a_3$species == 4)

m3a_4_ambam<-subset(m3a_4,m3a_4$species == 1)
m3a_4_ambma<-subset(m3a_4,m3a_4$species == 2)
m3a_4_derva<-subset(m3a_4,m3a_4$species == 3)
m3a_4_ixosc<-subset(m3a_4,m3a_4$species == 4)

m3a_5_ambam<-subset(m3a_5,m3a_5$species == 1)
m3a_5_ambma<-subset(m3a_5,m3a_5$species == 2)
m3a_5_derva<-subset(m3a_5,m3a_5$species == 3)
m3a_5_ixosc<-subset(m3a_5,m3a_5$species == 4)

m3a_6_ambam<-subset(m3a_6,m3a_6$species == 1)
m3a_6_ambma<-subset(m3a_6,m3a_6$species == 2)
m3a_6_derva<-subset(m3a_6,m3a_6$species == 3)
m3a_6_ixosc<-subset(m3a_6,m3a_6$species == 4)

m3a_7_ambam<-subset(m3a_7,m3a_7$species == 1)
m3a_7_ambma<-subset(m3a_7,m3a_7$species == 2)
m3a_7_derva<-subset(m3a_7,m3a_7$species == 3)
m3a_7_ixosc<-subset(m3a_7,m3a_7$species == 4)

m3a_8_ambam<-subset(m3a_8,m3a_8$species == 1)
m3a_8_ambma<-subset(m3a_8,m3a_8$species == 2)
m3a_8_derva<-subset(m3a_8,m3a_8$species == 3)
m3a_8_ixosc<-subset(m3a_8,m3a_8$species == 4)

m3a_9_ambam<-subset(m3a_9,m3a_9$species == 1)
m3a_9_ambma<-subset(m3a_9,m3a_9$species == 2)
m3a_9_derva<-subset(m3a_9,m3a_9$species == 3)
m3a_9_ixosc<-subset(m3a_9,m3a_9$species == 4)

m3a_10_ambam<-subset(m3a_10,m3a_10$species == 1)
m3a_10_ambma<-subset(m3a_10,m3a_10$species == 2)
m3a_10_derva<-subset(m3a_10,m3a_10$species == 3)
m3a_10_ixosc<-subset(m3a_10,m3a_10$species == 4)

m4a_1_ambam<-subset(m4a_1,m4a_1$species == 1)
m4a_1_ambma<-subset(m4a_1,m4a_1$species == 2)
m4a_1_derva<-subset(m4a_1,m4a_1$species == 3)
m4a_1_ixosc<-subset(m4a_1,m4a_1$species == 4)

m4a_2_ambam<-subset(m4a_2,m4a_2$species == 1)
m4a_2_ambma<-subset(m4a_2,m4a_2$species == 2)
m4a_2_derva<-subset(m4a_2,m4a_2$species == 3)
m4a_2_ixosc<-subset(m4a_2,m4a_2$species == 4)

m4a_3_ambam<-subset(m4a_3,m4a_3$species == 1)
m4a_3_ambma<-subset(m4a_3,m4a_3$species == 2)
m4a_3_derva<-subset(m4a_3,m4a_3$species == 3)
m4a_3_ixosc<-subset(m4a_3,m4a_3$species == 4)

m4a_4_ambam<-subset(m4a_4,m4a_4$species == 1)
m4a_4_ambma<-subset(m4a_4,m4a_4$species == 2)
m4a_4_derva<-subset(m4a_4,m4a_4$species == 3)
m4a_4_ixosc<-subset(m4a_4,m4a_4$species == 4)

m4a_5_ambam<-subset(m4a_5,m4a_5$species == 1)
m4a_5_ambma<-subset(m4a_5,m4a_5$species == 2)
m4a_5_derva<-subset(m4a_5,m4a_5$species == 3)
m4a_5_ixosc<-subset(m4a_5,m4a_5$species == 4)

m4a_6_ambam<-subset(m4a_6,m4a_6$species == 1)
m4a_6_ambma<-subset(m4a_6,m4a_6$species == 2)
m4a_6_derva<-subset(m4a_6,m4a_6$species == 3)
m4a_6_ixosc<-subset(m4a_6,m4a_6$species == 4)

m4a_7_ambam<-subset(m4a_7,m4a_7$species == 1)
m4a_7_ambma<-subset(m4a_7,m4a_7$species == 2)
m4a_7_derva<-subset(m4a_7,m4a_7$species == 3)
m4a_7_ixosc<-subset(m4a_7,m4a_7$species == 4)

m4a_8_ambam<-subset(m4a_8,m4a_8$species == 1)
m4a_8_ambma<-subset(m4a_8,m4a_8$species == 2)
m4a_8_derva<-subset(m4a_8,m4a_8$species == 3)
m4a_8_ixosc<-subset(m4a_8,m4a_8$species == 4)

m4a_9_ambam<-subset(m4a_9,m4a_9$species == 1)
m4a_9_ambma<-subset(m4a_9,m4a_9$species == 2)
m4a_9_derva<-subset(m4a_9,m4a_9$species == 3)
m4a_9_ixosc<-subset(m4a_9,m4a_9$species == 4)

m4a_10_ambam<-subset(m4a_10,m4a_10$species == 1)
m4a_10_ambma<-subset(m4a_10,m4a_10$species == 2)
m4a_10_derva<-subset(m4a_10,m4a_10$species == 3)
m4a_10_ixosc<-subset(m4a_10,m4a_10$species == 4)

m5a_1_ambam<-subset(m5a_1,m5a_1$species == 1)
m5a_1_ambma<-subset(m5a_1,m5a_1$species == 2)
m5a_1_derva<-subset(m5a_1,m5a_1$species == 3)
m5a_1_ixosc<-subset(m5a_1,m5a_1$species == 4)

m5a_2_ambam<-subset(m5a_2,m5a_2$species == 1)
m5a_2_ambma<-subset(m5a_2,m5a_2$species == 2)
m5a_2_derva<-subset(m5a_2,m5a_2$species == 3)
m5a_2_ixosc<-subset(m5a_2,m5a_2$species == 4)

m5a_3_ambam<-subset(m5a_3,m5a_3$species == 1)
m5a_3_ambma<-subset(m5a_3,m5a_3$species == 2)
m5a_3_derva<-subset(m5a_3,m5a_3$species == 3)
m5a_3_ixosc<-subset(m5a_3,m5a_3$species == 4)

m5a_4_ambam<-subset(m5a_4,m5a_4$species == 1)
m5a_4_ambma<-subset(m5a_4,m5a_4$species == 2)
m5a_4_derva<-subset(m5a_4,m5a_4$species == 3)
m5a_4_ixosc<-subset(m5a_4,m5a_4$species == 4)

m5a_5_ambam<-subset(m5a_5,m5a_5$species == 1)
m5a_5_ambma<-subset(m5a_5,m5a_5$species == 2)
m5a_5_derva<-subset(m5a_5,m5a_5$species == 3)
m5a_5_ixosc<-subset(m5a_5,m5a_5$species == 4)

m5a_6_ambam<-subset(m5a_6,m5a_6$species == 1)
m5a_6_ambma<-subset(m5a_6,m5a_6$species == 2)
m5a_6_derva<-subset(m5a_6,m5a_6$species == 3)
m5a_6_ixosc<-subset(m5a_6,m5a_6$species == 4)

m5a_7_ambam<-subset(m5a_7,m5a_7$species == 1)
m5a_7_ambma<-subset(m5a_7,m5a_7$species == 2)
m5a_7_derva<-subset(m5a_7,m5a_7$species == 3)
m5a_7_ixosc<-subset(m5a_7,m5a_7$species == 4)

m5a_8_ambam<-subset(m5a_8,m5a_8$species == 1)
m5a_8_ambma<-subset(m5a_8,m5a_8$species == 2)
m5a_8_derva<-subset(m5a_8,m5a_8$species == 3)
m5a_8_ixosc<-subset(m5a_8,m5a_8$species == 4)

m5a_9_ambam<-subset(m5a_9,m5a_9$species == 1)
m5a_9_ambma<-subset(m5a_9,m5a_9$species == 2)
m5a_9_derva<-subset(m5a_9,m5a_9$species == 3)
m5a_9_ixosc<-subset(m5a_9,m5a_9$species == 4)

m5a_10_ambam<-subset(m5a_10,m5a_10$species == 1)
m5a_10_ambma<-subset(m5a_10,m5a_10$species == 2)
m5a_10_derva<-subset(m5a_10,m5a_10$species == 3)
m5a_10_ixosc<-subset(m5a_10,m5a_10$species == 4)

m6a_1_ambam<-subset(m6a_1,m6a_1$species == 1)
m6a_1_ambma<-subset(m6a_1,m6a_1$species == 2)
m6a_1_derva<-subset(m6a_1,m6a_1$species == 3)
m6a_1_ixosc<-subset(m6a_1,m6a_1$species == 4)

m6a_2_ambam<-subset(m6a_2,m6a_2$species == 1)
m6a_2_ambma<-subset(m6a_2,m6a_2$species == 2)
m6a_2_derva<-subset(m6a_2,m6a_2$species == 3)
m6a_2_ixosc<-subset(m6a_2,m6a_2$species == 4)

m6a_3_ambam<-subset(m6a_3,m6a_3$species == 1)
m6a_3_ambma<-subset(m6a_3,m6a_3$species == 2)
m6a_3_derva<-subset(m6a_3,m6a_3$species == 3)
m6a_3_ixosc<-subset(m6a_3,m6a_3$species == 4)

m6a_4_ambam<-subset(m6a_4,m6a_4$species == 1)
m6a_4_ambma<-subset(m6a_4,m6a_4$species == 2)
m6a_4_derva<-subset(m6a_4,m6a_4$species == 3)
m6a_4_ixosc<-subset(m6a_4,m6a_4$species == 4)

m6a_5_ambam<-subset(m6a_5,m6a_5$species == 1)
m6a_5_ambma<-subset(m6a_5,m6a_5$species == 2)
m6a_5_derva<-subset(m6a_5,m6a_5$species == 3)
m6a_5_ixosc<-subset(m6a_5,m6a_5$species == 4)

m6a_6_ambam<-subset(m6a_6,m6a_6$species == 1)
m6a_6_ambma<-subset(m6a_6,m6a_6$species == 2)
m6a_6_derva<-subset(m6a_6,m6a_6$species == 3)
m6a_6_ixosc<-subset(m6a_6,m6a_6$species == 4)

m6a_7_ambam<-subset(m6a_7,m6a_7$species == 1)
m6a_7_ambma<-subset(m6a_7,m6a_7$species == 2)
m6a_7_derva<-subset(m6a_7,m6a_7$species == 3)
m6a_7_ixosc<-subset(m6a_7,m6a_7$species == 4)

m6a_8_ambam<-subset(m6a_8,m6a_8$species == 1)
m6a_8_ambma<-subset(m6a_8,m6a_8$species == 2)
m6a_8_derva<-subset(m6a_8,m6a_8$species == 3)
m6a_8_ixosc<-subset(m6a_8,m6a_8$species == 4)

m6a_9_ambam<-subset(m6a_9,m6a_9$species == 1)
m6a_9_ambma<-subset(m6a_9,m6a_9$species == 2)
m6a_9_derva<-subset(m6a_9,m6a_9$species == 3)
m6a_9_ixosc<-subset(m6a_9,m6a_9$species == 4)

m6a_10_ambam<-subset(m6a_10,m6a_10$species == 1)
m6a_10_ambma<-subset(m6a_10,m6a_10$species == 2)
m6a_10_derva<-subset(m6a_10,m6a_10$species == 3)
m6a_10_ixosc<-subset(m6a_10,m6a_10$species == 4)

m1b_1_ambam<-subset(m1b_1,m1b_1$species == 1)
m1b_1_ambma<-subset(m1b_1,m1b_1$species == 2)
m1b_1_derva<-subset(m1b_1,m1b_1$species == 3)
m1b_1_ixosc<-subset(m1b_1,m1b_1$species == 4)

m1b_2_ambam<-subset(m1b_2,m1b_2$species == 1)
m1b_2_ambma<-subset(m1b_2,m1b_2$species == 2)
m1b_2_derva<-subset(m1b_2,m1b_2$species == 3)
m1b_2_ixosc<-subset(m1b_2,m1b_2$species == 4)

m1b_3_ambam<-subset(m1b_3,m1b_3$species == 1)
m1b_3_ambma<-subset(m1b_3,m1b_3$species == 2)
m1b_3_derva<-subset(m1b_3,m1b_3$species == 3)
m1b_3_ixosc<-subset(m1b_3,m1b_3$species == 4)

m1b_4_ambam<-subset(m1b_4,m1b_4$species == 1)
m1b_4_ambma<-subset(m1b_4,m1b_4$species == 2)
m1b_4_derva<-subset(m1b_4,m1b_4$species == 3)
m1b_4_ixosc<-subset(m1b_4,m1b_4$species == 4)

m1b_5_ambam<-subset(m1b_5,m1b_5$species == 1)
m1b_5_ambma<-subset(m1b_5,m1b_5$species == 2)
m1b_5_derva<-subset(m1b_5,m1b_5$species == 3)
m1b_5_ixosc<-subset(m1b_5,m1b_5$species == 4)

m1b_6_ambam<-subset(m1b_6,m1b_6$species == 1)
m1b_6_ambma<-subset(m1b_6,m1b_6$species == 2)
m1b_6_derva<-subset(m1b_6,m1b_6$species == 3)
m1b_6_ixosc<-subset(m1b_6,m1b_6$species == 4)

m1b_7_ambam<-subset(m1b_7,m1b_7$species == 1)
m1b_7_ambma<-subset(m1b_7,m1b_7$species == 2)
m1b_7_derva<-subset(m1b_7,m1b_7$species == 3)
m1b_7_ixosc<-subset(m1b_7,m1b_7$species == 4)

m1b_8_ambam<-subset(m1b_8,m1b_8$species == 1)
m1b_8_ambma<-subset(m1b_8,m1b_8$species == 2)
m1b_8_derva<-subset(m1b_8,m1b_8$species == 3)
m1b_8_ixosc<-subset(m1b_8,m1b_8$species == 4)

m1b_9_ambam<-subset(m1b_9,m1b_9$species == 1)
m1b_9_ambma<-subset(m1b_9,m1b_9$species == 2)
m1b_9_derva<-subset(m1b_9,m1b_9$species == 3)
m1b_9_ixosc<-subset(m1b_9,m1b_9$species == 4)

m1b_10_ambam<-subset(m1b_10,m1b_10$species == 1)
m1b_10_ambma<-subset(m1b_10,m1b_10$species == 2)
m1b_10_derva<-subset(m1b_10,m1b_10$species == 3)
m1b_10_ixosc<-subset(m1b_10,m1b_10$species == 4)

m2b_1_ambam<-subset(m2b_1,m2b_1$species == 1)
m2b_1_ambma<-subset(m2b_1,m2b_1$species == 2)
m2b_1_derva<-subset(m2b_1,m2b_1$species == 3)
m2b_1_ixosc<-subset(m2b_1,m2b_1$species == 4)

m2b_2_ambam<-subset(m2b_2,m1b_2$species == 1)
m2b_2_ambma<-subset(m2b_2,m1b_2$species == 2)
m2b_2_derva<-subset(m2b_2,m1b_2$species == 3)
m2b_2_ixosc<-subset(m2b_2,m1b_2$species == 4)

m2b_3_ambam<-subset(m2b_3,m2b_3$species == 1)
m2b_3_ambma<-subset(m2b_3,m2b_3$species == 2)
m2b_3_derva<-subset(m2b_3,m2b_3$species == 3)
m2b_3_ixosc<-subset(m2b_3,m2b_3$species == 4)

m2b_4_ambam<-subset(m2b_4,m2b_4$species == 1)
m2b_4_ambma<-subset(m2b_4,m2b_4$species == 2)
m2b_4_derva<-subset(m2b_4,m2b_4$species == 3)
m2b_4_ixosc<-subset(m2b_4,m2b_4$species == 4)

m2b_5_ambam<-subset(m2b_5,m2b_5$species == 1)
m2b_5_ambma<-subset(m2b_5,m2b_5$species == 2)
m2b_5_derva<-subset(m2b_5,m2b_5$species == 3)
m2b_5_ixosc<-subset(m2b_5,m2b_5$species == 4)

m2b_6_ambam<-subset(m2b_6,m2b_6$species == 1)
m2b_6_ambma<-subset(m2b_6,m2b_6$species == 2)
m2b_6_derva<-subset(m2b_6,m2b_6$species == 3)
m2b_6_ixosc<-subset(m2b_6,m2b_6$species == 4)

m2b_7_ambam<-subset(m2b_7,m2b_7$species == 1)
m2b_7_ambma<-subset(m2b_7,m2b_7$species == 2)
m2b_7_derva<-subset(m2b_7,m2b_7$species == 3)
m2b_7_ixosc<-subset(m2b_7,m2b_7$species == 4)

m2b_8_ambam<-subset(m2b_8,m2b_8$species == 1)
m2b_8_ambma<-subset(m2b_8,m2b_8$species == 2)
m2b_8_derva<-subset(m2b_8,m2b_8$species == 3)
m2b_8_ixosc<-subset(m2b_8,m2b_8$species == 4)

m2b_9_ambam<-subset(m2b_9,m2b_9$species == 1)
m2b_9_ambma<-subset(m2b_9,m2b_9$species == 2)
m2b_9_derva<-subset(m2b_9,m2b_9$species == 3)
m2b_9_ixosc<-subset(m2b_9,m2b_9$species == 4)

m2b_10_ambam<-subset(m2b_10,m2b_10$species == 1)
m2b_10_ambma<-subset(m2b_10,m2b_10$species == 2)
m2b_10_derva<-subset(m2b_10,m2b_10$species == 3)
m2b_10_ixosc<-subset(m2b_10,m2b_10$species == 4)

m3b_1_ambam<-subset(m3b_1,m3b_1$species == 1)
m3b_1_ambma<-subset(m3b_1,m3b_1$species == 2)
m3b_1_derva<-subset(m3b_1,m3b_1$species == 3)
m3b_1_ixosc<-subset(m3b_1,m3b_1$species == 4)

m3b_2_ambam<-subset(m3b_2,m3b_2$species == 1)
m3b_2_ambma<-subset(m3b_2,m3b_2$species == 2)
m3b_2_derva<-subset(m3b_2,m3b_2$species == 3)
m3b_2_ixosc<-subset(m3b_2,m3b_2$species == 4)

m3b_3_ambam<-subset(m3b_3,m3b_3$species == 1)
m3b_3_ambma<-subset(m3b_3,m3b_3$species == 2)
m3b_3_derva<-subset(m3b_3,m3b_3$species == 3)
m3b_3_ixosc<-subset(m3b_3,m3b_3$species == 4)

m3b_4_ambam<-subset(m3b_4,m3b_4$species == 1)
m3b_4_ambma<-subset(m3b_4,m3b_4$species == 2)
m3b_4_derva<-subset(m3b_4,m3b_4$species == 3)
m3b_4_ixosc<-subset(m3b_4,m3b_4$species == 4)

m3b_5_ambam<-subset(m3b_5,m3b_5$species == 1)
m3b_5_ambma<-subset(m3b_5,m3b_5$species == 2)
m3b_5_derva<-subset(m3b_5,m3b_5$species == 3)
m3b_5_ixosc<-subset(m3b_5,m3b_5$species == 4)

m3b_6_ambam<-subset(m3b_6,m3b_6$species == 1)
m3b_6_ambma<-subset(m3b_6,m3b_6$species == 2)
m3b_6_derva<-subset(m3b_6,m3b_6$species == 3)
m3b_6_ixosc<-subset(m3b_6,m3b_6$species == 4)

m3b_7_ambam<-subset(m3b_7,m3b_7$species == 1)
m3b_7_ambma<-subset(m3b_7,m3b_7$species == 2)
m3b_7_derva<-subset(m3b_7,m3b_7$species == 3)
m3b_7_ixosc<-subset(m3b_7,m3b_7$species == 4)

m3b_8_ambam<-subset(m3b_8,m3b_8$species == 1)
m3b_8_ambma<-subset(m3b_8,m3b_8$species == 2)
m3b_8_derva<-subset(m3b_8,m3b_8$species == 3)
m3b_8_ixosc<-subset(m3b_8,m3b_8$species == 4)

m3b_9_ambam<-subset(m3b_9,m3b_9$species == 1)
m3b_9_ambma<-subset(m3b_9,m3b_9$species == 2)
m3b_9_derva<-subset(m3b_9,m3b_9$species == 3)
m3b_9_ixosc<-subset(m3b_9,m3b_9$species == 4)

m3b_10_ambam<-subset(m3b_10,m3b_10$species == 1)
m3b_10_ambma<-subset(m3b_10,m3b_10$species == 2)
m3b_10_derva<-subset(m3b_10,m3b_10$species == 3)
m3b_10_ixosc<-subset(m3b_10,m3b_10$species == 4)

m4b_1_ambam<-subset(m4b_1,m4b_1$species == 1)
m4b_1_ambma<-subset(m4b_1,m4b_1$species == 2)
m4b_1_derva<-subset(m4b_1,m4b_1$species == 3)
m4b_1_ixosc<-subset(m4b_1,m4b_1$species == 4)

m4b_2_ambam<-subset(m4b_2,m4b_2$species == 1)
m4b_2_ambma<-subset(m4b_2,m4b_2$species == 2)
m4b_2_derva<-subset(m4b_2,m4b_2$species == 3)
m4b_2_ixosc<-subset(m4b_2,m4b_2$species == 4)

m4b_3_ambam<-subset(m4b_3,m4b_3$species == 1)
m4b_3_ambma<-subset(m4b_3,m4b_3$species == 2)
m4b_3_derva<-subset(m4b_3,m4b_3$species == 3)
m4b_3_ixosc<-subset(m4b_3,m4b_3$species == 4)

m4b_4_ambam<-subset(m4b_4,m4b_4$species == 1)
m4b_4_ambma<-subset(m4b_4,m4b_4$species == 2)
m4b_4_derva<-subset(m4b_4,m4b_4$species == 3)
m4b_4_ixosc<-subset(m4b_4,m4b_4$species == 4)

m4b_5_ambam<-subset(m4b_5,m4b_5$species == 1)
m4b_5_ambma<-subset(m4b_5,m4b_5$species == 2)
m4b_5_derva<-subset(m4b_5,m4b_5$species == 3)
m4b_5_ixosc<-subset(m4b_5,m4b_5$species == 4)

m4b_6_ambam<-subset(m4b_6,m4b_6$species == 1)
m4b_6_ambma<-subset(m4b_6,m4b_6$species == 2)
m4b_6_derva<-subset(m4b_6,m4b_6$species == 3)
m4b_6_ixosc<-subset(m4b_6,m4b_6$species == 4)

m4b_7_ambam<-subset(m4b_7,m4b_7$species == 1)
m4b_7_ambma<-subset(m4b_7,m4b_7$species == 2)
m4b_7_derva<-subset(m4b_7,m4b_7$species == 3)
m4b_7_ixosc<-subset(m4b_7,m4b_7$species == 4)

m4b_8_ambam<-subset(m4b_8,m4b_8$species == 1)
m4b_8_ambma<-subset(m4b_8,m4b_8$species == 2)
m4b_8_derva<-subset(m4b_8,m4b_8$species == 3)
m4b_8_ixosc<-subset(m4b_8,m4b_8$species == 4)

m4b_9_ambam<-subset(m4b_9,m4b_9$species == 1)
m4b_9_ambma<-subset(m4b_9,m4b_9$species == 2)
m4b_9_derva<-subset(m4b_9,m4b_9$species == 3)
m4b_9_ixosc<-subset(m4b_9,m4b_9$species == 4)

m4b_10_ambam<-subset(m4b_10,m4b_10$species == 1)
m4b_10_ambma<-subset(m4b_10,m4b_10$species == 2)
m4b_10_derva<-subset(m4b_10,m4b_10$species == 3)
m4b_10_ixosc<-subset(m4b_10,m4b_10$species == 4)

m5b_1_ambam<-subset(m5b_1,m5b_1$species == 1)
m5b_1_ambma<-subset(m5b_1,m5b_1$species == 2)
m5b_1_derva<-subset(m5b_1,m5b_1$species == 3)
m5b_1_ixosc<-subset(m5b_1,m5b_1$species == 4)

m5b_2_ambam<-subset(m5b_2,m5b_2$species == 1)
m5b_2_ambma<-subset(m5b_2,m5b_2$species == 2)
m5b_2_derva<-subset(m5b_2,m5b_2$species == 3)
m5b_2_ixosc<-subset(m5b_2,m5b_2$species == 4)

m5b_3_ambam<-subset(m5b_3,m5b_3$species == 1)
m5b_3_ambma<-subset(m5b_3,m5b_3$species == 2)
m5b_3_derva<-subset(m5b_3,m5b_3$species == 3)
m5b_3_ixosc<-subset(m5b_3,m5b_3$species == 4)

m5b_4_ambam<-subset(m5b_4,m5b_4$species == 1)
m5b_4_ambma<-subset(m5b_4,m5b_4$species == 2)
m5b_4_derva<-subset(m5b_4,m5b_4$species == 3)
m5b_4_ixosc<-subset(m5b_4,m5b_4$species == 4)

m5b_5_ambam<-subset(m5b_5,m5b_5$species == 1)
m5b_5_ambma<-subset(m5b_5,m5b_5$species == 2)
m5b_5_derva<-subset(m5b_5,m5b_5$species == 3)
m5b_5_ixosc<-subset(m5b_5,m5b_5$species == 4)

m5b_6_ambam<-subset(m5b_6,m5b_6$species == 1)
m5b_6_ambma<-subset(m5b_6,m5b_6$species == 2)
m5b_6_derva<-subset(m5b_6,m5b_6$species == 3)
m5b_6_ixosc<-subset(m5b_6,m5b_6$species == 4)

m5b_7_ambam<-subset(m5b_7,m5b_7$species == 1)
m5b_7_ambma<-subset(m5b_7,m5b_7$species == 2)
m5b_7_derva<-subset(m5b_7,m5b_7$species == 3)
m5b_7_ixosc<-subset(m5b_7,m5b_7$species == 4)

m5b_8_ambam<-subset(m5b_8,m5b_8$species == 1)
m5b_8_ambma<-subset(m5b_8,m5b_8$species == 2)
m5b_8_derva<-subset(m5b_8,m5b_8$species == 3)
m5b_8_ixosc<-subset(m5b_8,m5b_8$species == 4)

m5b_9_ambam<-subset(m5b_9,m5b_9$species == 1)
m5b_9_ambma<-subset(m5b_9,m5b_9$species == 2)
m5b_9_derva<-subset(m5b_9,m5b_9$species == 3)
m5b_9_ixosc<-subset(m5b_9,m5b_9$species == 4)

m5b_10_ambam<-subset(m5b_10,m5b_10$species == 1)
m5b_10_ambma<-subset(m5b_10,m5b_10$species == 2)
m5b_10_derva<-subset(m5b_10,m5b_10$species == 3)
m5b_10_ixosc<-subset(m5b_10,m5b_10$species == 4)

m6b_1_ambam<-subset(m6b_1,m6b_1$species == 1)
m6b_1_ambma<-subset(m6b_1,m6b_1$species == 2)
m6b_1_derva<-subset(m6b_1,m6b_1$species == 3)
m6b_1_ixosc<-subset(m6b_1,m6b_1$species == 4)

m6b_2_ambam<-subset(m6b_2,m6b_2$species == 1)
m6b_2_ambma<-subset(m6b_2,m6b_2$species == 2)
m6b_2_derva<-subset(m6b_2,m6b_2$species == 3)
m6b_2_ixosc<-subset(m6b_2,m6b_2$species == 4)

m6b_3_ambam<-subset(m6b_3,m6b_3$species == 1)
m6b_3_ambma<-subset(m6b_3,m6b_3$species == 2)
m6b_3_derva<-subset(m6b_3,m6b_3$species == 3)
m6b_3_ixosc<-subset(m6b_3,m6b_3$species == 4)

m6b_4_ambam<-subset(m6b_4,m6b_4$species == 1)
m6b_4_ambma<-subset(m6b_4,m6b_4$species == 2)
m6b_4_derva<-subset(m6b_4,m6b_4$species == 3)
m6b_4_ixosc<-subset(m6b_4,m6b_4$species == 4)

m6b_5_ambam<-subset(m6b_5,m6b_5$species == 1)
m6b_5_ambma<-subset(m6b_5,m6b_5$species == 2)
m6b_5_derva<-subset(m6b_5,m6b_5$species == 3)
m6b_5_ixosc<-subset(m6b_5,m6b_5$species == 4)

m6b_6_ambam<-subset(m6b_6,m6b_6$species == 1)
m6b_6_ambma<-subset(m6b_6,m6b_6$species == 2)
m6b_6_derva<-subset(m6b_6,m6b_6$species == 3)
m6b_6_ixosc<-subset(m6b_6,m6b_6$species == 4)

m6b_7_ambam<-subset(m6b_7,m6b_7$species == 1)
m6b_7_ambma<-subset(m6b_7,m6b_7$species == 2)
m6b_7_derva<-subset(m6b_7,m6b_7$species == 3)
m6b_7_ixosc<-subset(m6b_7,m6b_7$species == 4)

m6b_8_ambam<-subset(m6b_8,m6b_8$species == 1)
m6b_8_ambma<-subset(m6b_8,m6b_8$species == 2)
m6b_8_derva<-subset(m6b_8,m6b_8$species == 3)
m6b_8_ixosc<-subset(m6b_8,m6b_8$species == 4)

m6b_9_ambam<-subset(m6b_9,m6b_9$species == 1)
m6b_9_ambma<-subset(m6b_9,m6b_9$species == 2)
m6b_9_derva<-subset(m6b_9,m6b_9$species == 3)
m6b_9_ixosc<-subset(m6b_9,m6b_9$species == 4)

m6b_10_ambam<-subset(m6b_10,m6b_10$species == 1)
m6b_10_ambma<-subset(m6b_10,m6b_10$species == 2)
m6b_10_derva<-subset(m6b_10,m6b_10$species == 3)
m6b_10_ixosc<-subset(m6b_10,m6b_10$species == 4)

m1c_1_ambam<-subset(m1c_1,m1c_1$species == 1)
m1c_1_ambma<-subset(m1c_1,m1c_1$species == 2)
m1c_1_derva<-subset(m1c_1,m1c_1$species == 3)
m1c_1_ixosc<-subset(m1c_1,m1c_1$species == 4)

m1c_2_ambam<-subset(m1c_2,m1c_2$species == 1)
m1c_2_ambma<-subset(m1c_2,m1c_2$species == 2)
m1c_2_derva<-subset(m1c_2,m1c_2$species == 3)
m1c_2_ixosc<-subset(m1c_2,m1c_2$species == 4)

m1c_3_ambam<-subset(m1c_3,m1c_3$species == 1)
m1c_3_ambma<-subset(m1c_3,m1c_3$species == 2)
m1c_3_derva<-subset(m1c_3,m1c_3$species == 3)
m1c_3_ixosc<-subset(m1c_3,m1c_3$species == 4)

m1c_4_ambam<-subset(m1c_4,m1c_4$species == 1)
m1c_4_ambma<-subset(m1c_4,m1c_4$species == 2)
m1c_4_derva<-subset(m1c_4,m1c_4$species == 3)
m1c_4_ixosc<-subset(m1c_4,m1c_4$species == 4)

m1c_5_ambam<-subset(m1c_5,m1c_5$species == 1)
m1c_5_ambma<-subset(m1c_5,m1c_5$species == 2)
m1c_5_derva<-subset(m1c_5,m1c_5$species == 3)
m1c_5_ixosc<-subset(m1c_5,m1c_5$species == 4)

m1c_6_ambam<-subset(m1c_6,m1c_6$species == 1)
m1c_6_ambma<-subset(m1c_6,m1c_6$species == 2)
m1c_6_derva<-subset(m1c_6,m1c_6$species == 3)
m1c_6_ixosc<-subset(m1c_6,m1c_6$species == 4)

m1c_7_ambam<-subset(m1c_7,m1c_7$species == 1)
m1c_7_ambma<-subset(m1c_7,m1c_7$species == 2)
m1c_7_derva<-subset(m1c_7,m1c_7$species == 3)
m1c_7_ixosc<-subset(m1c_7,m1c_7$species == 4)

m1c_8_ambam<-subset(m1c_8,m1c_8$species == 1)
m1c_8_ambma<-subset(m1c_8,m1c_8$species == 2)
m1c_8_derva<-subset(m1c_8,m1c_8$species == 3)
m1c_8_ixosc<-subset(m1c_8,m1c_8$species == 4)

m1c_9_ambam<-subset(m1c_9,m1c_9$species == 1)
m1c_9_ambma<-subset(m1c_9,m1c_9$species == 2)
m1c_9_derva<-subset(m1c_9,m1c_9$species == 3)
m1c_9_ixosc<-subset(m1c_9,m1c_9$species == 4)

m1c_10_ambam<-subset(m1c_10,m1c_10$species == 1)
m1c_10_ambma<-subset(m1c_10,m1c_10$species == 2)
m1c_10_derva<-subset(m1c_10,m1c_10$species == 3)
m1c_10_ixosc<-subset(m1c_10,m1c_10$species == 4)

m2c_1_ambam<-subset(m2c_1,m2c_1$species == 1)
m2c_1_ambma<-subset(m2c_1,m2c_1$species == 2)
m2c_1_derva<-subset(m2c_1,m2c_1$species == 3)
m2c_1_ixosc<-subset(m2c_1,m2c_1$species == 4)

m2c_2_ambam<-subset(m2c_2,m1c_2$species == 1)
m2c_2_ambma<-subset(m2c_2,m1c_2$species == 2)
m2c_2_derva<-subset(m2c_2,m1c_2$species == 3)
m2c_2_ixosc<-subset(m2c_2,m1c_2$species == 4)

m2c_3_ambam<-subset(m2c_3,m2c_3$species == 1)
m2c_3_ambma<-subset(m2c_3,m2c_3$species == 2)
m2c_3_derva<-subset(m2c_3,m2c_3$species == 3)
m2c_3_ixosc<-subset(m2c_3,m2c_3$species == 4)

m2c_4_ambam<-subset(m2c_4,m2c_4$species == 1)
m2c_4_ambma<-subset(m2c_4,m2c_4$species == 2)
m2c_4_derva<-subset(m2c_4,m2c_4$species == 3)
m2c_4_ixosc<-subset(m2c_4,m2c_4$species == 4)

m2c_5_ambam<-subset(m2c_5,m2c_5$species == 1)
m2c_5_ambma<-subset(m2c_5,m2c_5$species == 2)
m2c_5_derva<-subset(m2c_5,m2c_5$species == 3)
m2c_5_ixosc<-subset(m2c_5,m2c_5$species == 4)

m2c_6_ambam<-subset(m2c_6,m2c_6$species == 1)
m2c_6_ambma<-subset(m2c_6,m2c_6$species == 2)
m2c_6_derva<-subset(m2c_6,m2c_6$species == 3)
m2c_6_ixosc<-subset(m2c_6,m2c_6$species == 4)

m2c_7_ambam<-subset(m2c_7,m2c_7$species == 1)
m2c_7_ambma<-subset(m2c_7,m2c_7$species == 2)
m2c_7_derva<-subset(m2c_7,m2c_7$species == 3)
m2c_7_ixosc<-subset(m2c_7,m2c_7$species == 4)

m2c_8_ambam<-subset(m2c_8,m2c_8$species == 1)
m2c_8_ambma<-subset(m2c_8,m2c_8$species == 2)
m2c_8_derva<-subset(m2c_8,m2c_8$species == 3)
m2c_8_ixosc<-subset(m2c_8,m2c_8$species == 4)

m2c_9_ambam<-subset(m2c_9,m2c_9$species == 1)
m2c_9_ambma<-subset(m2c_9,m2c_9$species == 2)
m2c_9_derva<-subset(m2c_9,m2c_9$species == 3)
m2c_9_ixosc<-subset(m2c_9,m2c_9$species == 4)

m2c_10_ambam<-subset(m2c_10,m2c_10$species == 1)
m2c_10_ambma<-subset(m2c_10,m2c_10$species == 2)
m2c_10_derva<-subset(m2c_10,m2c_10$species == 3)
m2c_10_ixosc<-subset(m2c_10,m2c_10$species == 4)

m3c_1_ambam<-subset(m3c_1,m3c_1$species == 1)
m3c_1_ambma<-subset(m3c_1,m3c_1$species == 2)
m3c_1_derva<-subset(m3c_1,m3c_1$species == 3)
m3c_1_ixosc<-subset(m3c_1,m3c_1$species == 4)

m3c_2_ambam<-subset(m3c_2,m3c_2$species == 1)
m3c_2_ambma<-subset(m3c_2,m3c_2$species == 2)
m3c_2_derva<-subset(m3c_2,m3c_2$species == 3)
m3c_2_ixosc<-subset(m3c_2,m3c_2$species == 4)

m3c_3_ambam<-subset(m3c_3,m3c_3$species == 1)
m3c_3_ambma<-subset(m3c_3,m3c_3$species == 2)
m3c_3_derva<-subset(m3c_3,m3c_3$species == 3)
m3c_3_ixosc<-subset(m3c_3,m3c_3$species == 4)

m3c_4_ambam<-subset(m3c_4,m3c_4$species == 1)
m3c_4_ambma<-subset(m3c_4,m3c_4$species == 2)
m3c_4_derva<-subset(m3c_4,m3c_4$species == 3)
m3c_4_ixosc<-subset(m3c_4,m3c_4$species == 4)

m3c_5_ambam<-subset(m3c_5,m3c_5$species == 1)
m3c_5_ambma<-subset(m3c_5,m3c_5$species == 2)
m3c_5_derva<-subset(m3c_5,m3c_5$species == 3)
m3c_5_ixosc<-subset(m3c_5,m3c_5$species == 4)

m3c_6_ambam<-subset(m3c_6,m3c_6$species == 1)
m3c_6_ambma<-subset(m3c_6,m3c_6$species == 2)
m3c_6_derva<-subset(m3c_6,m3c_6$species == 3)
m3c_6_ixosc<-subset(m3c_6,m3c_6$species == 4)

m3c_7_ambam<-subset(m3c_7,m3c_7$species == 1)
m3c_7_ambma<-subset(m3c_7,m3c_7$species == 2)
m3c_7_derva<-subset(m3c_7,m3c_7$species == 3)
m3c_7_ixosc<-subset(m3c_7,m3c_7$species == 4)

m3c_8_ambam<-subset(m3c_8,m3c_8$species == 1)
m3c_8_ambma<-subset(m3c_8,m3c_8$species == 2)
m3c_8_derva<-subset(m3c_8,m3c_8$species == 3)
m3c_8_ixosc<-subset(m3c_8,m3c_8$species == 4)

m3c_9_ambam<-subset(m3c_9,m3c_9$species == 1)
m3c_9_ambma<-subset(m3c_9,m3c_9$species == 2)
m3c_9_derva<-subset(m3c_9,m3c_9$species == 3)
m3c_9_ixosc<-subset(m3c_9,m3c_9$species == 4)

m3c_10_ambam<-subset(m3c_10,m3c_10$species == 1)
m3c_10_ambma<-subset(m3c_10,m3c_10$species == 2)
m3c_10_derva<-subset(m3c_10,m3c_10$species == 3)
m3c_10_ixosc<-subset(m3c_10,m3c_10$species == 4)

m4c_1_ambam<-subset(m4c_1,m4c_1$species == 1)
m4c_1_ambma<-subset(m4c_1,m4c_1$species == 2)
m4c_1_derva<-subset(m4c_1,m4c_1$species == 3)
m4c_1_ixosc<-subset(m4c_1,m4c_1$species == 4)

m4c_2_ambam<-subset(m4c_2,m4c_2$species == 1)
m4c_2_ambma<-subset(m4c_2,m4c_2$species == 2)
m4c_2_derva<-subset(m4c_2,m4c_2$species == 3)
m4c_2_ixosc<-subset(m4c_2,m4c_2$species == 4)

m4c_3_ambam<-subset(m4c_3,m4c_3$species == 1)
m4c_3_ambma<-subset(m4c_3,m4c_3$species == 2)
m4c_3_derva<-subset(m4c_3,m4c_3$species == 3)
m4c_3_ixosc<-subset(m4c_3,m4c_3$species == 4)

m4c_4_ambam<-subset(m4c_4,m4c_4$species == 1)
m4c_4_ambma<-subset(m4c_4,m4c_4$species == 2)
m4c_4_derva<-subset(m4c_4,m4c_4$species == 3)
m4c_4_ixosc<-subset(m4c_4,m4c_4$species == 4)

m4c_5_ambam<-subset(m4c_5,m4c_5$species == 1)
m4c_5_ambma<-subset(m4c_5,m4c_5$species == 2)
m4c_5_derva<-subset(m4c_5,m4c_5$species == 3)
m4c_5_ixosc<-subset(m4c_5,m4c_5$species == 4)

m4c_6_ambam<-subset(m4c_6,m4c_6$species == 1)
m4c_6_ambma<-subset(m4c_6,m4c_6$species == 2)
m4c_6_derva<-subset(m4c_6,m4c_6$species == 3)
m4c_6_ixosc<-subset(m4c_6,m4c_6$species == 4)

m4c_7_ambam<-subset(m4c_7,m4c_7$species == 1)
m4c_7_ambma<-subset(m4c_7,m4c_7$species == 2)
m4c_7_derva<-subset(m4c_7,m4c_7$species == 3)
m4c_7_ixosc<-subset(m4c_7,m4c_7$species == 4)

m4c_8_ambam<-subset(m4c_8,m4c_8$species == 1)
m4c_8_ambma<-subset(m4c_8,m4c_8$species == 2)
m4c_8_derva<-subset(m4c_8,m4c_8$species == 3)
m4c_8_ixosc<-subset(m4c_8,m4c_8$species == 4)

m4c_9_ambam<-subset(m4c_9,m4c_9$species == 1)
m4c_9_ambma<-subset(m4c_9,m4c_9$species == 2)
m4c_9_derva<-subset(m4c_9,m4c_9$species == 3)
m4c_9_ixosc<-subset(m4c_9,m4c_9$species == 4)

m4c_10_ambam<-subset(m4c_10,m4c_10$species == 1)
m4c_10_ambma<-subset(m4c_10,m4c_10$species == 2)
m4c_10_derva<-subset(m4c_10,m4c_10$species == 3)
m4c_10_ixosc<-subset(m4c_10,m4c_10$species == 4)

m5c_1_ambam<-subset(m5c_1,m5c_1$species == 1)
m5c_1_ambma<-subset(m5c_1,m5c_1$species == 2)
m5c_1_derva<-subset(m5c_1,m5c_1$species == 3)
m5c_1_ixosc<-subset(m5c_1,m5c_1$species == 4)

m5c_2_ambam<-subset(m5c_2,m5c_2$species == 1)
m5c_2_ambma<-subset(m5c_2,m5c_2$species == 2)
m5c_2_derva<-subset(m5c_2,m5c_2$species == 3)
m5c_2_ixosc<-subset(m5c_2,m5c_2$species == 4)

m5c_3_ambam<-subset(m5c_3,m5c_3$species == 1)
m5c_3_ambma<-subset(m5c_3,m5c_3$species == 2)
m5c_3_derva<-subset(m5c_3,m5c_3$species == 3)
m5c_3_ixosc<-subset(m5c_3,m5c_3$species == 4)

m5c_4_ambam<-subset(m5c_4,m5c_4$species == 1)
m5c_4_ambma<-subset(m5c_4,m5c_4$species == 2)
m5c_4_derva<-subset(m5c_4,m5c_4$species == 3)
m5c_4_ixosc<-subset(m5c_4,m5c_4$species == 4)

m5c_5_ambam<-subset(m5c_5,m5c_5$species == 1)
m5c_5_ambma<-subset(m5c_5,m5c_5$species == 2)
m5c_5_derva<-subset(m5c_5,m5c_5$species == 3)
m5c_5_ixosc<-subset(m5c_5,m5c_5$species == 4)

m5c_6_ambam<-subset(m5c_6,m5c_6$species == 1)
m5c_6_ambma<-subset(m5c_6,m5c_6$species == 2)
m5c_6_derva<-subset(m5c_6,m5c_6$species == 3)
m5c_6_ixosc<-subset(m5c_6,m5c_6$species == 4)

m5c_7_ambam<-subset(m5c_7,m5c_7$species == 1)
m5c_7_ambma<-subset(m5c_7,m5c_7$species == 2)
m5c_7_derva<-subset(m5c_7,m5c_7$species == 3)
m5c_7_ixosc<-subset(m5c_7,m5c_7$species == 4)

m5c_8_ambam<-subset(m5c_8,m5c_8$species == 1)
m5c_8_ambma<-subset(m5c_8,m5c_8$species == 2)
m5c_8_derva<-subset(m5c_8,m5c_8$species == 3)
m5c_8_ixosc<-subset(m5c_8,m5c_8$species == 4)

m5c_9_ambam<-subset(m5c_9,m5c_9$species == 1)
m5c_9_ambma<-subset(m5c_9,m5c_9$species == 2)
m5c_9_derva<-subset(m5c_9,m5c_9$species == 3)
m5c_9_ixosc<-subset(m5c_9,m5c_9$species == 4)

m5c_10_ambam<-subset(m5c_10,m5c_10$species == 1)
m5c_10_ambma<-subset(m5c_10,m5c_10$species == 2)
m5c_10_derva<-subset(m5c_10,m5c_10$species == 3)
m5c_10_ixosc<-subset(m5c_10,m5c_10$species == 4)

m6c_1_ambam<-subset(m6c_1,m6c_1$species == 1)
m6c_1_ambma<-subset(m6c_1,m6c_1$species == 2)
m6c_1_derva<-subset(m6c_1,m6c_1$species == 3)
m6c_1_ixosc<-subset(m6c_1,m6c_1$species == 4)

m6c_2_ambam<-subset(m6c_2,m6c_2$species == 1)
m6c_2_ambma<-subset(m6c_2,m6c_2$species == 2)
m6c_2_derva<-subset(m6c_2,m6c_2$species == 3)
m6c_2_ixosc<-subset(m6c_2,m6c_2$species == 4)

m6c_3_ambam<-subset(m6c_3,m6c_3$species == 1)
m6c_3_ambma<-subset(m6c_3,m6c_3$species == 2)
m6c_3_derva<-subset(m6c_3,m6c_3$species == 3)
m6c_3_ixosc<-subset(m6c_3,m6c_3$species == 4)

m6c_4_ambam<-subset(m6c_4,m6c_4$species == 1)
m6c_4_ambma<-subset(m6c_4,m6c_4$species == 2)
m6c_4_derva<-subset(m6c_4,m6c_4$species == 3)
m6c_4_ixosc<-subset(m6c_4,m6c_4$species == 4)

m6c_5_ambam<-subset(m6c_5,m6c_5$species == 1)
m6c_5_ambma<-subset(m6c_5,m6c_5$species == 2)
m6c_5_derva<-subset(m6c_5,m6c_5$species == 3)
m6c_5_ixosc<-subset(m6c_5,m6c_5$species == 4)

m6c_6_ambam<-subset(m6c_6,m6c_6$species == 1)
m6c_6_ambma<-subset(m6c_6,m6c_6$species == 2)
m6c_6_derva<-subset(m6c_6,m6c_6$species == 3)
m6c_6_ixosc<-subset(m6c_6,m6c_6$species == 4)

m6c_7_ambam<-subset(m6c_7,m6c_7$species == 1)
m6c_7_ambma<-subset(m6c_7,m6c_7$species == 2)
m6c_7_derva<-subset(m6c_7,m6c_7$species == 3)
m6c_7_ixosc<-subset(m6c_7,m6c_7$species == 4)

m6c_8_ambam<-subset(m6c_8,m6c_8$species == 1)
m6c_8_ambma<-subset(m6c_8,m6c_8$species == 2)
m6c_8_derva<-subset(m6c_8,m6c_8$species == 3)
m6c_8_ixosc<-subset(m6c_8,m6c_8$species == 4)

m6c_9_ambam<-subset(m6c_9,m6c_9$species == 1)
m6c_9_ambma<-subset(m6c_9,m6c_9$species == 2)
m6c_9_derva<-subset(m6c_9,m6c_9$species == 3)
m6c_9_ixosc<-subset(m6c_9,m6c_9$species == 4)

m6c_10_ambam<-subset(m6c_10,m6c_10$species == 1)
m6c_10_ambma<-subset(m6c_10,m6c_10$species == 2)
m6c_10_derva<-subset(m6c_10,m6c_10$species == 3)
m6c_10_ixosc<-subset(m6c_10,m6c_10$species == 4)

## create a dataframe to hold correlations
r2_train<-matrix(nrow=480,ncol=5)
colnames(r2_train)<-c("model","run","sim","sp","R2")
r2_train<-data.frame(r2_train)

r2_train$model<-rep(c(1,2,3,4,5,6),80)
r2_train$run<-rep(c(rep(1,6),rep(2,6),rep(3,6),rep(4,6),rep(5,6),rep(6,6),rep(7,6),rep(8,6),rep(9,6),rep(10,6)),8)
r2_train$sim<-c(rep("A",240),rep("C",240))
r2_train$sp<-rep(c(rep("ambam",60),rep("ambma",60),rep("derva",60),rep("ixosc",60)),2)
r2_train$R2<-c(
  cor(m1a_1_ambam$ambam_1,m1a_1_ambam$pred_ambam_m1),
  cor(m2a_1_ambam$ambam_1,m2a_1_ambam$pred_ambam_m2),
  cor(m3a_1_ambam$ambam_1,m3a_1_ambam$pred_ambam_m3),
  cor(m4a_1_ambam$ambam_1,m4a_1_ambam$pred_ambam_m4),
  cor(m5a_1_ambam$ambam_1,m5a_1_ambam$pred_ambam_m5),
  cor(m6a_1_ambam$ambam_1,m6a_1_ambam$pred_ambam_m6),
  
  cor(m1a_2_ambam$ambam_2,m1a_2_ambam$pred_ambam_m1),
  cor(m2a_2_ambam$ambam_2,m2a_2_ambam$pred_ambam_m2),
  cor(m3a_2_ambam$ambam_2,m3a_2_ambam$pred_ambam_m3),
  cor(m4a_2_ambam$ambam_2,m4a_2_ambam$pred_ambam_m4),
  cor(m5a_2_ambam$ambam_2,m5a_2_ambam$pred_ambam_m5),
  cor(m6a_2_ambam$ambam_2,m6a_2_ambam$pred_ambam_m6),
  
  cor(m1a_3_ambam$ambam_3,m1a_3_ambam$pred_ambam_m1),
  cor(m2a_3_ambam$ambam_3,m2a_3_ambam$pred_ambam_m2),
  cor(m3a_3_ambam$ambam_3,m3a_3_ambam$pred_ambam_m3),
  cor(m4a_3_ambam$ambam_3,m4a_3_ambam$pred_ambam_m4),
  cor(m5a_3_ambam$ambam_3,m5a_3_ambam$pred_ambam_m5),
  cor(m6a_3_ambam$ambam_3,m6a_3_ambam$pred_ambam_m6),
  
  cor(m1a_4_ambam$ambam_4,m1a_4_ambam$pred_ambam_m1),
  cor(m2a_4_ambam$ambam_4,m2a_4_ambam$pred_ambam_m2),
  cor(m3a_4_ambam$ambam_4,m3a_4_ambam$pred_ambam_m3),
  cor(m4a_4_ambam$ambam_4,m4a_4_ambam$pred_ambam_m4),
  cor(m5a_4_ambam$ambam_4,m5a_4_ambam$pred_ambam_m5),
  cor(m6a_4_ambam$ambam_4,m6a_4_ambam$pred_ambam_m6),
  
  cor(m1a_5_ambam$ambam_5,m1a_5_ambam$pred_ambam_m1),
  cor(m2a_5_ambam$ambam_5,m2a_5_ambam$pred_ambam_m2),
  cor(m3a_5_ambam$ambam_5,m3a_5_ambam$pred_ambam_m3),
  cor(m4a_5_ambam$ambam_5,m4a_5_ambam$pred_ambam_m4),
  cor(m5a_5_ambam$ambam_5,m5a_5_ambam$pred_ambam_m5),
  cor(m6a_5_ambam$ambam_5,m6a_5_ambam$pred_ambam_m6),
  
  cor(m1a_6_ambam$ambam_6,m1a_6_ambam$pred_ambam_m1),
  cor(m2a_6_ambam$ambam_6,m2a_6_ambam$pred_ambam_m2),
  cor(m3a_6_ambam$ambam_6,m3a_6_ambam$pred_ambam_m3),
  cor(m4a_6_ambam$ambam_6,m4a_6_ambam$pred_ambam_m4),
  cor(m5a_6_ambam$ambam_6,m5a_6_ambam$pred_ambam_m5),
  cor(m6a_6_ambam$ambam_6,m6a_6_ambam$pred_ambam_m6),
  
  cor(m1a_7_ambam$ambam_7,m1a_7_ambam$pred_ambam_m1),
  cor(m2a_7_ambam$ambam_7,m2a_7_ambam$pred_ambam_m2),
  cor(m3a_7_ambam$ambam_7,m3a_7_ambam$pred_ambam_m3),
  cor(m4a_7_ambam$ambam_7,m4a_7_ambam$pred_ambam_m4),
  cor(m5a_7_ambam$ambam_7,m5a_7_ambam$pred_ambam_m5),
  cor(m6a_7_ambam$ambam_7,m6a_7_ambam$pred_ambam_m6),
  
  cor(m1a_8_ambam$ambam_8,m1a_8_ambam$pred_ambam_m1),
  cor(m2a_8_ambam$ambam_8,m2a_8_ambam$pred_ambam_m2),
  cor(m3a_8_ambam$ambam_8,m3a_8_ambam$pred_ambam_m3),
  cor(m4a_8_ambam$ambam_8,m4a_8_ambam$pred_ambam_m4),
  cor(m5a_8_ambam$ambam_8,m5a_8_ambam$pred_ambam_m5),
  cor(m6a_8_ambam$ambam_8,m6a_8_ambam$pred_ambam_m6),
  
  cor(m1a_9_ambam$ambam_9,m1a_9_ambam$pred_ambam_m1),
  cor(m2a_9_ambam$ambam_9,m2a_9_ambam$pred_ambam_m2),
  cor(m3a_9_ambam$ambam_9,m3a_9_ambam$pred_ambam_m3),
  cor(m4a_9_ambam$ambam_9,m4a_9_ambam$pred_ambam_m4),
  cor(m5a_9_ambam$ambam_9,m5a_9_ambam$pred_ambam_m5),
  cor(m6a_9_ambam$ambam_9,m6a_9_ambam$pred_ambam_m6),
  
  cor(m1a_10_ambam$ambam_10,m1a_10_ambam$pred_ambam_m1),
  cor(m2a_10_ambam$ambam_10,m2a_10_ambam$pred_ambam_m2),
  cor(m3a_10_ambam$ambam_10,m3a_10_ambam$pred_ambam_m3),
  cor(m4a_10_ambam$ambam_10,m4a_10_ambam$pred_ambam_m4),
  cor(m5a_10_ambam$ambam_10,m5a_10_ambam$pred_ambam_m5),
  cor(m6a_10_ambam$ambam_10,m6a_10_ambam$pred_ambam_m6),
  
  cor(m1a_1_ambma$ambma_1,m1a_1_ambma$pred_ambma_m1),
  cor(m2a_1_ambma$ambma_1,m2a_1_ambma$pred_ambma_m2),
  cor(m3a_1_ambma$ambma_1,m3a_1_ambma$pred_ambma_m3),
  cor(m4a_1_ambma$ambma_1,m4a_1_ambma$pred_ambma_m4),
  cor(m5a_1_ambma$ambma_1,m5a_1_ambma$pred_ambma_m5),
  cor(m6a_1_ambma$ambma_1,m6a_1_ambma$pred_ambma_m6),
  
  cor(m1a_2_ambma$ambma_2,m1a_2_ambma$pred_ambma_m1),
  cor(m2a_2_ambma$ambma_2,m2a_2_ambma$pred_ambma_m2),
  cor(m3a_2_ambma$ambma_2,m3a_2_ambma$pred_ambma_m3),
  cor(m4a_2_ambma$ambma_2,m4a_2_ambma$pred_ambma_m4),
  cor(m5a_2_ambma$ambma_2,m5a_2_ambma$pred_ambma_m5),
  cor(m6a_2_ambma$ambma_2,m6a_2_ambma$pred_ambma_m6),
  
  cor(m1a_3_ambma$ambma_3,m1a_3_ambma$pred_ambma_m1),
  cor(m2a_3_ambma$ambma_3,m2a_3_ambma$pred_ambma_m2),
  cor(m3a_3_ambma$ambma_3,m3a_3_ambma$pred_ambma_m3),
  cor(m4a_3_ambma$ambma_3,m4a_3_ambma$pred_ambma_m4),
  cor(m5a_3_ambma$ambma_3,m5a_3_ambma$pred_ambma_m5),
  cor(m6a_3_ambma$ambma_3,m6a_3_ambma$pred_ambma_m6),
  
  cor(m1a_4_ambma$ambma_4,m1a_4_ambma$pred_ambma_m1),
  cor(m2a_4_ambma$ambma_4,m2a_4_ambma$pred_ambma_m2),
  cor(m3a_4_ambma$ambma_4,m3a_4_ambma$pred_ambma_m3),
  cor(m4a_4_ambma$ambma_4,m4a_4_ambma$pred_ambma_m4),
  cor(m5a_4_ambma$ambma_4,m5a_4_ambma$pred_ambma_m5),
  cor(m6a_4_ambma$ambma_4,m6a_4_ambma$pred_ambma_m6),
  
  cor(m1a_5_ambma$ambma_5,m1a_5_ambma$pred_ambma_m1),
  cor(m2a_5_ambma$ambma_5,m2a_5_ambma$pred_ambma_m2),
  cor(m3a_5_ambma$ambma_5,m3a_5_ambma$pred_ambma_m3),
  cor(m4a_5_ambma$ambma_5,m4a_5_ambma$pred_ambma_m4),
  cor(m5a_5_ambma$ambma_5,m5a_5_ambma$pred_ambma_m5),
  cor(m6a_5_ambma$ambma_5,m6a_5_ambma$pred_ambma_m6),
  
  cor(m1a_6_ambma$ambma_6,m1a_6_ambma$pred_ambma_m1),
  cor(m2a_6_ambma$ambma_6,m2a_6_ambma$pred_ambma_m2),
  cor(m3a_6_ambma$ambma_6,m3a_6_ambma$pred_ambma_m3),
  cor(m4a_6_ambma$ambma_6,m4a_6_ambma$pred_ambma_m4),
  cor(m5a_6_ambma$ambma_6,m5a_6_ambma$pred_ambma_m5),
  cor(m6a_6_ambma$ambma_6,m6a_6_ambma$pred_ambma_m6),
  
  cor(m1a_7_ambma$ambma_7,m1a_7_ambma$pred_ambma_m1),
  cor(m2a_7_ambma$ambma_7,m2a_7_ambma$pred_ambma_m2),
  cor(m3a_7_ambma$ambma_7,m3a_7_ambma$pred_ambma_m3),
  cor(m4a_7_ambma$ambma_7,m4a_7_ambma$pred_ambma_m4),
  cor(m5a_7_ambma$ambma_7,m5a_7_ambma$pred_ambma_m5),
  cor(m6a_7_ambma$ambma_7,m6a_7_ambma$pred_ambma_m6),
  
  cor(m1a_8_ambma$ambma_8,m1a_8_ambma$pred_ambma_m1),
  cor(m2a_8_ambma$ambma_8,m2a_8_ambma$pred_ambma_m2),
  cor(m3a_8_ambma$ambma_8,m3a_8_ambma$pred_ambma_m3),
  cor(m4a_8_ambma$ambma_8,m4a_8_ambma$pred_ambma_m4),
  cor(m5a_8_ambma$ambma_8,m5a_8_ambma$pred_ambma_m5),
  cor(m6a_8_ambma$ambma_8,m6a_8_ambma$pred_ambma_m6),
  
  cor(m1a_9_ambma$ambma_9,m1a_9_ambma$pred_ambma_m1),
  cor(m2a_9_ambma$ambma_9,m2a_9_ambma$pred_ambma_m2),
  cor(m3a_9_ambma$ambma_9,m3a_9_ambma$pred_ambma_m3),
  cor(m4a_9_ambma$ambma_9,m4a_9_ambma$pred_ambma_m4),
  cor(m5a_9_ambma$ambma_9,m5a_9_ambma$pred_ambma_m5),
  cor(m6a_9_ambma$ambma_9,m6a_9_ambma$pred_ambma_m6),
  
  cor(m1a_10_ambma$ambma_10,m1a_10_ambma$pred_ambma_m1),
  cor(m2a_10_ambma$ambma_10,m2a_10_ambma$pred_ambma_m2),
  cor(m3a_10_ambma$ambma_10,m3a_10_ambma$pred_ambma_m3),
  cor(m4a_10_ambma$ambma_10,m4a_10_ambma$pred_ambma_m4),
  cor(m5a_10_ambma$ambma_10,m5a_10_ambma$pred_ambma_m5),
  cor(m6a_10_ambma$ambma_10,m6a_10_ambma$pred_ambma_m6),
  
  cor(m1a_1_derva$derva_1,m1a_1_derva$pred_derva_m1),
  cor(m2a_1_derva$derva_1,m2a_1_derva$pred_derva_m2),
  cor(m3a_1_derva$derva_1,m3a_1_derva$pred_derva_m3),
  cor(m4a_1_derva$derva_1,m4a_1_derva$pred_derva_m4),
  cor(m5a_1_derva$derva_1,m5a_1_derva$pred_derva_m5),
  cor(m6a_1_derva$derva_1,m6a_1_derva$pred_derva_m6),
  
  cor(m1a_2_derva$derva_2,m1a_2_derva$pred_derva_m1),
  cor(m2a_2_derva$derva_2,m2a_2_derva$pred_derva_m2),
  cor(m3a_2_derva$derva_2,m3a_2_derva$pred_derva_m3),
  cor(m4a_2_derva$derva_2,m4a_2_derva$pred_derva_m4),
  cor(m5a_2_derva$derva_2,m5a_2_derva$pred_derva_m5),
  cor(m6a_2_derva$derva_2,m6a_2_derva$pred_derva_m6),
  
  cor(m1a_3_derva$derva_3,m1a_3_derva$pred_derva_m1),
  cor(m2a_3_derva$derva_3,m2a_3_derva$pred_derva_m2),
  cor(m3a_3_derva$derva_3,m3a_3_derva$pred_derva_m3),
  cor(m4a_3_derva$derva_3,m4a_3_derva$pred_derva_m4),
  cor(m5a_3_derva$derva_3,m5a_3_derva$pred_derva_m5),
  cor(m6a_3_derva$derva_3,m6a_3_derva$pred_derva_m6),
  
  cor(m1a_4_derva$derva_4,m1a_4_derva$pred_derva_m1),
  cor(m2a_4_derva$derva_4,m2a_4_derva$pred_derva_m2),
  cor(m3a_4_derva$derva_4,m3a_4_derva$pred_derva_m3),
  cor(m4a_4_derva$derva_4,m4a_4_derva$pred_derva_m4),
  cor(m5a_4_derva$derva_4,m5a_4_derva$pred_derva_m5),
  cor(m6a_4_derva$derva_4,m6a_4_derva$pred_derva_m6),
  
  cor(m1a_5_derva$derva_5,m1a_5_derva$pred_derva_m1),
  cor(m2a_5_derva$derva_5,m2a_5_derva$pred_derva_m2),
  cor(m3a_5_derva$derva_5,m3a_5_derva$pred_derva_m3),
  cor(m4a_5_derva$derva_5,m4a_5_derva$pred_derva_m4),
  cor(m5a_5_derva$derva_5,m5a_5_derva$pred_derva_m5),
  cor(m6a_5_derva$derva_5,m6a_5_derva$pred_derva_m6),
  
  cor(m1a_6_derva$derva_6,m1a_6_derva$pred_derva_m1),
  cor(m2a_6_derva$derva_6,m2a_6_derva$pred_derva_m2),
  cor(m3a_6_derva$derva_6,m3a_6_derva$pred_derva_m3),
  cor(m4a_6_derva$derva_6,m4a_6_derva$pred_derva_m4),
  cor(m5a_6_derva$derva_6,m5a_6_derva$pred_derva_m5),
  cor(m6a_6_derva$derva_6,m6a_6_derva$pred_derva_m6),
  
  cor(m1a_7_derva$derva_7,m1a_7_derva$pred_derva_m1),
  cor(m2a_7_derva$derva_7,m2a_7_derva$pred_derva_m2),
  cor(m3a_7_derva$derva_7,m3a_7_derva$pred_derva_m3),
  cor(m4a_7_derva$derva_7,m4a_7_derva$pred_derva_m4),
  cor(m5a_7_derva$derva_7,m5a_7_derva$pred_derva_m5),
  cor(m6a_7_derva$derva_7,m6a_7_derva$pred_derva_m6),
  
  cor(m1a_8_derva$derva_8,m1a_8_derva$pred_derva_m1),
  cor(m2a_8_derva$derva_8,m2a_8_derva$pred_derva_m2),
  cor(m3a_8_derva$derva_8,m3a_8_derva$pred_derva_m3),
  cor(m4a_8_derva$derva_8,m4a_8_derva$pred_derva_m4),
  cor(m5a_8_derva$derva_8,m5a_8_derva$pred_derva_m5),
  cor(m6a_8_derva$derva_8,m6a_8_derva$pred_derva_m6),
  
  cor(m1a_9_derva$derva_9,m1a_9_derva$pred_derva_m1),
  cor(m2a_9_derva$derva_9,m2a_9_derva$pred_derva_m2),
  cor(m3a_9_derva$derva_9,m3a_9_derva$pred_derva_m3),
  cor(m4a_9_derva$derva_9,m4a_9_derva$pred_derva_m4),
  cor(m5a_9_derva$derva_9,m5a_9_derva$pred_derva_m5),
  cor(m6a_9_derva$derva_9,m6a_9_derva$pred_derva_m6),
  
  cor(m1a_10_derva$derva_10,m1a_10_derva$pred_derva_m1),
  cor(m2a_10_derva$derva_10,m2a_10_derva$pred_derva_m2),
  cor(m3a_10_derva$derva_10,m3a_10_derva$pred_derva_m3),
  cor(m4a_10_derva$derva_10,m4a_10_derva$pred_derva_m4),
  cor(m5a_10_derva$derva_10,m5a_10_derva$pred_derva_m5),
  cor(m6a_10_derva$derva_10,m6a_10_derva$pred_derva_m6),
  
  cor(m1a_1_ixosc$ixosc_1,m1a_1_ixosc$pred_ixosc_m1),
  cor(m2a_1_ixosc$ixosc_1,m2a_1_ixosc$pred_ixosc_m2),
  cor(m3a_1_ixosc$ixosc_1,m3a_1_ixosc$pred_ixosc_m3),
  cor(m4a_1_ixosc$ixosc_1,m4a_1_ixosc$pred_ixosc_m4),
  cor(m5a_1_ixosc$ixosc_1,m5a_1_ixosc$pred_ixosc_m5),
  cor(m6a_1_ixosc$ixosc_1,m6a_1_ixosc$pred_ixosc_m6),
  
  cor(m1a_2_ixosc$ixosc_2,m1a_2_ixosc$pred_ixosc_m1),
  cor(m2a_2_ixosc$ixosc_2,m2a_2_ixosc$pred_ixosc_m2),
  cor(m3a_2_ixosc$ixosc_2,m3a_2_ixosc$pred_ixosc_m3),
  cor(m4a_2_ixosc$ixosc_2,m4a_2_ixosc$pred_ixosc_m4),
  cor(m5a_2_ixosc$ixosc_2,m5a_2_ixosc$pred_ixosc_m5),
  cor(m6a_2_ixosc$ixosc_2,m6a_2_ixosc$pred_ixosc_m6),
  
  cor(m1a_3_ixosc$ixosc_3,m1a_3_ixosc$pred_ixosc_m1),
  cor(m2a_3_ixosc$ixosc_3,m2a_3_ixosc$pred_ixosc_m2),
  cor(m3a_3_ixosc$ixosc_3,m3a_3_ixosc$pred_ixosc_m3),
  cor(m4a_3_ixosc$ixosc_3,m4a_3_ixosc$pred_ixosc_m4),
  cor(m5a_3_ixosc$ixosc_3,m5a_3_ixosc$pred_ixosc_m5),
  cor(m6a_3_ixosc$ixosc_3,m6a_3_ixosc$pred_ixosc_m6),
  
  cor(m1a_4_ixosc$ixosc_4,m1a_4_ixosc$pred_ixosc_m1),
  cor(m2a_4_ixosc$ixosc_4,m2a_4_ixosc$pred_ixosc_m2),
  cor(m3a_4_ixosc$ixosc_4,m3a_4_ixosc$pred_ixosc_m3),
  cor(m4a_4_ixosc$ixosc_4,m4a_4_ixosc$pred_ixosc_m4),
  cor(m5a_4_ixosc$ixosc_4,m5a_4_ixosc$pred_ixosc_m5),
  cor(m6a_4_ixosc$ixosc_4,m6a_4_ixosc$pred_ixosc_m6),
  
  cor(m1a_5_ixosc$ixosc_5,m1a_5_ixosc$pred_ixosc_m1),
  cor(m2a_5_ixosc$ixosc_5,m2a_5_ixosc$pred_ixosc_m2),
  cor(m3a_5_ixosc$ixosc_5,m3a_5_ixosc$pred_ixosc_m3),
  cor(m4a_5_ixosc$ixosc_5,m4a_5_ixosc$pred_ixosc_m4),
  cor(m5a_5_ixosc$ixosc_5,m5a_5_ixosc$pred_ixosc_m5),
  cor(m6a_5_ixosc$ixosc_5,m6a_5_ixosc$pred_ixosc_m6),
  
  cor(m1a_6_ixosc$ixosc_6,m1a_6_ixosc$pred_ixosc_m1),
  cor(m2a_6_ixosc$ixosc_6,m2a_6_ixosc$pred_ixosc_m2),
  cor(m3a_6_ixosc$ixosc_6,m3a_6_ixosc$pred_ixosc_m3),
  cor(m4a_6_ixosc$ixosc_6,m4a_6_ixosc$pred_ixosc_m4),
  cor(m5a_6_ixosc$ixosc_6,m5a_6_ixosc$pred_ixosc_m5),
  cor(m6a_6_ixosc$ixosc_6,m6a_6_ixosc$pred_ixosc_m6),
  
  cor(m1a_7_ixosc$ixosc_7,m1a_7_ixosc$pred_ixosc_m1),
  cor(m2a_7_ixosc$ixosc_7,m2a_7_ixosc$pred_ixosc_m2),
  cor(m3a_7_ixosc$ixosc_7,m3a_7_ixosc$pred_ixosc_m3),
  cor(m4a_7_ixosc$ixosc_7,m4a_7_ixosc$pred_ixosc_m4),
  cor(m5a_7_ixosc$ixosc_7,m5a_7_ixosc$pred_ixosc_m5),
  cor(m6a_7_ixosc$ixosc_7,m6a_7_ixosc$pred_ixosc_m6),
  
  cor(m1a_8_ixosc$ixosc_8,m1a_8_ixosc$pred_ixosc_m1),
  cor(m2a_8_ixosc$ixosc_8,m2a_8_ixosc$pred_ixosc_m2),
  cor(m3a_8_ixosc$ixosc_8,m3a_8_ixosc$pred_ixosc_m3),
  cor(m4a_8_ixosc$ixosc_8,m4a_8_ixosc$pred_ixosc_m4),
  cor(m5a_8_ixosc$ixosc_8,m5a_8_ixosc$pred_ixosc_m5),
  cor(m6a_8_ixosc$ixosc_8,m6a_8_ixosc$pred_ixosc_m6),
  
  cor(m1a_9_ixosc$ixosc_9,m1a_9_ixosc$pred_ixosc_m1),
  cor(m2a_9_ixosc$ixosc_9,m2a_9_ixosc$pred_ixosc_m2),
  cor(m3a_9_ixosc$ixosc_9,m3a_9_ixosc$pred_ixosc_m3),
  cor(m4a_9_ixosc$ixosc_9,m4a_9_ixosc$pred_ixosc_m4),
  cor(m5a_9_ixosc$ixosc_9,m5a_9_ixosc$pred_ixosc_m5),
  cor(m6a_9_ixosc$ixosc_9,m6a_9_ixosc$pred_ixosc_m6),
  
  cor(m1a_10_ixosc$ixosc_10,m1a_10_ixosc$pred_ixosc_m1),
  cor(m2a_10_ixosc$ixosc_10,m2a_10_ixosc$pred_ixosc_m2),
  cor(m3a_10_ixosc$ixosc_10,m3a_10_ixosc$pred_ixosc_m3),
  cor(m4a_10_ixosc$ixosc_10,m4a_10_ixosc$pred_ixosc_m4),
  cor(m5a_10_ixosc$ixosc_10,m5a_10_ixosc$pred_ixosc_m5),
  cor(m6a_10_ixosc$ixosc_10,m6a_10_ixosc$pred_ixosc_m6),
  
  cor(m1b_1_ambam$ambam_1,m1b_1_ambam$pred_ambam_m1),
  cor(m2b_1_ambam$ambam_1,m2b_1_ambam$pred_ambam_m2),
  cor(m3b_1_ambam$ambam_1,m3b_1_ambam$pred_ambam_m3),
  cor(m4b_1_ambam$ambam_1,m4b_1_ambam$pred_ambam_m4),
  cor(m5b_1_ambam$ambam_1,m5b_1_ambam$pred_ambam_m5),
  cor(m6b_1_ambam$ambam_1,m6b_1_ambam$pred_ambam_m6),
  
  cor(m1b_2_ambam$ambam_2,m1b_2_ambam$pred_ambam_m1),
  cor(m2b_2_ambam$ambam_2,m2b_2_ambam$pred_ambam_m2),
  cor(m3b_2_ambam$ambam_2,m3b_2_ambam$pred_ambam_m3),
  cor(m4b_2_ambam$ambam_2,m4b_2_ambam$pred_ambam_m4),
  cor(m5b_2_ambam$ambam_2,m5b_2_ambam$pred_ambam_m5),
  cor(m6b_2_ambam$ambam_2,m6b_2_ambam$pred_ambam_m6),
  
  cor(m1b_3_ambam$ambam_3,m1b_3_ambam$pred_ambam_m1),
  cor(m2b_3_ambam$ambam_3,m2b_3_ambam$pred_ambam_m2),
  cor(m3b_3_ambam$ambam_3,m3b_3_ambam$pred_ambam_m3),
  cor(m4b_3_ambam$ambam_3,m4b_3_ambam$pred_ambam_m4),
  cor(m5b_3_ambam$ambam_3,m5b_3_ambam$pred_ambam_m5),
  cor(m6b_3_ambam$ambam_3,m6b_3_ambam$pred_ambam_m6),
  
  cor(m1b_4_ambam$ambam_4,m1b_4_ambam$pred_ambam_m1),
  cor(m2b_4_ambam$ambam_4,m2b_4_ambam$pred_ambam_m2),
  cor(m3b_4_ambam$ambam_4,m3b_4_ambam$pred_ambam_m3),
  cor(m4b_4_ambam$ambam_4,m4b_4_ambam$pred_ambam_m4),
  cor(m5b_4_ambam$ambam_4,m5b_4_ambam$pred_ambam_m5),
  cor(m6b_4_ambam$ambam_4,m6b_4_ambam$pred_ambam_m6),
  
  cor(m1b_5_ambam$ambam_5,m1b_5_ambam$pred_ambam_m1),
  cor(m2b_5_ambam$ambam_5,m2b_5_ambam$pred_ambam_m2),
  cor(m3b_5_ambam$ambam_5,m3b_5_ambam$pred_ambam_m3),
  cor(m4b_5_ambam$ambam_5,m4b_5_ambam$pred_ambam_m4),
  cor(m5b_5_ambam$ambam_5,m5b_5_ambam$pred_ambam_m5),
  cor(m6b_5_ambam$ambam_5,m6b_5_ambam$pred_ambam_m6),
  
  cor(m1b_6_ambam$ambam_6,m1b_6_ambam$pred_ambam_m1),
  cor(m2b_6_ambam$ambam_6,m2b_6_ambam$pred_ambam_m2),
  cor(m3b_6_ambam$ambam_6,m3b_6_ambam$pred_ambam_m3),
  cor(m4b_6_ambam$ambam_6,m4b_6_ambam$pred_ambam_m4),
  cor(m5b_6_ambam$ambam_6,m5b_6_ambam$pred_ambam_m5),
  cor(m6b_6_ambam$ambam_6,m6b_6_ambam$pred_ambam_m6),
  
  cor(m1b_7_ambam$ambam_7,m1b_7_ambam$pred_ambam_m1),
  cor(m2b_7_ambam$ambam_7,m2b_7_ambam$pred_ambam_m2),
  cor(m3b_7_ambam$ambam_7,m3b_7_ambam$pred_ambam_m3),
  cor(m4b_7_ambam$ambam_7,m4b_7_ambam$pred_ambam_m4),
  cor(m5b_7_ambam$ambam_7,m5b_7_ambam$pred_ambam_m5),
  cor(m6b_7_ambam$ambam_7,m6b_7_ambam$pred_ambam_m6),
  
  cor(m1b_8_ambam$ambam_8,m1b_8_ambam$pred_ambam_m1),
  cor(m2b_8_ambam$ambam_8,m2b_8_ambam$pred_ambam_m2),
  cor(m3b_8_ambam$ambam_8,m3b_8_ambam$pred_ambam_m3),
  cor(m4b_8_ambam$ambam_8,m4b_8_ambam$pred_ambam_m4),
  cor(m5b_8_ambam$ambam_8,m5b_8_ambam$pred_ambam_m5),
  cor(m6b_8_ambam$ambam_8,m6b_8_ambam$pred_ambam_m6),
  
  cor(m1b_9_ambam$ambam_9,m1b_9_ambam$pred_ambam_m1),
  cor(m2b_9_ambam$ambam_9,m2b_9_ambam$pred_ambam_m2),
  cor(m3b_9_ambam$ambam_9,m3b_9_ambam$pred_ambam_m3),
  cor(m4b_9_ambam$ambam_9,m4b_9_ambam$pred_ambam_m4),
  cor(m5b_9_ambam$ambam_9,m5b_9_ambam$pred_ambam_m5),
  cor(m6b_9_ambam$ambam_9,m6b_9_ambam$pred_ambam_m6),
  
  cor(m1b_10_ambam$ambam_10,m1b_10_ambam$pred_ambam_m1),
  cor(m2b_10_ambam$ambam_10,m2b_10_ambam$pred_ambam_m2),
  cor(m3b_10_ambam$ambam_10,m3b_10_ambam$pred_ambam_m3),
  cor(m4b_10_ambam$ambam_10,m4b_10_ambam$pred_ambam_m4),
  cor(m5b_10_ambam$ambam_10,m5b_10_ambam$pred_ambam_m5),
  cor(m6b_10_ambam$ambam_10,m6b_10_ambam$pred_ambam_m6),
  
  cor(m1b_1_ambma$ambma_1,m1b_1_ambma$pred_ambma_m1),
  cor(m2b_1_ambma$ambma_1,m2b_1_ambma$pred_ambma_m2),
  cor(m3b_1_ambma$ambma_1,m3b_1_ambma$pred_ambma_m3),
  cor(m4b_1_ambma$ambma_1,m4b_1_ambma$pred_ambma_m4),
  cor(m5b_1_ambma$ambma_1,m5b_1_ambma$pred_ambma_m5),
  cor(m6b_1_ambma$ambma_1,m6b_1_ambma$pred_ambma_m6),
  
  cor(m1b_2_ambma$ambma_2,m1b_2_ambma$pred_ambma_m1),
  cor(m2b_2_ambma$ambma_2,m2b_2_ambma$pred_ambma_m2),
  cor(m3b_2_ambma$ambma_2,m3b_2_ambma$pred_ambma_m3),
  cor(m4b_2_ambma$ambma_2,m4b_2_ambma$pred_ambma_m4),
  cor(m5b_2_ambma$ambma_2,m5b_2_ambma$pred_ambma_m5),
  cor(m6b_2_ambma$ambma_2,m6b_2_ambma$pred_ambma_m6),
  
  cor(m1b_3_ambma$ambma_3,m1b_3_ambma$pred_ambma_m1),
  cor(m2b_3_ambma$ambma_3,m2b_3_ambma$pred_ambma_m2),
  cor(m3b_3_ambma$ambma_3,m3b_3_ambma$pred_ambma_m3),
  cor(m4b_3_ambma$ambma_3,m4b_3_ambma$pred_ambma_m4),
  cor(m5b_3_ambma$ambma_3,m5b_3_ambma$pred_ambma_m5),
  cor(m6b_3_ambma$ambma_3,m6b_3_ambma$pred_ambma_m6),
  
  cor(m1b_4_ambma$ambma_4,m1b_4_ambma$pred_ambma_m1),
  cor(m2b_4_ambma$ambma_4,m2b_4_ambma$pred_ambma_m2),
  cor(m3b_4_ambma$ambma_4,m3b_4_ambma$pred_ambma_m3),
  cor(m4b_4_ambma$ambma_4,m4b_4_ambma$pred_ambma_m4),
  cor(m5b_4_ambma$ambma_4,m5b_4_ambma$pred_ambma_m5),
  cor(m6b_4_ambma$ambma_4,m6b_4_ambma$pred_ambma_m6),
  
  cor(m1b_5_ambma$ambma_5,m1b_5_ambma$pred_ambma_m1),
  cor(m2b_5_ambma$ambma_5,m2b_5_ambma$pred_ambma_m2),
  cor(m3b_5_ambma$ambma_5,m3b_5_ambma$pred_ambma_m3),
  cor(m4b_5_ambma$ambma_5,m4b_5_ambma$pred_ambma_m4),
  cor(m5b_5_ambma$ambma_5,m5b_5_ambma$pred_ambma_m5),
  cor(m6b_5_ambma$ambma_5,m6b_5_ambma$pred_ambma_m6),
  
  cor(m1b_6_ambma$ambma_6,m1b_6_ambma$pred_ambma_m1),
  cor(m2b_6_ambma$ambma_6,m2b_6_ambma$pred_ambma_m2),
  cor(m3b_6_ambma$ambma_6,m3b_6_ambma$pred_ambma_m3),
  cor(m4b_6_ambma$ambma_6,m4b_6_ambma$pred_ambma_m4),
  cor(m5b_6_ambma$ambma_6,m5b_6_ambma$pred_ambma_m5),
  cor(m6b_6_ambma$ambma_6,m6b_6_ambma$pred_ambma_m6),
  
  cor(m1b_7_ambma$ambma_7,m1b_7_ambma$pred_ambma_m1),
  cor(m2b_7_ambma$ambma_7,m2b_7_ambma$pred_ambma_m2),
  cor(m3b_7_ambma$ambma_7,m3b_7_ambma$pred_ambma_m3),
  cor(m4b_7_ambma$ambma_7,m4b_7_ambma$pred_ambma_m4),
  cor(m5b_7_ambma$ambma_7,m5b_7_ambma$pred_ambma_m5),
  cor(m6b_7_ambma$ambma_7,m6b_7_ambma$pred_ambma_m6),
  
  cor(m1b_8_ambma$ambma_8,m1b_8_ambma$pred_ambma_m1),
  cor(m2b_8_ambma$ambma_8,m2b_8_ambma$pred_ambma_m2),
  cor(m3b_8_ambma$ambma_8,m3b_8_ambma$pred_ambma_m3),
  cor(m4b_8_ambma$ambma_8,m4b_8_ambma$pred_ambma_m4),
  cor(m5b_8_ambma$ambma_8,m5b_8_ambma$pred_ambma_m5),
  cor(m6b_8_ambma$ambma_8,m6b_8_ambma$pred_ambma_m6),
  
  cor(m1b_9_ambma$ambma_9,m1b_9_ambma$pred_ambma_m1),
  cor(m2b_9_ambma$ambma_9,m2b_9_ambma$pred_ambma_m2),
  cor(m3b_9_ambma$ambma_9,m3b_9_ambma$pred_ambma_m3),
  cor(m4b_9_ambma$ambma_9,m4b_9_ambma$pred_ambma_m4),
  cor(m5b_9_ambma$ambma_9,m5b_9_ambma$pred_ambma_m5),
  cor(m6b_9_ambma$ambma_9,m6b_9_ambma$pred_ambma_m6),
  
  cor(m1b_10_ambma$ambma_10,m1b_10_ambma$pred_ambma_m1),
  cor(m2b_10_ambma$ambma_10,m2b_10_ambma$pred_ambma_m2),
  cor(m3b_10_ambma$ambma_10,m3b_10_ambma$pred_ambma_m3),
  cor(m4b_10_ambma$ambma_10,m4b_10_ambma$pred_ambma_m4),
  cor(m5b_10_ambma$ambma_10,m5b_10_ambma$pred_ambma_m5),
  cor(m6b_10_ambma$ambma_10,m6b_10_ambma$pred_ambma_m6),
  
  cor(m1b_1_derva$derva_1,m1b_1_derva$pred_derva_m1),
  cor(m2b_1_derva$derva_1,m2b_1_derva$pred_derva_m2),
  cor(m3b_1_derva$derva_1,m3b_1_derva$pred_derva_m3),
  cor(m4b_1_derva$derva_1,m4b_1_derva$pred_derva_m4),
  cor(m5b_1_derva$derva_1,m5b_1_derva$pred_derva_m5),
  cor(m6b_1_derva$derva_1,m6b_1_derva$pred_derva_m6),
  
  cor(m1b_2_derva$derva_2,m1b_2_derva$pred_derva_m1),
  cor(m2b_2_derva$derva_2,m2b_2_derva$pred_derva_m2),
  cor(m3b_2_derva$derva_2,m3b_2_derva$pred_derva_m3),
  cor(m4b_2_derva$derva_2,m4b_2_derva$pred_derva_m4),
  cor(m5b_2_derva$derva_2,m5b_2_derva$pred_derva_m5),
  cor(m6b_2_derva$derva_2,m6b_2_derva$pred_derva_m6),
  
  cor(m1b_3_derva$derva_3,m1b_3_derva$pred_derva_m1),
  cor(m2b_3_derva$derva_3,m2b_3_derva$pred_derva_m2),
  cor(m3b_3_derva$derva_3,m3b_3_derva$pred_derva_m3),
  cor(m4b_3_derva$derva_3,m4b_3_derva$pred_derva_m4),
  cor(m5b_3_derva$derva_3,m5b_3_derva$pred_derva_m5),
  cor(m6b_3_derva$derva_3,m6b_3_derva$pred_derva_m6),
  
  cor(m1b_4_derva$derva_4,m1b_4_derva$pred_derva_m1),
  cor(m2b_4_derva$derva_4,m2b_4_derva$pred_derva_m2),
  cor(m3b_4_derva$derva_4,m3b_4_derva$pred_derva_m3),
  cor(m4b_4_derva$derva_4,m4b_4_derva$pred_derva_m4),
  cor(m5b_4_derva$derva_4,m5b_4_derva$pred_derva_m5),
  cor(m6b_4_derva$derva_4,m6b_4_derva$pred_derva_m6),
  
  cor(m1b_5_derva$derva_5,m1b_5_derva$pred_derva_m1),
  cor(m2b_5_derva$derva_5,m2b_5_derva$pred_derva_m2),
  cor(m3b_5_derva$derva_5,m3b_5_derva$pred_derva_m3),
  cor(m4b_5_derva$derva_5,m4b_5_derva$pred_derva_m4),
  cor(m5b_5_derva$derva_5,m5b_5_derva$pred_derva_m5),
  cor(m6b_5_derva$derva_5,m6b_5_derva$pred_derva_m6),
  
  cor(m1b_6_derva$derva_6,m1b_6_derva$pred_derva_m1),
  cor(m2b_6_derva$derva_6,m2b_6_derva$pred_derva_m2),
  cor(m3b_6_derva$derva_6,m3b_6_derva$pred_derva_m3),
  cor(m4b_6_derva$derva_6,m4b_6_derva$pred_derva_m4),
  cor(m5b_6_derva$derva_6,m5b_6_derva$pred_derva_m5),
  cor(m6b_6_derva$derva_6,m6b_6_derva$pred_derva_m6),
  
  cor(m1b_7_derva$derva_7,m1b_7_derva$pred_derva_m1),
  cor(m2b_7_derva$derva_7,m2b_7_derva$pred_derva_m2),
  cor(m3b_7_derva$derva_7,m3b_7_derva$pred_derva_m3),
  cor(m4b_7_derva$derva_7,m4b_7_derva$pred_derva_m4),
  cor(m5b_7_derva$derva_7,m5b_7_derva$pred_derva_m5),
  cor(m6b_7_derva$derva_7,m6b_7_derva$pred_derva_m6),
  
  cor(m1b_8_derva$derva_8,m1b_8_derva$pred_derva_m1),
  cor(m2b_8_derva$derva_8,m2b_8_derva$pred_derva_m2),
  cor(m3b_8_derva$derva_8,m3b_8_derva$pred_derva_m3),
  cor(m4b_8_derva$derva_8,m4b_8_derva$pred_derva_m4),
  cor(m5b_8_derva$derva_8,m5b_8_derva$pred_derva_m5),
  cor(m6b_8_derva$derva_8,m6b_8_derva$pred_derva_m6),
  
  cor(m1b_9_derva$derva_9,m1b_9_derva$pred_derva_m1),
  cor(m2b_9_derva$derva_9,m2b_9_derva$pred_derva_m2),
  cor(m3b_9_derva$derva_9,m3b_9_derva$pred_derva_m3),
  cor(m4b_9_derva$derva_9,m4b_9_derva$pred_derva_m4),
  cor(m5b_9_derva$derva_9,m5b_9_derva$pred_derva_m5),
  cor(m6b_9_derva$derva_9,m6b_9_derva$pred_derva_m6),
  
  cor(m1b_10_derva$derva_10,m1b_10_derva$pred_derva_m1),
  cor(m2b_10_derva$derva_10,m2b_10_derva$pred_derva_m2),
  cor(m3b_10_derva$derva_10,m3b_10_derva$pred_derva_m3),
  cor(m4b_10_derva$derva_10,m4b_10_derva$pred_derva_m4),
  cor(m5b_10_derva$derva_10,m5b_10_derva$pred_derva_m5),
  cor(m6b_10_derva$derva_10,m6b_10_derva$pred_derva_m6),
  
  cor(m1b_1_ixosc$ixosc_1,m1b_1_ixosc$pred_ixosc_m1),
  cor(m2b_1_ixosc$ixosc_1,m2b_1_ixosc$pred_ixosc_m2),
  cor(m3b_1_ixosc$ixosc_1,m3b_1_ixosc$pred_ixosc_m3),
  cor(m4b_1_ixosc$ixosc_1,m4b_1_ixosc$pred_ixosc_m4),
  cor(m5b_1_ixosc$ixosc_1,m5b_1_ixosc$pred_ixosc_m5),
  cor(m6b_1_ixosc$ixosc_1,m6b_1_ixosc$pred_ixosc_m6),
  
  cor(m1b_2_ixosc$ixosc_2,m1b_2_ixosc$pred_ixosc_m1),
  cor(m2b_2_ixosc$ixosc_2,m2b_2_ixosc$pred_ixosc_m2),
  cor(m3b_2_ixosc$ixosc_2,m3b_2_ixosc$pred_ixosc_m3),
  cor(m4b_2_ixosc$ixosc_2,m4b_2_ixosc$pred_ixosc_m4),
  cor(m5b_2_ixosc$ixosc_2,m5b_2_ixosc$pred_ixosc_m5),
  cor(m6b_2_ixosc$ixosc_2,m6b_2_ixosc$pred_ixosc_m6),
  
  cor(m1b_3_ixosc$ixosc_3,m1b_3_ixosc$pred_ixosc_m1),
  cor(m2b_3_ixosc$ixosc_3,m2b_3_ixosc$pred_ixosc_m2),
  cor(m3b_3_ixosc$ixosc_3,m3b_3_ixosc$pred_ixosc_m3),
  cor(m4b_3_ixosc$ixosc_3,m4b_3_ixosc$pred_ixosc_m4),
  cor(m5b_3_ixosc$ixosc_3,m5b_3_ixosc$pred_ixosc_m5),
  cor(m6b_3_ixosc$ixosc_3,m6b_3_ixosc$pred_ixosc_m6),
  
  cor(m1b_4_ixosc$ixosc_4,m1b_4_ixosc$pred_ixosc_m1),
  cor(m2b_4_ixosc$ixosc_4,m2b_4_ixosc$pred_ixosc_m2),
  cor(m3b_4_ixosc$ixosc_4,m3b_4_ixosc$pred_ixosc_m3),
  cor(m4b_4_ixosc$ixosc_4,m4b_4_ixosc$pred_ixosc_m4),
  cor(m5b_4_ixosc$ixosc_4,m5b_4_ixosc$pred_ixosc_m5),
  cor(m6b_4_ixosc$ixosc_4,m6b_4_ixosc$pred_ixosc_m6),
  
  cor(m1b_5_ixosc$ixosc_5,m1b_5_ixosc$pred_ixosc_m1),
  cor(m2b_5_ixosc$ixosc_5,m2b_5_ixosc$pred_ixosc_m2),
  cor(m3b_5_ixosc$ixosc_5,m3b_5_ixosc$pred_ixosc_m3),
  cor(m4b_5_ixosc$ixosc_5,m4b_5_ixosc$pred_ixosc_m4),
  cor(m5b_5_ixosc$ixosc_5,m5b_5_ixosc$pred_ixosc_m5),
  cor(m6b_5_ixosc$ixosc_5,m6b_5_ixosc$pred_ixosc_m6),
  
  cor(m1b_6_ixosc$ixosc_6,m1b_6_ixosc$pred_ixosc_m1),
  cor(m2b_6_ixosc$ixosc_6,m2b_6_ixosc$pred_ixosc_m2),
  cor(m3b_6_ixosc$ixosc_6,m3b_6_ixosc$pred_ixosc_m3),
  cor(m4b_6_ixosc$ixosc_6,m4b_6_ixosc$pred_ixosc_m4),
  cor(m5b_6_ixosc$ixosc_6,m5b_6_ixosc$pred_ixosc_m5),
  cor(m6b_6_ixosc$ixosc_6,m6b_6_ixosc$pred_ixosc_m6),
  
  cor(m1b_7_ixosc$ixosc_7,m1b_7_ixosc$pred_ixosc_m1),
  cor(m2b_7_ixosc$ixosc_7,m2b_7_ixosc$pred_ixosc_m2),
  cor(m3b_7_ixosc$ixosc_7,m3b_7_ixosc$pred_ixosc_m3),
  cor(m4b_7_ixosc$ixosc_7,m4b_7_ixosc$pred_ixosc_m4),
  cor(m5b_7_ixosc$ixosc_7,m5b_7_ixosc$pred_ixosc_m5),
  cor(m6b_7_ixosc$ixosc_7,m6b_7_ixosc$pred_ixosc_m6),
  
  cor(m1b_8_ixosc$ixosc_8,m1b_8_ixosc$pred_ixosc_m1),
  cor(m2b_8_ixosc$ixosc_8,m2b_8_ixosc$pred_ixosc_m2),
  cor(m3b_8_ixosc$ixosc_8,m3b_8_ixosc$pred_ixosc_m3),
  cor(m4b_8_ixosc$ixosc_8,m4b_8_ixosc$pred_ixosc_m4),
  cor(m5b_8_ixosc$ixosc_8,m5b_8_ixosc$pred_ixosc_m5),
  cor(m6b_8_ixosc$ixosc_8,m6b_8_ixosc$pred_ixosc_m6),
  
  cor(m1b_9_ixosc$ixosc_9,m1b_9_ixosc$pred_ixosc_m1),
  cor(m2b_9_ixosc$ixosc_9,m2b_9_ixosc$pred_ixosc_m2),
  cor(m3b_9_ixosc$ixosc_9,m3b_9_ixosc$pred_ixosc_m3),
  cor(m4b_9_ixosc$ixosc_9,m4b_9_ixosc$pred_ixosc_m4),
  cor(m5b_9_ixosc$ixosc_9,m5b_9_ixosc$pred_ixosc_m5),
  cor(m6b_9_ixosc$ixosc_9,m6b_9_ixosc$pred_ixosc_m6),
  
  cor(m1b_10_ixosc$ixosc_10,m1b_10_ixosc$pred_ixosc_m1),
  cor(m2b_10_ixosc$ixosc_10,m2b_10_ixosc$pred_ixosc_m2),
  cor(m3b_10_ixosc$ixosc_10,m3b_10_ixosc$pred_ixosc_m3),
  cor(m4b_10_ixosc$ixosc_10,m4b_10_ixosc$pred_ixosc_m4),
  cor(m5b_10_ixosc$ixosc_10,m5b_10_ixosc$pred_ixosc_m5),
  cor(m6b_10_ixosc$ixosc_10,m6b_10_ixosc$pred_ixosc_m6),
  
  cor(m1c_1_ambam$ambam_1,m1c_1_ambam$pred_ambam_m1),
  cor(m2c_1_ambam$ambam_1,m2c_1_ambam$pred_ambam_m2),
  cor(m3c_1_ambam$ambam_1,m3c_1_ambam$pred_ambam_m3),
  cor(m4c_1_ambam$ambam_1,m4c_1_ambam$pred_ambam_m4),
  cor(m5c_1_ambam$ambam_1,m5c_1_ambam$pred_ambam_m5),
  cor(m6c_1_ambam$ambam_1,m6c_1_ambam$pred_ambam_m6),
  
  cor(m1c_2_ambam$ambam_2,m1c_2_ambam$pred_ambam_m1),
  cor(m2c_2_ambam$ambam_2,m2c_2_ambam$pred_ambam_m2),
  cor(m3c_2_ambam$ambam_2,m3c_2_ambam$pred_ambam_m3),
  cor(m4c_2_ambam$ambam_2,m4c_2_ambam$pred_ambam_m4),
  cor(m5c_2_ambam$ambam_2,m5c_2_ambam$pred_ambam_m5),
  cor(m6c_2_ambam$ambam_2,m6c_2_ambam$pred_ambam_m6),
  
  cor(m1c_3_ambam$ambam_3,m1c_3_ambam$pred_ambam_m1),
  cor(m2c_3_ambam$ambam_3,m2c_3_ambam$pred_ambam_m2),
  cor(m3c_3_ambam$ambam_3,m3c_3_ambam$pred_ambam_m3),
  cor(m4c_3_ambam$ambam_3,m4c_3_ambam$pred_ambam_m4),
  cor(m5c_3_ambam$ambam_3,m5c_3_ambam$pred_ambam_m5),
  cor(m6c_3_ambam$ambam_3,m6c_3_ambam$pred_ambam_m6),
  
  cor(m1c_4_ambam$ambam_4,m1c_4_ambam$pred_ambam_m1),
  cor(m2c_4_ambam$ambam_4,m2c_4_ambam$pred_ambam_m2),
  cor(m3c_4_ambam$ambam_4,m3c_4_ambam$pred_ambam_m3),
  cor(m4c_4_ambam$ambam_4,m4c_4_ambam$pred_ambam_m4),
  cor(m5c_4_ambam$ambam_4,m5c_4_ambam$pred_ambam_m5),
  cor(m6c_4_ambam$ambam_4,m6c_4_ambam$pred_ambam_m6),
  
  cor(m1c_5_ambam$ambam_5,m1c_5_ambam$pred_ambam_m1),
  cor(m2c_5_ambam$ambam_5,m2c_5_ambam$pred_ambam_m2),
  cor(m3c_5_ambam$ambam_5,m3c_5_ambam$pred_ambam_m3),
  cor(m4c_5_ambam$ambam_5,m4c_5_ambam$pred_ambam_m4),
  cor(m5c_5_ambam$ambam_5,m5c_5_ambam$pred_ambam_m5),
  cor(m6c_5_ambam$ambam_5,m6c_5_ambam$pred_ambam_m6),
  
  cor(m1c_6_ambam$ambam_6,m1c_6_ambam$pred_ambam_m1),
  cor(m2c_6_ambam$ambam_6,m2c_6_ambam$pred_ambam_m2),
  cor(m3c_6_ambam$ambam_6,m3c_6_ambam$pred_ambam_m3),
  cor(m4c_6_ambam$ambam_6,m4c_6_ambam$pred_ambam_m4),
  cor(m5c_6_ambam$ambam_6,m5c_6_ambam$pred_ambam_m5),
  cor(m6c_6_ambam$ambam_6,m6c_6_ambam$pred_ambam_m6),
  
  cor(m1c_7_ambam$ambam_7,m1c_7_ambam$pred_ambam_m1),
  cor(m2c_7_ambam$ambam_7,m2c_7_ambam$pred_ambam_m2),
  cor(m3c_7_ambam$ambam_7,m3c_7_ambam$pred_ambam_m3),
  cor(m4c_7_ambam$ambam_7,m4c_7_ambam$pred_ambam_m4),
  cor(m5c_7_ambam$ambam_7,m5c_7_ambam$pred_ambam_m5),
  cor(m6c_7_ambam$ambam_7,m6c_7_ambam$pred_ambam_m6),
  
  cor(m1c_8_ambam$ambam_8,m1c_8_ambam$pred_ambam_m1),
  cor(m2c_8_ambam$ambam_8,m2c_8_ambam$pred_ambam_m2),
  cor(m3c_8_ambam$ambam_8,m3c_8_ambam$pred_ambam_m3),
  cor(m4c_8_ambam$ambam_8,m4c_8_ambam$pred_ambam_m4),
  cor(m5c_8_ambam$ambam_8,m5c_8_ambam$pred_ambam_m5),
  cor(m6c_8_ambam$ambam_8,m6c_8_ambam$pred_ambam_m6),
  
  cor(m1c_9_ambam$ambam_9,m1c_9_ambam$pred_ambam_m1),
  cor(m2c_9_ambam$ambam_9,m2c_9_ambam$pred_ambam_m2),
  cor(m3c_9_ambam$ambam_9,m3c_9_ambam$pred_ambam_m3),
  cor(m4c_9_ambam$ambam_9,m4c_9_ambam$pred_ambam_m4),
  cor(m5c_9_ambam$ambam_9,m5c_9_ambam$pred_ambam_m5),
  cor(m6c_9_ambam$ambam_9,m6c_9_ambam$pred_ambam_m6),
  
  cor(m1c_10_ambam$ambam_10,m1c_10_ambam$pred_ambam_m1),
  cor(m2c_10_ambam$ambam_10,m2c_10_ambam$pred_ambam_m2),
  cor(m3c_10_ambam$ambam_10,m3c_10_ambam$pred_ambam_m3),
  cor(m4c_10_ambam$ambam_10,m4c_10_ambam$pred_ambam_m4),
  cor(m5c_10_ambam$ambam_10,m5c_10_ambam$pred_ambam_m5),
  cor(m6c_10_ambam$ambam_10,m6c_10_ambam$pred_ambam_m6),
  
  cor(m1c_1_ambma$ambma_1,m1c_1_ambma$pred_ambma_m1),
  cor(m2c_1_ambma$ambma_1,m2c_1_ambma$pred_ambma_m2),
  cor(m3c_1_ambma$ambma_1,m3c_1_ambma$pred_ambma_m3),
  cor(m4c_1_ambma$ambma_1,m4c_1_ambma$pred_ambma_m4),
  cor(m5c_1_ambma$ambma_1,m5c_1_ambma$pred_ambma_m5),
  cor(m6c_1_ambma$ambma_1,m6c_1_ambma$pred_ambma_m6),
  
  cor(m1c_2_ambma$ambma_2,m1c_2_ambma$pred_ambma_m1),
  cor(m2c_2_ambma$ambma_2,m2c_2_ambma$pred_ambma_m2),
  cor(m3c_2_ambma$ambma_2,m3c_2_ambma$pred_ambma_m3),
  cor(m4c_2_ambma$ambma_2,m4c_2_ambma$pred_ambma_m4),
  cor(m5c_2_ambma$ambma_2,m5c_2_ambma$pred_ambma_m5),
  cor(m6c_2_ambma$ambma_2,m6c_2_ambma$pred_ambma_m6),
  
  cor(m1c_3_ambma$ambma_3,m1c_3_ambma$pred_ambma_m1),
  cor(m2c_3_ambma$ambma_3,m2c_3_ambma$pred_ambma_m2),
  cor(m3c_3_ambma$ambma_3,m3c_3_ambma$pred_ambma_m3),
  cor(m4c_3_ambma$ambma_3,m4c_3_ambma$pred_ambma_m4),
  cor(m5c_3_ambma$ambma_3,m5c_3_ambma$pred_ambma_m5),
  cor(m6c_3_ambma$ambma_3,m6c_3_ambma$pred_ambma_m6),
  
  cor(m1c_4_ambma$ambma_4,m1c_4_ambma$pred_ambma_m1),
  cor(m2c_4_ambma$ambma_4,m2c_4_ambma$pred_ambma_m2),
  cor(m3c_4_ambma$ambma_4,m3c_4_ambma$pred_ambma_m3),
  cor(m4c_4_ambma$ambma_4,m4c_4_ambma$pred_ambma_m4),
  cor(m5c_4_ambma$ambma_4,m5c_4_ambma$pred_ambma_m5),
  cor(m6c_4_ambma$ambma_4,m6c_4_ambma$pred_ambma_m6),
  
  cor(m1c_5_ambma$ambma_5,m1c_5_ambma$pred_ambma_m1),
  cor(m2c_5_ambma$ambma_5,m2c_5_ambma$pred_ambma_m2),
  cor(m3c_5_ambma$ambma_5,m3c_5_ambma$pred_ambma_m3),
  cor(m4c_5_ambma$ambma_5,m4c_5_ambma$pred_ambma_m4),
  cor(m5c_5_ambma$ambma_5,m5c_5_ambma$pred_ambma_m5),
  cor(m6c_5_ambma$ambma_5,m6c_5_ambma$pred_ambma_m6),
  
  cor(m1c_6_ambma$ambma_6,m1c_6_ambma$pred_ambma_m1),
  cor(m2c_6_ambma$ambma_6,m2c_6_ambma$pred_ambma_m2),
  cor(m3c_6_ambma$ambma_6,m3c_6_ambma$pred_ambma_m3),
  cor(m4c_6_ambma$ambma_6,m4c_6_ambma$pred_ambma_m4),
  cor(m5c_6_ambma$ambma_6,m5c_6_ambma$pred_ambma_m5),
  cor(m6c_6_ambma$ambma_6,m6c_6_ambma$pred_ambma_m6),
  
  cor(m1c_7_ambma$ambma_7,m1c_7_ambma$pred_ambma_m1),
  cor(m2c_7_ambma$ambma_7,m2c_7_ambma$pred_ambma_m2),
  cor(m3c_7_ambma$ambma_7,m3c_7_ambma$pred_ambma_m3),
  cor(m4c_7_ambma$ambma_7,m4c_7_ambma$pred_ambma_m4),
  cor(m5c_7_ambma$ambma_7,m5c_7_ambma$pred_ambma_m5),
  cor(m6c_7_ambma$ambma_7,m6c_7_ambma$pred_ambma_m6),
  
  cor(m1c_8_ambma$ambma_8,m1c_8_ambma$pred_ambma_m1),
  cor(m2c_8_ambma$ambma_8,m2c_8_ambma$pred_ambma_m2),
  cor(m3c_8_ambma$ambma_8,m3c_8_ambma$pred_ambma_m3),
  cor(m4c_8_ambma$ambma_8,m4c_8_ambma$pred_ambma_m4),
  cor(m5c_8_ambma$ambma_8,m5c_8_ambma$pred_ambma_m5),
  cor(m6c_8_ambma$ambma_8,m6c_8_ambma$pred_ambma_m6),
  
  cor(m1c_9_ambma$ambma_9,m1c_9_ambma$pred_ambma_m1),
  cor(m2c_9_ambma$ambma_9,m2c_9_ambma$pred_ambma_m2),
  cor(m3c_9_ambma$ambma_9,m3c_9_ambma$pred_ambma_m3),
  cor(m4c_9_ambma$ambma_9,m4c_9_ambma$pred_ambma_m4),
  cor(m5c_9_ambma$ambma_9,m5c_9_ambma$pred_ambma_m5),
  cor(m6c_9_ambma$ambma_9,m6c_9_ambma$pred_ambma_m6),
  
  cor(m1c_10_ambma$ambma_10,m1c_10_ambma$pred_ambma_m1),
  cor(m2c_10_ambma$ambma_10,m2c_10_ambma$pred_ambma_m2),
  cor(m3c_10_ambma$ambma_10,m3c_10_ambma$pred_ambma_m3),
  cor(m4c_10_ambma$ambma_10,m4c_10_ambma$pred_ambma_m4),
  cor(m5c_10_ambma$ambma_10,m5c_10_ambma$pred_ambma_m5),
  cor(m6c_10_ambma$ambma_10,m6c_10_ambma$pred_ambma_m6),
  
  cor(m1c_1_derva$derva_1,m1c_1_derva$pred_derva_m1),
  cor(m2c_1_derva$derva_1,m2c_1_derva$pred_derva_m2),
  cor(m3c_1_derva$derva_1,m3c_1_derva$pred_derva_m3),
  cor(m4c_1_derva$derva_1,m4c_1_derva$pred_derva_m4),
  cor(m5c_1_derva$derva_1,m5c_1_derva$pred_derva_m5),
  cor(m6c_1_derva$derva_1,m6c_1_derva$pred_derva_m6),
  
  cor(m1c_2_derva$derva_2,m1c_2_derva$pred_derva_m1),
  cor(m2c_2_derva$derva_2,m2c_2_derva$pred_derva_m2),
  cor(m3c_2_derva$derva_2,m3c_2_derva$pred_derva_m3),
  cor(m4c_2_derva$derva_2,m4c_2_derva$pred_derva_m4),
  cor(m5c_2_derva$derva_2,m5c_2_derva$pred_derva_m5),
  cor(m6c_2_derva$derva_2,m6c_2_derva$pred_derva_m6),
  
  cor(m1c_3_derva$derva_3,m1c_3_derva$pred_derva_m1),
  cor(m2c_3_derva$derva_3,m2c_3_derva$pred_derva_m2),
  cor(m3c_3_derva$derva_3,m3c_3_derva$pred_derva_m3),
  cor(m4c_3_derva$derva_3,m4c_3_derva$pred_derva_m4),
  cor(m5c_3_derva$derva_3,m5c_3_derva$pred_derva_m5),
  cor(m6c_3_derva$derva_3,m6c_3_derva$pred_derva_m6),
  
  cor(m1c_4_derva$derva_4,m1c_4_derva$pred_derva_m1),
  cor(m2c_4_derva$derva_4,m2c_4_derva$pred_derva_m2),
  cor(m3c_4_derva$derva_4,m3c_4_derva$pred_derva_m3),
  cor(m4c_4_derva$derva_4,m4c_4_derva$pred_derva_m4),
  cor(m5c_4_derva$derva_4,m5c_4_derva$pred_derva_m5),
  cor(m6c_4_derva$derva_4,m6c_4_derva$pred_derva_m6),
  
  cor(m1c_5_derva$derva_5,m1c_5_derva$pred_derva_m1),
  cor(m2c_5_derva$derva_5,m2c_5_derva$pred_derva_m2),
  cor(m3c_5_derva$derva_5,m3c_5_derva$pred_derva_m3),
  cor(m4c_5_derva$derva_5,m4c_5_derva$pred_derva_m4),
  cor(m5c_5_derva$derva_5,m5c_5_derva$pred_derva_m5),
  cor(m6c_5_derva$derva_5,m6c_5_derva$pred_derva_m6),
  
  cor(m1c_6_derva$derva_6,m1c_6_derva$pred_derva_m1),
  cor(m2c_6_derva$derva_6,m2c_6_derva$pred_derva_m2),
  cor(m3c_6_derva$derva_6,m3c_6_derva$pred_derva_m3),
  cor(m4c_6_derva$derva_6,m4c_6_derva$pred_derva_m4),
  cor(m5c_6_derva$derva_6,m5c_6_derva$pred_derva_m5),
  cor(m6c_6_derva$derva_6,m6c_6_derva$pred_derva_m6),
  
  cor(m1c_7_derva$derva_7,m1c_7_derva$pred_derva_m1),
  cor(m2c_7_derva$derva_7,m2c_7_derva$pred_derva_m2),
  cor(m3c_7_derva$derva_7,m3c_7_derva$pred_derva_m3),
  cor(m4c_7_derva$derva_7,m4c_7_derva$pred_derva_m4),
  cor(m5c_7_derva$derva_7,m5c_7_derva$pred_derva_m5),
  cor(m6c_7_derva$derva_7,m6c_7_derva$pred_derva_m6),
  
  cor(m1c_8_derva$derva_8,m1c_8_derva$pred_derva_m1),
  cor(m2c_8_derva$derva_8,m2c_8_derva$pred_derva_m2),
  cor(m3c_8_derva$derva_8,m3c_8_derva$pred_derva_m3),
  cor(m4c_8_derva$derva_8,m4c_8_derva$pred_derva_m4),
  cor(m5c_8_derva$derva_8,m5c_8_derva$pred_derva_m5),
  cor(m6c_8_derva$derva_8,m6c_8_derva$pred_derva_m6),
  
  cor(m1c_9_derva$derva_9,m1c_9_derva$pred_derva_m1),
  cor(m2c_9_derva$derva_9,m2c_9_derva$pred_derva_m2),
  cor(m3c_9_derva$derva_9,m3c_9_derva$pred_derva_m3),
  cor(m4c_9_derva$derva_9,m4c_9_derva$pred_derva_m4),
  cor(m5c_9_derva$derva_9,m5c_9_derva$pred_derva_m5),
  cor(m6c_9_derva$derva_9,m6c_9_derva$pred_derva_m6),
  
  cor(m1c_10_derva$derva_10,m1c_10_derva$pred_derva_m1),
  cor(m2c_10_derva$derva_10,m2c_10_derva$pred_derva_m2),
  cor(m3c_10_derva$derva_10,m3c_10_derva$pred_derva_m3),
  cor(m4c_10_derva$derva_10,m4c_10_derva$pred_derva_m4),
  cor(m5c_10_derva$derva_10,m5c_10_derva$pred_derva_m5),
  cor(m6c_10_derva$derva_10,m6c_10_derva$pred_derva_m6),
  
  cor(m1c_1_ixosc$ixosc_1,m1c_1_ixosc$pred_ixosc_m1),
  cor(m2c_1_ixosc$ixosc_1,m2c_1_ixosc$pred_ixosc_m2),
  cor(m3c_1_ixosc$ixosc_1,m3c_1_ixosc$pred_ixosc_m3),
  cor(m4c_1_ixosc$ixosc_1,m4c_1_ixosc$pred_ixosc_m4),
  cor(m5c_1_ixosc$ixosc_1,m5c_1_ixosc$pred_ixosc_m5),
  cor(m6c_1_ixosc$ixosc_1,m6c_1_ixosc$pred_ixosc_m6),
  
  cor(m1c_2_ixosc$ixosc_2,m1c_2_ixosc$pred_ixosc_m1),
  cor(m2c_2_ixosc$ixosc_2,m2c_2_ixosc$pred_ixosc_m2),
  cor(m3c_2_ixosc$ixosc_2,m3c_2_ixosc$pred_ixosc_m3),
  cor(m4c_2_ixosc$ixosc_2,m4c_2_ixosc$pred_ixosc_m4),
  cor(m5c_2_ixosc$ixosc_2,m5c_2_ixosc$pred_ixosc_m5),
  cor(m6c_2_ixosc$ixosc_2,m6c_2_ixosc$pred_ixosc_m6),
  
  cor(m1c_3_ixosc$ixosc_3,m1c_3_ixosc$pred_ixosc_m1),
  cor(m2c_3_ixosc$ixosc_3,m2c_3_ixosc$pred_ixosc_m2),
  cor(m3c_3_ixosc$ixosc_3,m3c_3_ixosc$pred_ixosc_m3),
  cor(m4c_3_ixosc$ixosc_3,m4c_3_ixosc$pred_ixosc_m4),
  cor(m5c_3_ixosc$ixosc_3,m5c_3_ixosc$pred_ixosc_m5),
  cor(m6c_3_ixosc$ixosc_3,m6c_3_ixosc$pred_ixosc_m6),
  
  cor(m1c_4_ixosc$ixosc_4,m1c_4_ixosc$pred_ixosc_m1),
  cor(m2c_4_ixosc$ixosc_4,m2c_4_ixosc$pred_ixosc_m2),
  cor(m3c_4_ixosc$ixosc_4,m3c_4_ixosc$pred_ixosc_m3),
  cor(m4c_4_ixosc$ixosc_4,m4c_4_ixosc$pred_ixosc_m4),
  cor(m5c_4_ixosc$ixosc_4,m5c_4_ixosc$pred_ixosc_m5),
  cor(m6c_4_ixosc$ixosc_4,m6c_4_ixosc$pred_ixosc_m6),
  
  cor(m1c_5_ixosc$ixosc_5,m1c_5_ixosc$pred_ixosc_m1),
  cor(m2c_5_ixosc$ixosc_5,m2c_5_ixosc$pred_ixosc_m2),
  cor(m3c_5_ixosc$ixosc_5,m3c_5_ixosc$pred_ixosc_m3),
  cor(m4c_5_ixosc$ixosc_5,m4c_5_ixosc$pred_ixosc_m4),
  cor(m5c_5_ixosc$ixosc_5,m5c_5_ixosc$pred_ixosc_m5),
  cor(m6c_5_ixosc$ixosc_5,m6c_5_ixosc$pred_ixosc_m6),
  
  cor(m1c_6_ixosc$ixosc_6,m1c_6_ixosc$pred_ixosc_m1),
  cor(m2c_6_ixosc$ixosc_6,m2c_6_ixosc$pred_ixosc_m2),
  cor(m3c_6_ixosc$ixosc_6,m3c_6_ixosc$pred_ixosc_m3),
  cor(m4c_6_ixosc$ixosc_6,m4c_6_ixosc$pred_ixosc_m4),
  cor(m5c_6_ixosc$ixosc_6,m5c_6_ixosc$pred_ixosc_m5),
  cor(m6c_6_ixosc$ixosc_6,m6c_6_ixosc$pred_ixosc_m6),
  
  cor(m1c_7_ixosc$ixosc_7,m1c_7_ixosc$pred_ixosc_m1),
  cor(m2c_7_ixosc$ixosc_7,m2c_7_ixosc$pred_ixosc_m2),
  cor(m3c_7_ixosc$ixosc_7,m3c_7_ixosc$pred_ixosc_m3),
  cor(m4c_7_ixosc$ixosc_7,m4c_7_ixosc$pred_ixosc_m4),
  cor(m5c_7_ixosc$ixosc_7,m5c_7_ixosc$pred_ixosc_m5),
  cor(m6c_7_ixosc$ixosc_7,m6c_7_ixosc$pred_ixosc_m6),
  
  cor(m1c_8_ixosc$ixosc_8,m1c_8_ixosc$pred_ixosc_m1),
  cor(m2c_8_ixosc$ixosc_8,m2c_8_ixosc$pred_ixosc_m2),
  cor(m3c_8_ixosc$ixosc_8,m3c_8_ixosc$pred_ixosc_m3),
  cor(m4c_8_ixosc$ixosc_8,m4c_8_ixosc$pred_ixosc_m4),
  cor(m5c_8_ixosc$ixosc_8,m5c_8_ixosc$pred_ixosc_m5),
  cor(m6c_8_ixosc$ixosc_8,m6c_8_ixosc$pred_ixosc_m6),
  
  cor(m1c_9_ixosc$ixosc_9,m1c_9_ixosc$pred_ixosc_m1),
  cor(m2c_9_ixosc$ixosc_9,m2c_9_ixosc$pred_ixosc_m2),
  cor(m3c_9_ixosc$ixosc_9,m3c_9_ixosc$pred_ixosc_m3),
  cor(m4c_9_ixosc$ixosc_9,m4c_9_ixosc$pred_ixosc_m4),
  cor(m5c_9_ixosc$ixosc_9,m5c_9_ixosc$pred_ixosc_m5),
  cor(m6c_9_ixosc$ixosc_9,m6c_9_ixosc$pred_ixosc_m6),
  
  cor(m1c_10_ixosc$ixosc_10,m1c_10_ixosc$pred_ixosc_m1),
  cor(m2c_10_ixosc$ixosc_10,m2c_10_ixosc$pred_ixosc_m2),
  cor(m3c_10_ixosc$ixosc_10,m3c_10_ixosc$pred_ixosc_m3),
  cor(m4c_10_ixosc$ixosc_10,m4c_10_ixosc$pred_ixosc_m4),
  cor(m5c_10_ixosc$ixosc_10,m5c_10_ixosc$pred_ixosc_m5),
  cor(m6c_10_ixosc$ixosc_10,m6c_10_ixosc$pred_ixosc_m6)
)


## create a dataframe to hold correlations
r2_full<-matrix(nrow=480,ncol=5)
colnames(r2_full)<-c("model","run","sim","sp","R2")
r2_full<-data.frame(r2_full)


r2_full$model<-rep(c(1,2,3,4,5,6),80)
r2_full$run<-rep(c(rep(1,6),rep(2,6),rep(3,6),rep(4,6),rep(5,6),rep(6,6),rep(7,6),rep(8,6),rep(9,6),rep(10,6)),8)
r2_full$sim<-c(rep("A",240),rep("C",240))
r2_full$sp<-rep(c(rep("ambam",60),rep("ambma",60),rep("derva",60),rep("ixosc",60)),2)
r2_full$R2<-c(
  cor(m1a_1$ambam_1,m1a_1$pred_ambam_m1),
  cor(m2a_1$ambam_1,m2a_1$pred_ambam_m2),
  cor(m3a_1$ambam_1,m3a_1$pred_ambam_m3),
  cor(m4a_1$ambam_1,m4a_1$pred_ambam_m4),
  cor(m5a_1$ambam_1,m5a_1$pred_ambam_m5),
  cor(m6a_1$ambam_1,m6a_1$pred_ambam_m6),
  
  cor(m1a_2$ambam_2,m1a_2$pred_ambam_m1),
  cor(m2a_2$ambam_2,m2a_2$pred_ambam_m2),
  cor(m3a_2$ambam_2,m3a_2$pred_ambam_m3),
  cor(m4a_2$ambam_2,m4a_2$pred_ambam_m4),
  cor(m5a_2$ambam_2,m5a_2$pred_ambam_m5),
  cor(m6a_2$ambam_2,m6a_2$pred_ambam_m6),
  
  cor(m1a_3$ambam_3,m1a_3$pred_ambam_m1),
  cor(m2a_3$ambam_3,m2a_3$pred_ambam_m2),
  cor(m3a_3$ambam_3,m3a_3$pred_ambam_m3),
  cor(m4a_3$ambam_3,m4a_3$pred_ambam_m4),
  cor(m5a_3$ambam_3,m5a_3$pred_ambam_m5),
  cor(m6a_3$ambam_3,m6a_3$pred_ambam_m6),
  
  cor(m1a_4$ambam_4,m1a_4$pred_ambam_m1),
  cor(m2a_4$ambam_4,m2a_4$pred_ambam_m2),
  cor(m3a_4$ambam_4,m3a_4$pred_ambam_m3),
  cor(m4a_4$ambam_4,m4a_4$pred_ambam_m4),
  cor(m5a_4$ambam_4,m5a_4$pred_ambam_m5),
  cor(m6a_4$ambam_4,m6a_4$pred_ambam_m6),
  
  cor(m1a_5$ambam_5,m1a_5$pred_ambam_m1),
  cor(m2a_5$ambam_5,m2a_5$pred_ambam_m2),
  cor(m3a_5$ambam_5,m3a_5$pred_ambam_m3),
  cor(m4a_5$ambam_5,m4a_5$pred_ambam_m4),
  cor(m5a_5$ambam_5,m5a_5$pred_ambam_m5),
  cor(m6a_5$ambam_5,m6a_5$pred_ambam_m6),
  
  cor(m1a_6$ambam_6,m1a_6$pred_ambam_m1),
  cor(m2a_6$ambam_6,m2a_6$pred_ambam_m2),
  cor(m3a_6$ambam_6,m3a_6$pred_ambam_m3),
  cor(m4a_6$ambam_6,m4a_6$pred_ambam_m4),
  cor(m5a_6$ambam_6,m5a_6$pred_ambam_m5),
  cor(m6a_6$ambam_6,m6a_6$pred_ambam_m6),
  
  cor(m1a_7$ambam_7,m1a_7$pred_ambam_m1),
  cor(m2a_7$ambam_7,m2a_7$pred_ambam_m2),
  cor(m3a_7$ambam_7,m3a_7$pred_ambam_m3),
  cor(m4a_7$ambam_7,m4a_7$pred_ambam_m4),
  cor(m5a_7$ambam_7,m5a_7$pred_ambam_m5),
  cor(m6a_7$ambam_7,m6a_7$pred_ambam_m6),
  
  cor(m1a_8$ambam_8,m1a_8$pred_ambam_m1),
  cor(m2a_8$ambam_8,m2a_8$pred_ambam_m2),
  cor(m3a_8$ambam_8,m3a_8$pred_ambam_m3),
  cor(m4a_8$ambam_8,m4a_8$pred_ambam_m4),
  cor(m5a_8$ambam_8,m5a_8$pred_ambam_m5),
  cor(m6a_8$ambam_8,m6a_8$pred_ambam_m6),
  
  cor(m1a_9$ambam_9,m1a_9$pred_ambam_m1),
  cor(m2a_9$ambam_9,m2a_9$pred_ambam_m2),
  cor(m3a_9$ambam_9,m3a_9$pred_ambam_m3),
  cor(m4a_9$ambam_9,m4a_9$pred_ambam_m4),
  cor(m5a_9$ambam_9,m5a_9$pred_ambam_m5),
  cor(m6a_9$ambam_9,m6a_9$pred_ambam_m6),
  
  cor(m1a_10$ambam_10,m1a_10$pred_ambam_m1),
  cor(m2a_10$ambam_10,m2a_10$pred_ambam_m2),
  cor(m3a_10$ambam_10,m3a_10$pred_ambam_m3),
  cor(m4a_10$ambam_10,m4a_10$pred_ambam_m4),
  cor(m5a_10$ambam_10,m5a_10$pred_ambam_m5),
  cor(m6a_10$ambam_10,m6a_10$pred_ambam_m6),
  
  cor(m1a_1$ambma_1,m1a_1$pred_ambma_m1),
  cor(m2a_1$ambma_1,m2a_1$pred_ambma_m2),
  cor(m3a_1$ambma_1,m3a_1$pred_ambma_m3),
  cor(m4a_1$ambma_1,m4a_1$pred_ambma_m4),
  cor(m5a_1$ambma_1,m5a_1$pred_ambma_m5),
  cor(m6a_1$ambma_1,m6a_1$pred_ambma_m6),
  
  cor(m1a_2$ambma_2,m1a_2$pred_ambma_m1),
  cor(m2a_2$ambma_2,m2a_2$pred_ambma_m2),
  cor(m3a_2$ambma_2,m3a_2$pred_ambma_m3),
  cor(m4a_2$ambma_2,m4a_2$pred_ambma_m4),
  cor(m5a_2$ambma_2,m5a_2$pred_ambma_m5),
  cor(m6a_2$ambma_2,m6a_2$pred_ambma_m6),
  
  cor(m1a_3$ambma_3,m1a_3$pred_ambma_m1),
  cor(m2a_3$ambma_3,m2a_3$pred_ambma_m2),
  cor(m3a_3$ambma_3,m3a_3$pred_ambma_m3),
  cor(m4a_3$ambma_3,m4a_3$pred_ambma_m4),
  cor(m5a_3$ambma_3,m5a_3$pred_ambma_m5),
  cor(m6a_3$ambma_3,m6a_3$pred_ambma_m6),
  
  cor(m1a_4$ambma_4,m1a_4$pred_ambma_m1),
  cor(m2a_4$ambma_4,m2a_4$pred_ambma_m2),
  cor(m3a_4$ambma_4,m3a_4$pred_ambma_m3),
  cor(m4a_4$ambma_4,m4a_4$pred_ambma_m4),
  cor(m5a_4$ambma_4,m5a_4$pred_ambma_m5),
  cor(m6a_4$ambma_4,m6a_4$pred_ambma_m6),
  
  cor(m1a_5$ambma_5,m1a_5$pred_ambma_m1),
  cor(m2a_5$ambma_5,m2a_5$pred_ambma_m2),
  cor(m3a_5$ambma_5,m3a_5$pred_ambma_m3),
  cor(m4a_5$ambma_5,m4a_5$pred_ambma_m4),
  cor(m5a_5$ambma_5,m5a_5$pred_ambma_m5),
  cor(m6a_5$ambma_5,m6a_5$pred_ambma_m6),
  
  cor(m1a_6$ambma_6,m1a_6$pred_ambma_m1),
  cor(m2a_6$ambma_6,m2a_6$pred_ambma_m2),
  cor(m3a_6$ambma_6,m3a_6$pred_ambma_m3),
  cor(m4a_6$ambma_6,m4a_6$pred_ambma_m4),
  cor(m5a_6$ambma_6,m5a_6$pred_ambma_m5),
  cor(m6a_6$ambma_6,m6a_6$pred_ambma_m6),
  
  cor(m1a_7$ambma_7,m1a_7$pred_ambma_m1),
  cor(m2a_7$ambma_7,m2a_7$pred_ambma_m2),
  cor(m3a_7$ambma_7,m3a_7$pred_ambma_m3),
  cor(m4a_7$ambma_7,m4a_7$pred_ambma_m4),
  cor(m5a_7$ambma_7,m5a_7$pred_ambma_m5),
  cor(m6a_7$ambma_7,m6a_7$pred_ambma_m6),
  
  cor(m1a_8$ambma_8,m1a_8$pred_ambma_m1),
  cor(m2a_8$ambma_8,m2a_8$pred_ambma_m2),
  cor(m3a_8$ambma_8,m3a_8$pred_ambma_m3),
  cor(m4a_8$ambma_8,m4a_8$pred_ambma_m4),
  cor(m5a_8$ambma_8,m5a_8$pred_ambma_m5),
  cor(m6a_8$ambma_8,m6a_8$pred_ambma_m6),
  
  cor(m1a_9$ambma_9,m1a_9$pred_ambma_m1),
  cor(m2a_9$ambma_9,m2a_9$pred_ambma_m2),
  cor(m3a_9$ambma_9,m3a_9$pred_ambma_m3),
  cor(m4a_9$ambma_9,m4a_9$pred_ambma_m4),
  cor(m5a_9$ambma_9,m5a_9$pred_ambma_m5),
  cor(m6a_9$ambma_9,m6a_9$pred_ambma_m6),
  
  cor(m1a_10$ambma_10,m1a_10$pred_ambma_m1),
  cor(m2a_10$ambma_10,m2a_10$pred_ambma_m2),
  cor(m3a_10$ambma_10,m3a_10$pred_ambma_m3),
  cor(m4a_10$ambma_10,m4a_10$pred_ambma_m4),
  cor(m5a_10$ambma_10,m5a_10$pred_ambma_m5),
  cor(m6a_10$ambma_10,m6a_10$pred_ambma_m6),
  
  cor(m1a_1$derva_1,m1a_1$pred_derva_m1),
  cor(m2a_1$derva_1,m2a_1$pred_derva_m2),
  cor(m3a_1$derva_1,m3a_1$pred_derva_m3),
  cor(m4a_1$derva_1,m4a_1$pred_derva_m4),
  cor(m5a_1$derva_1,m5a_1$pred_derva_m5),
  cor(m6a_1$derva_1,m6a_1$pred_derva_m6),
  
  cor(m1a_2$derva_2,m1a_2$pred_derva_m1),
  cor(m2a_2$derva_2,m2a_2$pred_derva_m2),
  cor(m3a_2$derva_2,m3a_2$pred_derva_m3),
  cor(m4a_2$derva_2,m4a_2$pred_derva_m4),
  cor(m5a_2$derva_2,m5a_2$pred_derva_m5),
  cor(m6a_2$derva_2,m6a_2$pred_derva_m6),
  
  cor(m1a_3$derva_3,m1a_3$pred_derva_m1),
  cor(m2a_3$derva_3,m2a_3$pred_derva_m2),
  cor(m3a_3$derva_3,m3a_3$pred_derva_m3),
  cor(m4a_3$derva_3,m4a_3$pred_derva_m4),
  cor(m5a_3$derva_3,m5a_3$pred_derva_m5),
  cor(m6a_3$derva_3,m6a_3$pred_derva_m6),
  
  cor(m1a_4$derva_4,m1a_4$pred_derva_m1),
  cor(m2a_4$derva_4,m2a_4$pred_derva_m2),
  cor(m3a_4$derva_4,m3a_4$pred_derva_m3),
  cor(m4a_4$derva_4,m4a_4$pred_derva_m4),
  cor(m5a_4$derva_4,m5a_4$pred_derva_m5),
  cor(m6a_4$derva_4,m6a_4$pred_derva_m6),
  
  cor(m1a_5$derva_5,m1a_5$pred_derva_m1),
  cor(m2a_5$derva_5,m2a_5$pred_derva_m2),
  cor(m3a_5$derva_5,m3a_5$pred_derva_m3),
  cor(m4a_5$derva_5,m4a_5$pred_derva_m4),
  cor(m5a_5$derva_5,m5a_5$pred_derva_m5),
  cor(m6a_5$derva_5,m6a_5$pred_derva_m6),
  
  cor(m1a_6$derva_6,m1a_6$pred_derva_m1),
  cor(m2a_6$derva_6,m2a_6$pred_derva_m2),
  cor(m3a_6$derva_6,m3a_6$pred_derva_m3),
  cor(m4a_6$derva_6,m4a_6$pred_derva_m4),
  cor(m5a_6$derva_6,m5a_6$pred_derva_m5),
  cor(m6a_6$derva_6,m6a_6$pred_derva_m6),
  
  cor(m1a_7$derva_7,m1a_7$pred_derva_m1),
  cor(m2a_7$derva_7,m2a_7$pred_derva_m2),
  cor(m3a_7$derva_7,m3a_7$pred_derva_m3),
  cor(m4a_7$derva_7,m4a_7$pred_derva_m4),
  cor(m5a_7$derva_7,m5a_7$pred_derva_m5),
  cor(m6a_7$derva_7,m6a_7$pred_derva_m6),
  
  cor(m1a_8$derva_8,m1a_8$pred_derva_m1),
  cor(m2a_8$derva_8,m2a_8$pred_derva_m2),
  cor(m3a_8$derva_8,m3a_8$pred_derva_m3),
  cor(m4a_8$derva_8,m4a_8$pred_derva_m4),
  cor(m5a_8$derva_8,m5a_8$pred_derva_m5),
  cor(m6a_8$derva_8,m6a_8$pred_derva_m6),
  
  cor(m1a_9$derva_9,m1a_9$pred_derva_m1),
  cor(m2a_9$derva_9,m2a_9$pred_derva_m2),
  cor(m3a_9$derva_9,m3a_9$pred_derva_m3),
  cor(m4a_9$derva_9,m4a_9$pred_derva_m4),
  cor(m5a_9$derva_9,m5a_9$pred_derva_m5),
  cor(m6a_9$derva_9,m6a_9$pred_derva_m6),
  
  cor(m1a_10$derva_10,m1a_10$pred_derva_m1),
  cor(m2a_10$derva_10,m2a_10$pred_derva_m2),
  cor(m3a_10$derva_10,m3a_10$pred_derva_m3),
  cor(m4a_10$derva_10,m4a_10$pred_derva_m4),
  cor(m5a_10$derva_10,m5a_10$pred_derva_m5),
  cor(m6a_10$derva_10,m6a_10$pred_derva_m6),
  
  cor(m1a_1$ixosc_1,m1a_1$pred_ixosc_m1),
  cor(m2a_1$ixosc_1,m2a_1$pred_ixosc_m2),
  cor(m3a_1$ixosc_1,m3a_1$pred_ixosc_m3),
  cor(m4a_1$ixosc_1,m4a_1$pred_ixosc_m4),
  cor(m5a_1$ixosc_1,m5a_1$pred_ixosc_m5),
  cor(m6a_1$ixosc_1,m6a_1$pred_ixosc_m6),
  
  cor(m1a_2$ixosc_2,m1a_2$pred_ixosc_m1),
  cor(m2a_2$ixosc_2,m2a_2$pred_ixosc_m2),
  cor(m3a_2$ixosc_2,m3a_2$pred_ixosc_m3),
  cor(m4a_2$ixosc_2,m4a_2$pred_ixosc_m4),
  cor(m5a_2$ixosc_2,m5a_2$pred_ixosc_m5),
  cor(m6a_2$ixosc_2,m6a_2$pred_ixosc_m6),
  
  cor(m1a_3$ixosc_3,m1a_3$pred_ixosc_m1),
  cor(m2a_3$ixosc_3,m2a_3$pred_ixosc_m2),
  cor(m3a_3$ixosc_3,m3a_3$pred_ixosc_m3),
  cor(m4a_3$ixosc_3,m4a_3$pred_ixosc_m4),
  cor(m5a_3$ixosc_3,m5a_3$pred_ixosc_m5),
  cor(m6a_3$ixosc_3,m6a_3$pred_ixosc_m6),
  
  cor(m1a_4$ixosc_4,m1a_4$pred_ixosc_m1),
  cor(m2a_4$ixosc_4,m2a_4$pred_ixosc_m2),
  cor(m3a_4$ixosc_4,m3a_4$pred_ixosc_m3),
  cor(m4a_4$ixosc_4,m4a_4$pred_ixosc_m4),
  cor(m5a_4$ixosc_4,m5a_4$pred_ixosc_m5),
  cor(m6a_4$ixosc_4,m6a_4$pred_ixosc_m6),
  
  cor(m1a_5$ixosc_5,m1a_5$pred_ixosc_m1),
  cor(m2a_5$ixosc_5,m2a_5$pred_ixosc_m2),
  cor(m3a_5$ixosc_5,m3a_5$pred_ixosc_m3),
  cor(m4a_5$ixosc_5,m4a_5$pred_ixosc_m4),
  cor(m5a_5$ixosc_5,m5a_5$pred_ixosc_m5),
  cor(m6a_5$ixosc_5,m6a_5$pred_ixosc_m6),
  
  cor(m1a_6$ixosc_6,m1a_6$pred_ixosc_m1),
  cor(m2a_6$ixosc_6,m2a_6$pred_ixosc_m2),
  cor(m3a_6$ixosc_6,m3a_6$pred_ixosc_m3),
  cor(m4a_6$ixosc_6,m4a_6$pred_ixosc_m4),
  cor(m5a_6$ixosc_6,m5a_6$pred_ixosc_m5),
  cor(m6a_6$ixosc_6,m6a_6$pred_ixosc_m6),
  
  cor(m1a_7$ixosc_7,m1a_7$pred_ixosc_m1),
  cor(m2a_7$ixosc_7,m2a_7$pred_ixosc_m2),
  cor(m3a_7$ixosc_7,m3a_7$pred_ixosc_m3),
  cor(m4a_7$ixosc_7,m4a_7$pred_ixosc_m4),
  cor(m5a_7$ixosc_7,m5a_7$pred_ixosc_m5),
  cor(m6a_7$ixosc_7,m6a_7$pred_ixosc_m6),
  
  cor(m1a_8$ixosc_8,m1a_8$pred_ixosc_m1),
  cor(m2a_8$ixosc_8,m2a_8$pred_ixosc_m2),
  cor(m3a_8$ixosc_8,m3a_8$pred_ixosc_m3),
  cor(m4a_8$ixosc_8,m4a_8$pred_ixosc_m4),
  cor(m5a_8$ixosc_8,m5a_8$pred_ixosc_m5),
  cor(m6a_8$ixosc_8,m6a_8$pred_ixosc_m6),
  
  cor(m1a_9$ixosc_9,m1a_9$pred_ixosc_m1),
  cor(m2a_9$ixosc_9,m2a_9$pred_ixosc_m2),
  cor(m3a_9$ixosc_9,m3a_9$pred_ixosc_m3),
  cor(m4a_9$ixosc_9,m4a_9$pred_ixosc_m4),
  cor(m5a_9$ixosc_9,m5a_9$pred_ixosc_m5),
  cor(m6a_9$ixosc_9,m6a_9$pred_ixosc_m6),
  
  cor(m1a_10$ixosc_10,m1a_10$pred_ixosc_m1),
  cor(m2a_10$ixosc_10,m2a_10$pred_ixosc_m2),
  cor(m3a_10$ixosc_10,m3a_10$pred_ixosc_m3),
  cor(m4a_10$ixosc_10,m4a_10$pred_ixosc_m4),
  cor(m5a_10$ixosc_10,m5a_10$pred_ixosc_m5),
  cor(m6a_10$ixosc_10,m6a_10$pred_ixosc_m6),
  
  cor(m1c_1$ambam_1,m1c_1$pred_ambam_m1),
  cor(m2c_1$ambam_1,m2c_1$pred_ambam_m2),
  cor(m3c_1$ambam_1,m3c_1$pred_ambam_m3),
  cor(m4c_1$ambam_1,m4c_1$pred_ambam_m4),
  cor(m5c_1$ambam_1,m5c_1$pred_ambam_m5),
  cor(m6c_1$ambam_1,m6c_1$pred_ambam_m6),
  
  cor(m1c_2$ambam_2,m1c_2$pred_ambam_m1),
  cor(m2c_2$ambam_2,m2c_2$pred_ambam_m2),
  cor(m3c_2$ambam_2,m3c_2$pred_ambam_m3),
  cor(m4c_2$ambam_2,m4c_2$pred_ambam_m4),
  cor(m5c_2$ambam_2,m5c_2$pred_ambam_m5),
  cor(m6c_2$ambam_2,m6c_2$pred_ambam_m6),
  
  cor(m1c_3$ambam_3,m1c_3$pred_ambam_m1),
  cor(m2c_3$ambam_3,m2c_3$pred_ambam_m2),
  cor(m3c_3$ambam_3,m3c_3$pred_ambam_m3),
  cor(m4c_3$ambam_3,m4c_3$pred_ambam_m4),
  cor(m5c_3$ambam_3,m5c_3$pred_ambam_m5),
  cor(m6c_3$ambam_3,m6c_3$pred_ambam_m6),
  
  cor(m1c_4$ambam_4,m1c_4$pred_ambam_m1),
  cor(m2c_4$ambam_4,m2c_4$pred_ambam_m2),
  cor(m3c_4$ambam_4,m3c_4$pred_ambam_m3),
  cor(m4c_4$ambam_4,m4c_4$pred_ambam_m4),
  cor(m5c_4$ambam_4,m5c_4$pred_ambam_m5),
  cor(m6c_4$ambam_4,m6c_4$pred_ambam_m6),
  
  cor(m1c_5$ambam_5,m1c_5$pred_ambam_m1),
  cor(m2c_5$ambam_5,m2c_5$pred_ambam_m2),
  cor(m3c_5$ambam_5,m3c_5$pred_ambam_m3),
  cor(m4c_5$ambam_5,m4c_5$pred_ambam_m4),
  cor(m5c_5$ambam_5,m5c_5$pred_ambam_m5),
  cor(m6c_5$ambam_5,m6c_5$pred_ambam_m6),
  
  cor(m1c_6$ambam_6,m1c_6$pred_ambam_m1),
  cor(m2c_6$ambam_6,m2c_6$pred_ambam_m2),
  cor(m3c_6$ambam_6,m3c_6$pred_ambam_m3),
  cor(m4c_6$ambam_6,m4c_6$pred_ambam_m4),
  cor(m5c_6$ambam_6,m5c_6$pred_ambam_m5),
  cor(m6c_6$ambam_6,m6c_6$pred_ambam_m6),
  
  cor(m1c_7$ambam_7,m1c_7$pred_ambam_m1),
  cor(m2c_7$ambam_7,m2c_7$pred_ambam_m2),
  cor(m3c_7$ambam_7,m3c_7$pred_ambam_m3),
  cor(m4c_7$ambam_7,m4c_7$pred_ambam_m4),
  cor(m5c_7$ambam_7,m5c_7$pred_ambam_m5),
  cor(m6c_7$ambam_7,m6c_7$pred_ambam_m6),
  
  cor(m1c_8$ambam_8,m1c_8$pred_ambam_m1),
  cor(m2c_8$ambam_8,m2c_8$pred_ambam_m2),
  cor(m3c_8$ambam_8,m3c_8$pred_ambam_m3),
  cor(m4c_8$ambam_8,m4c_8$pred_ambam_m4),
  cor(m5c_8$ambam_8,m5c_8$pred_ambam_m5),
  cor(m6c_8$ambam_8,m6c_8$pred_ambam_m6),
  
  cor(m1c_9$ambam_9,m1c_9$pred_ambam_m1),
  cor(m2c_9$ambam_9,m2c_9$pred_ambam_m2),
  cor(m3c_9$ambam_9,m3c_9$pred_ambam_m3),
  cor(m4c_9$ambam_9,m4c_9$pred_ambam_m4),
  cor(m5c_9$ambam_9,m5c_9$pred_ambam_m5),
  cor(m6c_9$ambam_9,m6c_9$pred_ambam_m6),
  
  cor(m1c_10$ambam_10,m1c_10$pred_ambam_m1),
  cor(m2c_10$ambam_10,m2c_10$pred_ambam_m2),
  cor(m3c_10$ambam_10,m3c_10$pred_ambam_m3),
  cor(m4c_10$ambam_10,m4c_10$pred_ambam_m4),
  cor(m5c_10$ambam_10,m5c_10$pred_ambam_m5),
  cor(m6c_10$ambam_10,m6c_10$pred_ambam_m6),
  
  cor(m1c_1$ambma_1,m1c_1$pred_ambma_m1),
  cor(m2c_1$ambma_1,m2c_1$pred_ambma_m2),
  cor(m3c_1$ambma_1,m3c_1$pred_ambma_m3),
  cor(m4c_1$ambma_1,m4c_1$pred_ambma_m4),
  cor(m5c_1$ambma_1,m5c_1$pred_ambma_m5),
  cor(m6c_1$ambma_1,m6c_1$pred_ambma_m6),
  
  cor(m1c_2$ambma_2,m1c_2$pred_ambma_m1),
  cor(m2c_2$ambma_2,m2c_2$pred_ambma_m2),
  cor(m3c_2$ambma_2,m3c_2$pred_ambma_m3),
  cor(m4c_2$ambma_2,m4c_2$pred_ambma_m4),
  cor(m5c_2$ambma_2,m5c_2$pred_ambma_m5),
  cor(m6c_2$ambma_2,m6c_2$pred_ambma_m6),
  
  cor(m1c_3$ambma_3,m1c_3$pred_ambma_m1),
  cor(m2c_3$ambma_3,m2c_3$pred_ambma_m2),
  cor(m3c_3$ambma_3,m3c_3$pred_ambma_m3),
  cor(m4c_3$ambma_3,m4c_3$pred_ambma_m4),
  cor(m5c_3$ambma_3,m5c_3$pred_ambma_m5),
  cor(m6c_3$ambma_3,m6c_3$pred_ambma_m6),
  
  cor(m1c_4$ambma_4,m1c_4$pred_ambma_m1),
  cor(m2c_4$ambma_4,m2c_4$pred_ambma_m2),
  cor(m3c_4$ambma_4,m3c_4$pred_ambma_m3),
  cor(m4c_4$ambma_4,m4c_4$pred_ambma_m4),
  cor(m5c_4$ambma_4,m5c_4$pred_ambma_m5),
  cor(m6c_4$ambma_4,m6c_4$pred_ambma_m6),
  
  cor(m1c_5$ambma_5,m1c_5$pred_ambma_m1),
  cor(m2c_5$ambma_5,m2c_5$pred_ambma_m2),
  cor(m3c_5$ambma_5,m3c_5$pred_ambma_m3),
  cor(m4c_5$ambma_5,m4c_5$pred_ambma_m4),
  cor(m5c_5$ambma_5,m5c_5$pred_ambma_m5),
  cor(m6c_5$ambma_5,m6c_5$pred_ambma_m6),
  
  cor(m1c_6$ambma_6,m1c_6$pred_ambma_m1),
  cor(m2c_6$ambma_6,m2c_6$pred_ambma_m2),
  cor(m3c_6$ambma_6,m3c_6$pred_ambma_m3),
  cor(m4c_6$ambma_6,m4c_6$pred_ambma_m4),
  cor(m5c_6$ambma_6,m5c_6$pred_ambma_m5),
  cor(m6c_6$ambma_6,m6c_6$pred_ambma_m6),
  
  cor(m1c_7$ambma_7,m1c_7$pred_ambma_m1),
  cor(m2c_7$ambma_7,m2c_7$pred_ambma_m2),
  cor(m3c_7$ambma_7,m3c_7$pred_ambma_m3),
  cor(m4c_7$ambma_7,m4c_7$pred_ambma_m4),
  cor(m5c_7$ambma_7,m5c_7$pred_ambma_m5),
  cor(m6c_7$ambma_7,m6c_7$pred_ambma_m6),
  
  cor(m1c_8$ambma_8,m1c_8$pred_ambma_m1),
  cor(m2c_8$ambma_8,m2c_8$pred_ambma_m2),
  cor(m3c_8$ambma_8,m3c_8$pred_ambma_m3),
  cor(m4c_8$ambma_8,m4c_8$pred_ambma_m4),
  cor(m5c_8$ambma_8,m5c_8$pred_ambma_m5),
  cor(m6c_8$ambma_8,m6c_8$pred_ambma_m6),
  
  cor(m1c_9$ambma_9,m1c_9$pred_ambma_m1),
  cor(m2c_9$ambma_9,m2c_9$pred_ambma_m2),
  cor(m3c_9$ambma_9,m3c_9$pred_ambma_m3),
  cor(m4c_9$ambma_9,m4c_9$pred_ambma_m4),
  cor(m5c_9$ambma_9,m5c_9$pred_ambma_m5),
  cor(m6c_9$ambma_9,m6c_9$pred_ambma_m6),
  
  cor(m1c_10$ambma_10,m1c_10$pred_ambma_m1),
  cor(m2c_10$ambma_10,m2c_10$pred_ambma_m2),
  cor(m3c_10$ambma_10,m3c_10$pred_ambma_m3),
  cor(m4c_10$ambma_10,m4c_10$pred_ambma_m4),
  cor(m5c_10$ambma_10,m5c_10$pred_ambma_m5),
  cor(m6c_10$ambma_10,m6c_10$pred_ambma_m6),
  
  cor(m1c_1$derva_1,m1c_1$pred_derva_m1),
  cor(m2c_1$derva_1,m2c_1$pred_derva_m2),
  cor(m3c_1$derva_1,m3c_1$pred_derva_m3),
  cor(m4c_1$derva_1,m4c_1$pred_derva_m4),
  cor(m5c_1$derva_1,m5c_1$pred_derva_m5),
  cor(m6c_1$derva_1,m6c_1$pred_derva_m6),
  
  cor(m1c_2$derva_2,m1c_2$pred_derva_m1),
  cor(m2c_2$derva_2,m2c_2$pred_derva_m2),
  cor(m3c_2$derva_2,m3c_2$pred_derva_m3),
  cor(m4c_2$derva_2,m4c_2$pred_derva_m4),
  cor(m5c_2$derva_2,m5c_2$pred_derva_m5),
  cor(m6c_2$derva_2,m6c_2$pred_derva_m6),
  
  cor(m1c_3$derva_3,m1c_3$pred_derva_m1),
  cor(m2c_3$derva_3,m2c_3$pred_derva_m2),
  cor(m3c_3$derva_3,m3c_3$pred_derva_m3),
  cor(m4c_3$derva_3,m4c_3$pred_derva_m4),
  cor(m5c_3$derva_3,m5c_3$pred_derva_m5),
  cor(m6c_3$derva_3,m6c_3$pred_derva_m6),
  
  cor(m1c_4$derva_4,m1c_4$pred_derva_m1),
  cor(m2c_4$derva_4,m2c_4$pred_derva_m2),
  cor(m3c_4$derva_4,m3c_4$pred_derva_m3),
  cor(m4c_4$derva_4,m4c_4$pred_derva_m4),
  cor(m5c_4$derva_4,m5c_4$pred_derva_m5),
  cor(m6c_4$derva_4,m6c_4$pred_derva_m6),
  
  cor(m1c_5$derva_5,m1c_5$pred_derva_m1),
  cor(m2c_5$derva_5,m2c_5$pred_derva_m2),
  cor(m3c_5$derva_5,m3c_5$pred_derva_m3),
  cor(m4c_5$derva_5,m4c_5$pred_derva_m4),
  cor(m5c_5$derva_5,m5c_5$pred_derva_m5),
  cor(m6c_5$derva_5,m6c_5$pred_derva_m6),
  
  cor(m1c_6$derva_6,m1c_6$pred_derva_m1),
  cor(m2c_6$derva_6,m2c_6$pred_derva_m2),
  cor(m3c_6$derva_6,m3c_6$pred_derva_m3),
  cor(m4c_6$derva_6,m4c_6$pred_derva_m4),
  cor(m5c_6$derva_6,m5c_6$pred_derva_m5),
  cor(m6c_6$derva_6,m6c_6$pred_derva_m6),
  
  cor(m1c_7$derva_7,m1c_7$pred_derva_m1),
  cor(m2c_7$derva_7,m2c_7$pred_derva_m2),
  cor(m3c_7$derva_7,m3c_7$pred_derva_m3),
  cor(m4c_7$derva_7,m4c_7$pred_derva_m4),
  cor(m5c_7$derva_7,m5c_7$pred_derva_m5),
  cor(m6c_7$derva_7,m6c_7$pred_derva_m6),
  
  cor(m1c_8$derva_8,m1c_8$pred_derva_m1),
  cor(m2c_8$derva_8,m2c_8$pred_derva_m2),
  cor(m3c_8$derva_8,m3c_8$pred_derva_m3),
  cor(m4c_8$derva_8,m4c_8$pred_derva_m4),
  cor(m5c_8$derva_8,m5c_8$pred_derva_m5),
  cor(m6c_8$derva_8,m6c_8$pred_derva_m6),
  
  cor(m1c_9$derva_9,m1c_9$pred_derva_m1),
  cor(m2c_9$derva_9,m2c_9$pred_derva_m2),
  cor(m3c_9$derva_9,m3c_9$pred_derva_m3),
  cor(m4c_9$derva_9,m4c_9$pred_derva_m4),
  cor(m5c_9$derva_9,m5c_9$pred_derva_m5),
  cor(m6c_9$derva_9,m6c_9$pred_derva_m6),
  
  cor(m1c_10$derva_10,m1c_10$pred_derva_m1),
  cor(m2c_10$derva_10,m2c_10$pred_derva_m2),
  cor(m3c_10$derva_10,m3c_10$pred_derva_m3),
  cor(m4c_10$derva_10,m4c_10$pred_derva_m4),
  cor(m5c_10$derva_10,m5c_10$pred_derva_m5),
  cor(m6c_10$derva_10,m6c_10$pred_derva_m6),
  
  cor(m1c_1$ixosc_1,m1c_1$pred_ixosc_m1),
  cor(m2c_1$ixosc_1,m2c_1$pred_ixosc_m2),
  cor(m3c_1$ixosc_1,m3c_1$pred_ixosc_m3),
  cor(m4c_1$ixosc_1,m4c_1$pred_ixosc_m4),
  cor(m5c_1$ixosc_1,m5c_1$pred_ixosc_m5),
  cor(m6c_1$ixosc_1,m6c_1$pred_ixosc_m6),
  
  cor(m1c_2$ixosc_2,m1c_2$pred_ixosc_m1),
  cor(m2c_2$ixosc_2,m2c_2$pred_ixosc_m2),
  cor(m3c_2$ixosc_2,m3c_2$pred_ixosc_m3),
  cor(m4c_2$ixosc_2,m4c_2$pred_ixosc_m4),
  cor(m5c_2$ixosc_2,m5c_2$pred_ixosc_m5),
  cor(m6c_2$ixosc_2,m6c_2$pred_ixosc_m6),
  
  cor(m1c_3$ixosc_3,m1c_3$pred_ixosc_m1),
  cor(m2c_3$ixosc_3,m2c_3$pred_ixosc_m2),
  cor(m3c_3$ixosc_3,m3c_3$pred_ixosc_m3),
  cor(m4c_3$ixosc_3,m4c_3$pred_ixosc_m4),
  cor(m5c_3$ixosc_3,m5c_3$pred_ixosc_m5),
  cor(m6c_3$ixosc_3,m6c_3$pred_ixosc_m6),
  
  cor(m1c_4$ixosc_4,m1c_4$pred_ixosc_m1),
  cor(m2c_4$ixosc_4,m2c_4$pred_ixosc_m2),
  cor(m3c_4$ixosc_4,m3c_4$pred_ixosc_m3),
  cor(m4c_4$ixosc_4,m4c_4$pred_ixosc_m4),
  cor(m5c_4$ixosc_4,m5c_4$pred_ixosc_m5),
  cor(m6c_4$ixosc_4,m6c_4$pred_ixosc_m6),
  
  cor(m1c_5$ixosc_5,m1c_5$pred_ixosc_m1),
  cor(m2c_5$ixosc_5,m2c_5$pred_ixosc_m2),
  cor(m3c_5$ixosc_5,m3c_5$pred_ixosc_m3),
  cor(m4c_5$ixosc_5,m4c_5$pred_ixosc_m4),
  cor(m5c_5$ixosc_5,m5c_5$pred_ixosc_m5),
  cor(m6c_5$ixosc_5,m6c_5$pred_ixosc_m6),
  
  cor(m1c_6$ixosc_6,m1c_6$pred_ixosc_m1),
  cor(m2c_6$ixosc_6,m2c_6$pred_ixosc_m2),
  cor(m3c_6$ixosc_6,m3c_6$pred_ixosc_m3),
  cor(m4c_6$ixosc_6,m4c_6$pred_ixosc_m4),
  cor(m5c_6$ixosc_6,m5c_6$pred_ixosc_m5),
  cor(m6c_6$ixosc_6,m6c_6$pred_ixosc_m6),
  
  cor(m1c_7$ixosc_7,m1c_7$pred_ixosc_m1),
  cor(m2c_7$ixosc_7,m2c_7$pred_ixosc_m2),
  cor(m3c_7$ixosc_7,m3c_7$pred_ixosc_m3),
  cor(m4c_7$ixosc_7,m4c_7$pred_ixosc_m4),
  cor(m5c_7$ixosc_7,m5c_7$pred_ixosc_m5),
  cor(m6c_7$ixosc_7,m6c_7$pred_ixosc_m6),
  
  cor(m1c_8$ixosc_8,m1c_8$pred_ixosc_m1),
  cor(m2c_8$ixosc_8,m2c_8$pred_ixosc_m2),
  cor(m3c_8$ixosc_8,m3c_8$pred_ixosc_m3),
  cor(m4c_8$ixosc_8,m4c_8$pred_ixosc_m4),
  cor(m5c_8$ixosc_8,m5c_8$pred_ixosc_m5),
  cor(m6c_8$ixosc_8,m6c_8$pred_ixosc_m6),
  
  cor(m1c_9$ixosc_9,m1c_9$pred_ixosc_m1),
  cor(m2c_9$ixosc_9,m2c_9$pred_ixosc_m2),
  cor(m3c_9$ixosc_9,m3c_9$pred_ixosc_m3),
  cor(m4c_9$ixosc_9,m4c_9$pred_ixosc_m4),
  cor(m5c_9$ixosc_9,m5c_9$pred_ixosc_m5),
  cor(m6c_9$ixosc_9,m6c_9$pred_ixosc_m6),
  
  cor(m1c_10$ixosc_10,m1c_10$pred_ixosc_m1),
  cor(m2c_10$ixosc_10,m2c_10$pred_ixosc_m2),
  cor(m3c_10$ixosc_10,m3c_10$pred_ixosc_m3),
  cor(m4c_10$ixosc_10,m4c_10$pred_ixosc_m4),
  cor(m5c_10$ixosc_10,m5c_10$pred_ixosc_m5),
  cor(m6c_10$ixosc_10,m6c_10$pred_ixosc_m6)
)

write.csv(r2_train,"/Users/stacymowry/Desktop/train_r2_m1_m6.csv")
