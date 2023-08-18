library(raster)
library(caret)


data_s<-read.csv("/Users/stacymowry/Desktop/Fl_V2/fl2_grid_covars_scaled_newpoints.csv")

dtw = data_s$dtw
tmax = data_s$tmax
phdi = data_s$PHDI_average
ndvi = data_s$ndvi
prcp = data_s$prcp
urban = data_s$landcover_1
data_s$urban = data_s$landcover_1
crop = data_s$landcover_2
GS = data_s$landcover_5 + data_s$landcover_7
forest = data_s$landcover_6 + data_s$landcover_11 + data_s$landcover_14 + data_s$landcover_15
wetland = data_s$landcover_18 


pred.m1<-function(data_s,file_out)
{
  m1.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/samples/m1path_shared.mcmc.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m1.mcmc),6)) 
  
  for (i in 1:nrow(m1.mcmc))
  {
    for (j in 1:6)
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
        )*ifelse(j==4,1,0) +
        (m1.mcmc$b_0.5[i] + m1.mcmc$b_1.5[i]*dtw + m1.mcmc$b_2.5[i]*tmax + m1.mcmc$b_3.5[i]*phdi 
         + m1.mcmc$b_4.5[i]*ndvi + m1.mcmc$b_5.5[i]*prcp + m1.mcmc$b_6.5[i]*urban 
         + m1.mcmc$b_7.5[i]*crop  + m1.mcmc$b_9.5[i]*forest + m1.mcmc$b_10.5[i]*wetland
        )*ifelse(j==5,1,0)+
        (m1.mcmc$b_0.6[i] + m1.mcmc$b_1.6[i]*dtw + m1.mcmc$b_2.6[i]*tmax + m1.mcmc$b_3.6[i]*phdi 
         + m1.mcmc$b_4.6[i]*ndvi + m1.mcmc$b_5.6[i]*prcp + m1.mcmc$b_6.6[i]*urban 
         + m1.mcmc$b_7.6[i]*crop  + m1.mcmc$b_9.6[i]*forest + m1.mcmc$b_10.6[i]*wetland
        )*ifelse(j==6,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,6)) 
  diff<-array(numeric(),c(nrow(data_s),1,6))
  mean<-array(numeric(),c(nrow(data_s),1,6))
  
  for (j in 1 : 6)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975),na.rm=TRUE)
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m1<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4], mean[c(1:nrow(data_s)),1,5], mean[c(1:nrow(data_s)),1,6])
  
  unc_m1<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4], diff[c(1:nrow(data_s)),1,5], diff[c(1:nrow(data_s)),1,6])
  
  colnames(pred_m1) <- c("pred_ambam_m1", "pred_ambma_m1", "pred_derva_m1", "pred_ixoaf_m1", "pred_ixosc_m1", "pred_rhisa_m1")
  colnames(unc_m1) <- c("unc_ambam_m1", "unc_ambma_m1", "unc_derva_m1", "unc_ixoaf_m1", "unc_ixosc_m1", "unc_rhisa_m1")
  
  data_s<-cbind(data_s,pred_m1, unc_m1)
  write.csv(data_s,file_out)
}

##M2

pred.m2<-function(data_s,file_out)
{
  m2.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/samples/m2path_shared.mcmc.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m2.mcmc),6)) 
  
  for (i in 1:nrow(m2.mcmc))
  {
    for (j in 1:6)
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
        )*ifelse(j==4,1,0) +
        (m2.mcmc$b_0.5[i] + m2.mcmc$b_1.5[i]*dtw + m2.mcmc$b_2.5[i]*tmax + m2.mcmc$b_3.5[i]*phdi 
         + m2.mcmc$b_4.5[i]*ndvi + m2.mcmc$b_5.5[i]*prcp + m2.mcmc$b_6.5[i]*urban 
         + m2.mcmc$b_7.5[i]*crop  + m2.mcmc$b_9.5[i]*forest + m2.mcmc$b_10.5[i]*wetland
        )*ifelse(j==5,1,0)+
        (m2.mcmc$b_0.6[i] + m2.mcmc$b_1.6[i]*dtw + m2.mcmc$b_2.6[i]*tmax + m2.mcmc$b_3.6[i]*phdi 
         + m2.mcmc$b_4.6[i]*ndvi + m2.mcmc$b_5.6[i]*prcp + m2.mcmc$b_6.6[i]*urban 
         + m2.mcmc$b_7.6[i]*crop  + m2.mcmc$b_9.6[i]*forest + m2.mcmc$b_10.6[i]*wetland
        )*ifelse(j==6,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
      
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,6)) 
  diff<-array(numeric(),c(nrow(data_s),1,6))
  mean<-array(numeric(),c(nrow(data_s),1,6))
  
  for (j in 1 : 6)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,6)) 
  diff<-array(numeric(),c(nrow(data_s),1,6))
  mean<-array(numeric(),c(nrow(data_s),1,6))
  
  for (j in 1 : 6)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-quantile(unc_full[n,,j], probs = 0.5)
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m2<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4], mean[c(1:nrow(data_s)),1,5], mean[c(1:nrow(data_s)),1,6])
  
  unc_m2<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4], diff[c(1:nrow(data_s)),1,5], diff[c(1:nrow(data_s)),1,6])
  
  colnames(pred_m2) <- c("pred_ambam_m2", "pred_ambma_m2", "pred_derva_m2", "pred_ixoaf_m2", "pred_ixosc_m2", "pred_rhisa_m2")
  colnames(unc_m2) <- c("unc_ambam_m2", "unc_ambma_m2", "unc_derva_m2", "unc_ixoaf_m2", "unc_ixosc_m2", "unc_rhisa_m2")
  
  data_s<-cbind(data_s,pred_m2, unc_m2)
  write.csv(data_s,file_out)
}


##M3

pred.m3<-function(data_s,file_out)
{
  m3.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/samples/m3path_shared.mcmc.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m3.mcmc),6)) 
  
  for (i in 1:nrow(m3.mcmc))
  {
    for (j in 1:6)
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
        )*ifelse(j==4,1,0) +
        (m3.mcmc$b_0.5[i] + m3.mcmc$b_1.5[i]*dtw + m3.mcmc$b_2.5[i]*tmax + m3.mcmc$b_3.5[i]*phdi 
         + m3.mcmc$b_4.5[i]*ndvi + m3.mcmc$b_5.5[i]*prcp + m3.mcmc$b_6.5[i]*urban 
         + m3.mcmc$b_7.5[i]*crop  + m3.mcmc$b_9.5[i]*forest + m3.mcmc$b_10.5[i]*wetland
        )*ifelse(j==5,1,0)+
        (m3.mcmc$b_0.6[i] + m3.mcmc$b_1.6[i]*dtw + m3.mcmc$b_2.6[i]*tmax + m3.mcmc$b_3.6[i]*phdi 
         + m3.mcmc$b_4.6[i]*ndvi + m3.mcmc$b_5.6[i]*prcp + m3.mcmc$b_6.6[i]*urban 
         + m3.mcmc$b_7.6[i]*crop  + m3.mcmc$b_9.6[i]*forest + m3.mcmc$b_10.6[i]*wetland
        )*ifelse(j==6,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  quants<-array(numeric(),c(nrow(data_s),2,6)) 
  diff<-array(numeric(),c(nrow(data_s),1,6))
  mean<-array(numeric(),c(nrow(data_s),1,6))
  
  for (j in 1 : 6)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m3<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                  mean[c(1:nrow(data_s)),1,4], mean[c(1:nrow(data_s)),1,5], mean[c(1:nrow(data_s)),1,6])
  
  unc_m3<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                 diff[c(1:nrow(data_s)),1,4], diff[c(1:nrow(data_s)),1,5], diff[c(1:nrow(data_s)),1,6])
  
  colnames(pred_m3) <- c("pred_ambam_m3", "pred_ambma_m3", "pred_derva_m3", "pred_ixoaf_m3", "pred_ixosc_m3", "pred_rhisa_m3")
  colnames(unc_m3) <- c("unc_ambam_m3", "unc_ambma_m3", "unc_derva_m3", "unc_ixoaf_m3", "unc_ixosc_m3", "unc_rhisa_m3")
  
  data_s<-cbind(data_s,pred_m3, unc_m3)
  write.csv(data_s,file_out)
}

##M4 

pred.m4<-function(data_s,file_out)
{
  m4.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/samples/m4path_shared.mcmc.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m4.mcmc),6)) 
  
  
  for (i in 1:nrow(m4.mcmc))
  {
    for (j in 1:6)
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
                + m4.mcmc$e.4[i])*ifelse(j==4,1,0) +
               (m4.mcmc$b_0.3[i] + m4.mcmc$b_1.3[i]*dtw + m4.mcmc$b_2.3[i]*tmax + m4.mcmc$b_3.3[i]*phdi 
                + m4.mcmc$b_4.3[i]*ndvi + m4.mcmc$b_5.3[i]*prcp + m4.mcmc$b_6.3[i]*urban 
                + m4.mcmc$b_7.3[i]*crop  + m4.mcmc$b_9.3[i]*forest + m4.mcmc$b_10.3[i]*wetland
                + m4.mcmc$e.5[i])*ifelse(j==5,1,0) +
               (m4.mcmc$b_0.4[i] + m4.mcmc$b_1.4[i]*dtw + m4.mcmc$b_2.4[i]*tmax + m4.mcmc$b_3.4[i]*phdi 
                + m4.mcmc$b_4.4[i]*ndvi + m4.mcmc$b_5.4[i]*prcp + m4.mcmc$b_6.4[i]*urban 
                + m4.mcmc$b_7.4[i]*crop  + m4.mcmc$b_9.4[i]*forest + m4.mcmc$b_10.4[i]*wetland
                + m4.mcmc$e.6[i])*ifelse(j==6,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  
  quants<-array(numeric(),c(nrow(data_s),2,6)) 
  diff<-array(numeric(),c(nrow(data_s),1,6))
  mean<-array(numeric(),c(nrow(data_s),1,6))
  
  for (j in 1 : 6)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m4<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4], mean[c(1:nrow(data_s)),1,5], mean[c(1:nrow(data_s)),1,6])
  
  unc_m4<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4], diff[c(1:nrow(data_s)),1,5], diff[c(1:nrow(data_s)),1,6])
  
  colnames(pred_m4) <- c("pred_ambam_m4", "pred_ambma_m4", "pred_derva_m4", "pred_ixoaf_m4", "pred_ixosc_m4", "pred_rhisa_m4")
  colnames(unc_m4) <- c("unc_ambam_m4", "unc_ambma_m4", "unc_derva_m4", "unc_ixoaf_m4", "unc_ixosc_m4", "unc_rhisa_m4")
  
  data_s<-cbind(data_s,pred_m4, unc_m4)
  write.csv(data_s,file_out)
}

##M5

pred.m5<-function(data_s,file_out)
{
  m5.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/samples/m5path_shared.mcmc.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m5.mcmc),6)) 
  
  
  for (i in 1:nrow(m5.mcmc))
  {
    for (j in 1:6)
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
                + m5.mcmc$e.4[i])*ifelse(j==4,1,0) +
               (m5.mcmc$b_0.3[i] + m5.mcmc$b_1.3[i]*dtw + m5.mcmc$b_2.3[i]*tmax + m5.mcmc$b_3.3[i]*phdi 
                + m5.mcmc$b_4.3[i]*ndvi + m5.mcmc$b_5.3[i]*prcp + m5.mcmc$b_6.3[i]*urban 
                + m5.mcmc$b_7.3[i]*crop  + m5.mcmc$b_9.3[i]*forest + m5.mcmc$b_10.3[i]*wetland
                + m5.mcmc$e.5[i])*ifelse(j==5,1,0) +
               (m5.mcmc$b_0.4[i] + m5.mcmc$b_1.4[i]*dtw + m5.mcmc$b_2.4[i]*tmax + m5.mcmc$b_3.4[i]*phdi 
                + m5.mcmc$b_4.4[i]*ndvi + m5.mcmc$b_5.4[i]*prcp + m5.mcmc$b_6.4[i]*urban 
                + m5.mcmc$b_7.4[i]*crop  + m5.mcmc$b_9.4[i]*forest + m5.mcmc$b_10.4[i]*wetland
                + m5.mcmc$e.6[i])*ifelse(j==6,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  
  quants<-array(numeric(),c(nrow(data_s),2,6)) 
  diff<-array(numeric(),c(nrow(data_s),1,6))
  mean<-array(numeric(),c(nrow(data_s),1,6))
  
  for (j in 1 : 6)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m5<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4], mean[c(1:nrow(data_s)),1,5], mean[c(1:nrow(data_s)),1,6])
  
  unc_m5<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4], diff[c(1:nrow(data_s)),1,5], diff[c(1:nrow(data_s)),1,6])
  
  colnames(pred_m5) <- c("pred_ambam_m5", "pred_ambma_m5", "pred_derva_m5", "pred_ixoaf_m5", "pred_ixosc_m5", "pred_rhisa_m5")
  colnames(unc_m5) <- c("unc_ambam_m5", "unc_ambma_m5", "unc_derva_m5", "unc_ixoaf_m5", "unc_ixosc_m5", "unc_rhisa_m5")
  
  data_s<-cbind(data_s,pred_m5, unc_m5)
  write.csv(data_s,file_out)
}


##M6

pred.m6<-function(data_s,file_out)
{
  m6.mcmc<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/samples/m6path_shared.mcmc.csv")
  
  unc_full<-array(numeric(),c(nrow(data_s),nrow(m6.mcmc),6)) 
  
  
  for (i in 1:nrow(m6.mcmc))
  {
    for (j in 1:6)
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
                + m6.mcmc$e.4[i] )*ifelse(j==4,1,0) +
               (m6.mcmc$b_0[i] + m6.mcmc$b_1[i]*dtw + m6.mcmc$b_2[i]*tmax + m6.mcmc$b_3[i]*phdi 
                + m6.mcmc$b_4[i]*ndvi + m6.mcmc$b_5[i]*prcp + m6.mcmc$b_6[i]*urban 
                + m6.mcmc$b_7[i]*crop  + m6.mcmc$b_9[i]*forest + m6.mcmc$b_10[i]*wetland
                + m6.mcmc$e.5[i])*ifelse(j==5,1,0) +
               (m6.mcmc$b_0[i] + m6.mcmc$b_1[i]*dtw + m6.mcmc$b_2[i]*tmax + m6.mcmc$b_3[i]*phdi 
                + m6.mcmc$b_4[i]*ndvi + m6.mcmc$b_5[i]*prcp + m6.mcmc$b_6[i]*urban 
                + m6.mcmc$b_7[i]*crop  + m6.mcmc$b_9[i]*forest + m6.mcmc$b_10[i]*wetland
                + m6.mcmc$e.6[i])*ifelse(j==6,1,0))
      est<-exp(est)/(1+exp(est))
      unc_full[,i,j]<-est
    }
  }
  
  
  quants<-array(numeric(),c(nrow(data_s),2,6)) 
  diff<-array(numeric(),c(nrow(data_s),1,6))
  mean<-array(numeric(),c(nrow(data_s),1,6))
  
  for (j in 1 : 6)
  {
    for (n in 1: nrow(data_s))
    {
      quants[n,,j]<-quantile(unc_full[n,,j], probs = c(0.025, 0.975))
      mean[n,1,j]<-mean(unc_full[n,,j])
      diff[n,1,j] <- quants[n,2,j] - quants[n,1,j]
    }
  }
  
  pred_m6<-cbind(mean[c(1:nrow(data_s)),1,1],mean[c(1:nrow(data_s)),1,2],mean[c(1:nrow(data_s)),1,3],
                 mean[c(1:nrow(data_s)),1,4], mean[c(1:nrow(data_s)),1,5], mean[c(1:nrow(data_s)),1,6])
  
  unc_m6<-cbind(diff[c(1:nrow(data_s)),1,1],diff[c(1:nrow(data_s)),1,2],diff[c(1:nrow(data_s)),1,3],
                diff[c(1:nrow(data_s)),1,4], diff[c(1:nrow(data_s)),1,5], diff[c(1:nrow(data_s)),1,6])
  
  colnames(pred_m6) <- c("pred_ambam_m6", "pred_ambma_m6", "pred_derva_m6", "pred_ixoaf_m6", "pred_ixosc_m6", "pred_rhisa_m6")
  colnames(unc_m6) <- c("unc_ambam_m6", "unc_ambma_m6", "unc_derva_m6", "unc_ixoaf_m6", "unc_ixosc_m6", "unc_rhisa_m6")
  
  data_s<-cbind(data_s,pred_m6, unc_m6)
  write.csv(data_s,file_out)
}




##Run functions
pred.m1(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/predictions/full/m1_preds_empirical.csv")
pred.m2(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/predictions/full/m2_preds_empirical.csv")
pred.m3(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/predictions/full/m3_preds_empirical.csv")
pred.m4(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/predictions/full/m4_preds_empirical.csv")
pred.m5(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/predictions/full/m5_preds_empirical.csv")
pred.m6(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/predictions/full/m6_preds_empirical.csv")

################################################################################CREATE MAPS

m1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/m7_preds_empirical.csv")
m2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/m8_preds_empirical.csv")
m2b<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/m9_preds_empirical.csv")
m3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/m10_preds_empirical.csv")
m4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/m11_preds_empirical.csv")
m5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/m12_preds_empirical.csv")



pred_ambam_m1<-m1$pred_ambam_m1
pred_ambma_m1<-m1$pred_ambma_m1
pred_derva_m1<-m1$pred_derva_m1
pred_ixoaf_m1<-m1$pred_ixoaf_m1
pred_ixosc_m1<-m1$pred_ixosc_m1
pred_rhisa_m1<-m1$pred_rhisa_m1

unc_ambam_m1<-m1$unc_ambam_m1
unc_ambma_m1<-m1$unc_ambma_m1
unc_derva_m1<-m1$unc_derva_m1
unc_ixoaf_m1<-m1$unc_ixoaf_m1
unc_ixosc_m1<-m1$unc_ixosc_m1
unc_rhisa_m1<-m1$unc_rhisa_m1

pred_ambam_m2<-m2$pred_ambam_m2
pred_ambma_m2<-m2$pred_ambma_m2
pred_derva_m2<-m2$pred_derva_m2
pred_ixoaf_m2<-m2$pred_ixoaf_m2
pred_ixosc_m2<-m2$pred_ixosc_m2
pred_rhisa_m2<-m2$pred_rhisa_m2

unc_ambam_m2<-m2$unc_ambam_m2
unc_ambma_m2<-m2$unc_ambma_m2
unc_derva_m2<-m2$unc_derva_m2
unc_ixoaf_m2<-m2$unc_ixoaf_m2
unc_ixosc_m2<-m2$unc_ixosc_m2
unc_rhisa_m2<-m2$unc_rhisa_m2

pred_ambam_m2b<-m2b$pred_ambam_m2b
pred_ambma_m2b<-m2b$pred_ambma_m2b
pred_derva_m2b<-m2b$pred_derva_m2b
pred_ixoaf_m2b<-m2b$pred_ixoaf_m2b
pred_ixosc_m2b<-m2b$pred_ixosc_m2b
pred_rhisa_m2b<-m2b$pred_rhisa_m2b

unc_ambam_m2b<-m2b$unc_ambam_m2b
unc_ambma_m2b<-m2b$unc_ambma_m2b
unc_derva_m2b<-m2b$unc_derva_m2b
unc_ixoaf_m2b<-m2b$unc_ixoaf_m2b
unc_ixosc_m2b<-m2b$unc_ixosc_m2b
unc_rhisa_m2b<-m2b$unc_rhisa_m2b

pred_ambam_m3<-m3$pred_ambam_m3
pred_ambma_m3<-m3$pred_ambma_m3
pred_derva_m3<-m3$pred_derva_m3
pred_ixoaf_m3<-m3$pred_ixoaf_m3
pred_ixosc_m3<-m3$pred_ixosc_m3
pred_rhisa_m3<-m3$pred_rhisa_m3

unc_ambam_m3<-m3$unc_ambam_m3
unc_ambma_m3<-m3$unc_ambma_m3
unc_derva_m3<-m3$unc_derva_m3
unc_ixoaf_m3<-m3$unc_ixoaf_m3
unc_ixosc_m3<-m3$unc_ixosc_m3
unc_rhisa_m3<-m3$unc_rhisa_m3

pred_ambam_m4<-m4$pred_ambam_m4
pred_ambma_m4<-m4$pred_ambma_m4
pred_derva_m4<-m4$pred_derva_m4
pred_ixoaf_m4<-m4$pred_ixoaf_m4
pred_ixosc_m4<-m4$pred_ixosc_m4
pred_rhisa_m4<-m4$pred_rhisa_m4

unc_ambam_m4<-m4$unc_ambam_m4
unc_ambma_m4<-m4$unc_ambma_m4
unc_derva_m4<-m4$unc_derva_m4
unc_ixoaf_m4<-m4$unc_ixoaf_m4
unc_ixosc_m4<-m4$unc_ixosc_m4
unc_rhisa_m4<-m4$unc_rhisa_m4

pred_ambam_m5<-m5$pred_ambam_m5
pred_ambma_m5<-m5$pred_ambma_m5
pred_derva_m5<-m5$pred_derva_m5
pred_ixoaf_m5<-m5$pred_ixoaf_m5
pred_ixosc_m5<-m5$pred_ixosc_m5
pred_rhisa_m5<-m5$pred_rhisa_m5

unc_ambam_m5<-m5$unc_ambam_m5
unc_ambma_m5<-m5$unc_ambma_m5
unc_derva_m5<-m5$unc_derva_m5
unc_ixoaf_m5<-m5$unc_ixoaf_m5
unc_ixosc_m5<-m5$unc_ixosc_m5
unc_rhisa_m5<-m5$unc_rhisa_m5

preds<-cbind(pred_ambam_m1,pred_ambma_m1,pred_derva_m1,pred_ixoaf_m1,pred_ixosc_m1,pred_rhisa_m1,
             unc_ambam_m1,unc_ambma_m1,unc_derva_m1,unc_ixoaf_m1,unc_ixosc_m1,unc_rhisa_m1,
             pred_ambam_m2,pred_ambma_m2,pred_derva_m2,pred_ixoaf_m2,pred_ixosc_m2,pred_rhisa_m2,
             unc_ambam_m2,unc_ambma_m2,unc_derva_m2,unc_ixoaf_m2,unc_ixosc_m2,unc_rhisa_m2,
             pred_ambam_m2b,pred_ambma_m2b,pred_derva_m2b,pred_ixoaf_m2b,pred_ixosc_m2b,pred_rhisa_m2b,
             unc_ambam_m2b,unc_ambma_m2b,unc_derva_m2b,unc_ixoaf_m2b,unc_ixosc_m2b,unc_rhisa_m2b,
             pred_ambam_m3,pred_ambma_m3,pred_derva_m3,pred_ixoaf_m3,pred_ixosc_m3,pred_rhisa_m3,
             unc_ambam_m3,unc_ambma_m3,unc_derva_m3,unc_ixoaf_m3,unc_ixosc_m3,unc_rhisa_m3,
             pred_ambam_m4,pred_ambma_m4,pred_derva_m4,pred_ixoaf_m4,pred_ixosc_m4,pred_rhisa_m4,
             unc_ambam_m4,unc_ambma_m4,unc_derva_m4,unc_ixoaf_m4,unc_ixosc_m4,unc_rhisa_m4,
             pred_ambam_m5,pred_ambma_m5,pred_derva_m5,pred_ixoaf_m5,pred_ixosc_m5,pred_rhisa_m5,
             unc_ambam_m5,unc_ambma_m5,unc_derva_m5,unc_ixoaf_m5,unc_ixosc_m5,unc_rhisa_m5)

data_s<-cbind(data_s,preds)

write.csv(data_s,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/all_preds_m7_m12_emp.csv")

outline<-read.csv("/Users/stacymowry/Desktop/Research/REDI-NET/data_outputs/grids/Fl/gridsp.csv")

ouline_r<- rasterFromXYZ(outline[, c('x1', 'x2', 'out')])
unc_ambam_r <- rasterFromXYZ(data_s[, c('x', 'y', 'unc_ambam_m5')])
ambam_r <- rasterFromXYZ(data_s[, c('x', 'y', 'pred_ambam_m5')])
unc_ambma_r <- rasterFromXYZ(data_s[, c('x', 'y', 'unc_ambma_m5')])
ambma_r <- rasterFromXYZ(data_s[, c('x', 'y', 'pred_ambma_m5')])
unc_derva_r <- rasterFromXYZ(data_s[, c('x', 'y', 'unc_derva_m5')])
derva_r <- rasterFromXYZ(data_s[, c('x', 'y', 'pred_derva_m5')])
unc_ixoaf_r <- rasterFromXYZ(data_s[, c('x', 'y', 'unc_ixoaf_m5')])
ixoaf_r <- rasterFromXYZ(data_s[, c('x', 'y', 'pred_ixoaf_m5')])
unc_ixosc_r <- rasterFromXYZ(data_s[, c('x', 'y', 'unc_ixosc_m5')])
ixosc_r <- rasterFromXYZ(data_s[, c('x', 'y', 'pred_ixosc_m5')])
unc_rhisa_r <- rasterFromXYZ(data_s[, c('x', 'y', 'unc_rhisa_m5')])
rhisa_r <- rasterFromXYZ(data_s[, c('x', 'y', 'pred_rhisa_m5')])


cuts_base=c(1) #set breaks
pal_base<- colorRampPalette(c("grey","grey"))

cuts=c(seq(.5,1,.05)) #set breaks
pal <- colorRampPalette(c("yellow","red"))

plot(ouline_r, col = "grey", legend = NULL)
plot(rhisa_r, add=TRUE)

## save rasters as output 

writeRaster(ambam_r,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/maps/m5_ambam.tif",overwrite=TRUE)
writeRaster(unc_ambam_r,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/maps/m5.unc_ambam.tif", overwrite = TRUE)


##Calculate accuracies

####################################################################################CALCULATE ACCURACY

#load in test data
test.in<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/train_test_data/fl2_test_newpoints.csv")
test.in<-subset(test.in,landcover_16 != 1 )

#name variables 
test.in$forest = test.in$landcover_6 + test.in$landcover_14 
test.in$wetland = test.in$landcover_18 
test.in$GS = test.in$landcover_5 + test.in$landcover_7 
test.in$urban = test.in$landcover_1
test.in$crop = test.in$landcover_2

dtw = test.in$dtw
tmax = test.in$tmax
phdi = test.in$PHDI_average
ndvi = test.in$ndvi
prcp = test.in$prcp
urban = test.in$landcover_1
crop = test.in$landcover_2
GS = test.in$landcover_5 + test.in$landcover_7
forest = test.in$landcover_6 + test.in$landcover_14  
wetland = test.in$landcover_18 

#make predictions for each model
pred.m1(test.in,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/preds_m7_test_b.csv")
pred.m2(test.in,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/preds_m8_test_b.csv")
pred.m3(test.in,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/preds_m9_test_b.csv")
pred.m4(test.in,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/preds_m10_test_b.csv")
pred.m5(test.in,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/preds_m11_test_b.csv")
pred.m6(test.in,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/preds_m12_test_b.csv")


#load in predictions
pred.m1.in<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/test/preds_m7_test.csv")
pred.m2.in<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/test/preds_m8_test.csv")
pred.m3.in<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/test/preds_m9_test.csv")
pred.m4.in<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/test/preds_m10_test.csv")
pred.m5.in<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/test/preds_m11_test.csv")
pred.m6.in<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/test/preds_m12_test.csv")


#confusion matrix for each species

pred.m1.in.ambam<-subset(pred.m1.in, ambam == 1)
pred.m1.in.ambma<-subset(pred.m1.in, ambma == 1)
pred.m1.in.derva<-subset(pred.m1.in, derva == 1)
pred.m1.in.ixoaf<-subset(pred.m1.in, ixoaf == 1)
pred.m1.in.ixosc<-subset(pred.m1.in, ixosc == 1)
pred.m1.in.rhisa<-subset(pred.m1.in, rhisa == 1)

#for m1

pred.in.ambam.m1<-confusionMatrix(as.factor(round(pred.m1.in.ambam$pred_ambam_m1)), as.factor(pred.m1.in.ambam$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambam.m1<-as.matrix(pred.in.ambam.m1,what="overall")

pred.in.ambma.m1<-confusionMatrix(as.factor(round(pred.m1.in.ambma$pred_ambma_m1)), as.factor(pred.m1.in.ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambma.m1<-as.matrix(pred.in.ambma.m1,what="overall")

pred.in.derva.m1<-confusionMatrix(as.factor(round(pred.m1.in.derva$pred_derva_m1)), as.factor(pred.m1.in.derva$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.derva.m1<-as.matrix(pred.in.derva.m1,what="overall")

pred.in.ixoaf.m1<-confusionMatrix(as.factor(round(pred.m1.in.ixoaf$pred_ixoaf_m1)), as.factor(pred.m1.in.ixoaf$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixoaf.m1<-as.matrix(pred.in.ixoaf.m1,what="overall")

pred.in.ixosc.m1<-confusionMatrix(as.factor(round(pred.m1.in.ixosc$pred_ixosc_m1)), as.factor(pred.m1.in.ixosc$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixosc.m1<-as.matrix(pred.in.ixosc.m1,what="overall")

pred.in.rhisa.m1<-confusionMatrix(as.factor(round(pred.m1.in.rhisa$pred_rhisa_m1)), as.factor(pred.m1.in.rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.rhisa.m1<-as.matrix(pred.in.rhisa.m1,what="overall")

m1.in.acc<-cbind(pred.in.ambam.m1,pred.in.ambma.m1,pred.in.derva.m1,pred.in.ixoaf.m1,pred.in.ixosc.m1,pred.in.rhisa.m1)

write.csv(m1.in.acc,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/accuracy/m1.train.acc.csv")

#for m2

pred.m2.in.ambam<-subset(pred.m2.in, ambam == 1)
pred.m2.in.ambma<-subset(pred.m2.in, ambma == 1)
pred.m2.in.derva<-subset(pred.m2.in, derva == 1)
pred.m2.in.ixoaf<-subset(pred.m2.in, ixoaf == 1)
pred.m2.in.ixosc<-subset(pred.m2.in, ixosc == 1)
pred.m2.in.rhisa<-subset(pred.m2.in, rhisa == 1)

pred.in.ambam.m2<-confusionMatrix(as.factor(round(pred.m2.in.ambam$pred_ambam_m2)), as.factor(pred.m2.in.ambam$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambam.m2<-as.matrix(pred.in.ambam.m2,what="overall")

pred.in.ambma.m2<-confusionMatrix(as.factor(round(pred.m2.in.ambma$pred_ambma_m2)), as.factor(pred.m2.in.ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambma.m2<-as.matrix(pred.in.ambma.m2,what="overall")

pred.in.derva.m2<-confusionMatrix(as.factor(round(pred.m2.in.derva$pred_derva_m2)), as.factor(pred.m2.in.derva$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.derva.m2<-as.matrix(pred.in.derva.m2,what="overall")

pred.in.ixoaf.m2<-confusionMatrix(as.factor(round(pred.m2.in.ixoaf$pred_ixoaf_m2)), as.factor(pred.m2.in.ixoaf$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixoaf.m2<-as.matrix(pred.in.ixoaf.m2,what="overall")

pred.in.ixosc.m2<-confusionMatrix(as.factor(round(pred.m2.in.ixosc$pred_ixosc_m2)), as.factor(pred.m2.in.ixosc$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixosc.m2<-as.matrix(pred.in.ixosc.m2,what="overall")

pred.in.rhisa.m2<-confusionMatrix(as.factor(round(pred.m2.in.rhisa$pred_rhisa_m2)), as.factor(pred.m2.in.rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.rhisa.m2<-as.matrix(pred.in.rhisa.m2,what="overall")

m2.in.acc<-cbind(pred.in.ambam.m2,pred.in.ambma.m2,pred.in.derva.m2,pred.in.ixoaf.m2,pred.in.ixosc.m2,pred.in.rhisa.m2)
write.csv(m2.in.acc,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/accuracy/m2.train.acc.csv")

#for m3


pred.m3.in.ambam<-subset(pred.m3.in, ambam == 1)
pred.m3.in.ambma<-subset(pred.m3.in, ambma == 1)
pred.m3.in.derva<-subset(pred.m3.in, derva == 1)
pred.m3.in.ixoaf<-subset(pred.m3.in, ixoaf == 1)
pred.m3.in.ixosc<-subset(pred.m3.in, ixosc == 1)
pred.m3.in.rhisa<-subset(pred.m3.in, rhisa == 1)


pred.in.ambam.m3<-confusionMatrix(as.factor(round(pred.m3.in.ambam$pred_ambam_m3)), as.factor(pred.m3.in.ambam$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambam.m3<-as.matrix(pred.in.ambam.m3,what="overall")

pred.in.ambma.m3<-confusionMatrix(as.factor(round(pred.m3.in.ambma$pred_ambma_m3)), as.factor(pred.m3.in.ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambma.m3<-as.matrix(pred.in.ambma.m3,what="overall")

pred.in.derva.m3<-confusionMatrix(as.factor(round(pred.m3.in.derva$pred_derva_m3)), as.factor(pred.m3.in.derva$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.derva.m3<-as.matrix(pred.in.derva.m3,what="overall")

pred.in.ixoaf.m3<-confusionMatrix(as.factor(round(pred.m3.in.ixoaf$pred_ixoaf_m3)), as.factor(pred.m3.in.ixoaf$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixoaf.m3<-as.matrix(pred.in.ixoaf.m3,what="overall")

pred.in.ixosc.m3<-confusionMatrix(as.factor(round(pred.m3.in.ixosc$pred_ixosc_m3)), as.factor(pred.m3.in.ixosc$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixosc.m3<-as.matrix(pred.in.ixosc.m3,what="overall")

pred.in.rhisa.m3<-confusionMatrix(as.factor(round(pred.m3.in.rhisa$pred_rhisa_m3)), as.factor(pred.m3.in.rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.rhisa.m3<-as.matrix(pred.in.rhisa.m3,what="overall")

m3.in.acc<-cbind(pred.in.ambam.m3,pred.in.ambma.m3,pred.in.derva.m3,pred.in.ixoaf.m3,pred.in.ixosc.m3,pred.in.rhisa.m3)
write.csv(m3.in.acc,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/accuracy/m3.train.acc.csv")

#for m4


pred.m4.in.ambam<-subset(pred.m4.in, ambam == 1)
pred.m4.in.ambma<-subset(pred.m4.in, ambma == 1)
pred.m4.in.derva<-subset(pred.m4.in, derva == 1)
pred.m4.in.ixoaf<-subset(pred.m4.in, ixoaf == 1)
pred.m4.in.ixosc<-subset(pred.m4.in, ixosc == 1)
pred.m4.in.rhisa<-subset(pred.m4.in, rhisa == 1)


pred.in.ambam.m4<-confusionMatrix(as.factor(round(pred.m4.in.ambam$pred_ambam_m4)), as.factor(pred.m4.in.ambam$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambam.m4<-as.matrix(pred.in.ambam.m4,what="overall")

pred.in.ambma.m4<-confusionMatrix(as.factor(round(pred.m4.in.ambma$pred_ambma_m4)), as.factor(pred.m4.in.ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambma.m4<-as.matrix(pred.in.ambma.m4,what="overall")

pred.in.derva.m4<-confusionMatrix(as.factor(round(pred.m4.in.derva$pred_derva_m4)), as.factor(pred.m4.in.derva$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.derva.m4<-as.matrix(pred.in.derva.m4,what="overall")

pred.in.ixoaf.m4<-confusionMatrix(as.factor(round(pred.m4.in.ixoaf$pred_ixoaf_m4)), as.factor(pred.m4.in.ixoaf$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixoaf.m4<-as.matrix(pred.in.ixoaf.m4,what="overall")

pred.in.ixosc.m4<-confusionMatrix(as.factor(round(pred.m4.in.ixosc$pred_ixosc_m4)), as.factor(pred.m4.in.ixosc$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixosc.m4<-as.matrix(pred.in.ixosc.m4,what="overall")

pred.in.rhisa.m4<-confusionMatrix(as.factor(round(pred.m4.in.rhisa$pred_rhisa_m4)), as.factor(pred.m4.in.rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.rhisa.m4<-as.matrix(pred.in.rhisa.m4,what="overall")

m4.in.acc<-cbind(pred.in.ambam.m4,pred.in.ambma.m4,pred.in.derva.m4,pred.in.ixoaf.m4,pred.in.ixosc.m4,pred.in.rhisa.m4)
write.csv(m4.in.acc,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/accuracy/m4.train.acc.csv")

#for m5


pred.m5.in.ambam<-subset(pred.m5.in, ambam == 1)
pred.m5.in.ambma<-subset(pred.m5.in, ambma == 1)
pred.m5.in.derva<-subset(pred.m5.in, derva == 1)
pred.m5.in.ixoaf<-subset(pred.m5.in, ixoaf == 1)
pred.m5.in.ixosc<-subset(pred.m5.in, ixosc == 1)
pred.m5.in.rhisa<-subset(pred.m5.in, rhisa == 1)



pred.in.ambam.m5<-confusionMatrix(as.factor(round(pred.m5.in.ambam$pred_ambam_m5)), as.factor(pred.m5.in.ambam$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambam.m5<-as.matrix(pred.in.ambam.m5,what="overall")

pred.in.ambma.m5<-confusionMatrix(as.factor(round(pred.m5.in.ambma$pred_ambma_m5)), as.factor(pred.m5.in.ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambma.m5<-as.matrix(pred.in.ambma.m5,what="overall")

pred.in.derva.m5<-confusionMatrix(as.factor(round(pred.m5.in.derva$pred_derva_m5)), as.factor(pred.m5.in.derva$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.derva.m5<-as.matrix(pred.in.derva.m5,what="overall")

pred.in.ixoaf.m5<-confusionMatrix(as.factor(round(pred.m5.in.ixoaf$pred_ixoaf_m5)), as.factor(pred.m5.in.ixoaf$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixoaf.m5<-as.matrix(pred.in.ixoaf.m5,what="overall")

pred.in.ixosc.m5<-confusionMatrix(as.factor(round(pred.m5.in.ixosc$pred_ixosc_m5)), as.factor(pred.m5.in.ixosc$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixosc.m5<-as.matrix(pred.in.ixosc.m5,what="overall")

pred.in.rhisa.m5<-confusionMatrix(as.factor(round(pred.m5.in.rhisa$pred_rhisa_m5)), as.factor(pred.m5.in.rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.rhisa.m5<-as.matrix(pred.in.rhisa.m5,what="overall")

m5.in.acc<-cbind(pred.in.ambam.m5,pred.in.ambma.m5,pred.in.derva.m5,pred.in.ixoaf.m5,pred.in.ixosc.m5,pred.in.rhisa.m5)
write.csv(m5.in.acc,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/accuracy/m5.train.acc.csv")


#for m6

pred.m6.in.ambam<-subset(pred.m6.in, ambam == 1)
pred.m6.in.ambma<-subset(pred.m6.in, ambma == 1)
pred.m6.in.derva<-subset(pred.m6.in, derva == 1)
pred.m6.in.ixoaf<-subset(pred.m6.in, ixoaf == 1)
pred.m6.in.ixosc<-subset(pred.m6.in, ixosc == 1)
pred.m6.in.rhisa<-subset(pred.m6.in, rhisa == 1)


pred.in.ambam.m6<-confusionMatrix(as.factor(round(pred.m6.in.ambam$pred_ambam_m6)), as.factor(pred.m6.in.ambam$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambam.m6<-as.matrix(pred.in.ambam.m6,what="overall")

pred.in.ambma.m6<-confusionMatrix(as.factor(round(pred.m6.in.ambma$pred_ambma_m6)), as.factor(pred.m6.in.ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ambma.m6<-as.matrix(pred.in.ambma.m6,what="overall")

pred.in.derva.m6<-confusionMatrix(as.factor(round(pred.m6.in.derva$pred_derva_m6)), as.factor(pred.m6.in.derva$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.derva.m6<-as.matrix(pred.in.derva.m6,what="overall")

pred.in.ixoaf.m6<-confusionMatrix(as.factor(round(pred.m6.in.ixoaf$pred_ixoaf_m6)), as.factor(pred.m6.in.ixoaf$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixoaf.m6<-as.matrix(pred.in.ixoaf.m6,what="overall")

pred.in.ixosc.m6<-confusionMatrix(as.factor(round(pred.m6.in.ixosc$pred_ixosc_m6)), as.factor(pred.m6.in.ixosc$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.ixosc.m6<-as.matrix(pred.in.ixosc.m6,what="overall")

pred.in.rhisa.m6<-confusionMatrix(as.factor(round(pred.m6.in.rhisa$pred_rhisa_m6)), as.factor(pred.m6.in.rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))
pred.in.rhisa.m6<-as.matrix(pred.in.rhisa.m6,what="overall")

m6.in.path<-cbind(pred.in.ambam.m6,pred.in.ambma.m6,pred.in.derva.m6,pred.in.ixoaf.m6,pred.in.ixosc.m6,pred.in.rhisa.m6)


write.csv(m6.in.path,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/accuracy/m6.test.acc.csv")


##calculate change in uncertainty when adding pathogen data
path<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_empirical/predictions/all_preds_m7_m12_emp.csv")
no_path<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m1_m6_empirical/predictions/allpreds.csv")

path.ambam.m1<-path$unc_ambam_m1
path.ambma.m1<-path$unc_ambma_m1
path.derva.m1<-path$unc_derva_m1
path.ixoaf.m1<-path$unc_ixoaf_m1
path.ixosc.m1<-path$unc_ixosc_m1
path.rhisa.m1<-path$unc_rhisa_m1

path.ambam.m2<-path$unc_ambam_m2
path.ambma.m2<-path$unc_ambma_m2
path.derva.m2<-path$unc_derva_m2
path.ixoaf.m2<-path$unc_ixoaf_m2
path.ixosc.m2<-path$unc_ixosc_m2
path.rhisa.m2<-path$unc_rhisa_m2

path.ambam.m3<-path$unc_ambam_m3
path.ambma.m3<-path$unc_ambma_m3
path.derva.m3<-path$unc_derva_m3
path.ixoaf.m3<-path$unc_ixoaf_m3
path.ixosc.m3<-path$unc_ixosc_m3
path.rhisa.m3<-path$unc_rhisa_m3

path.ambam.m4<-path$unc_ambam_m4
path.ambma.m4<-path$unc_ambma_m4
path.derva.m4<-path$unc_derva_m4
path.ixoaf.m4<-path$unc_ixoaf_m4
path.ixosc.m4<-path$unc_ixosc_m4
path.rhisa.m4<-path$unc_rhisa_m4

path.ambam.m5<-path$unc_ambam_m5
path.ambma.m5<-path$unc_ambma_m5
path.derva.m5<-path$unc_derva_m5
path.ixoaf.m5<-path$unc_ixoaf_m5
path.ixosc.m5<-path$unc_ixosc_m5
path.rhisa.m5<-path$unc_rhisa_m5

path.ambam.m6<-path$unc_ambam_m6
path.ambma.m6<-path$unc_ambma_m6
path.derva.m6<-path$unc_derva_m6
path.ixoaf.m6<-path$unc_ixoaf_m6
path.ixosc.m6<-path$unc_ixosc_m6
path.rhisa.m6<-path$unc_rhisa_m6


no_path.ambam.m1<-no_path$unc_ambam_m1
no_path.ambma.m1<-no_path$unc_ambma_m1
no_path.derva.m1<-no_path$unc_derva_m1
no_path.ixoaf.m1<-no_path$unc_ixoaf_m1
no_path.ixosc.m1<-no_path$unc_ixosc_m1
no_path.rhisa.m1<-no_path$unc_rhisa_m1

no_path.ambam.m2<-no_path$unc_ambam_m2
no_path.ambma.m2<-no_path$unc_ambma_m2
no_path.derva.m2<-no_path$unc_derva_m2
no_path.ixoaf.m2<-no_path$unc_ixoaf_m2
no_path.ixosc.m2<-no_path$unc_ixosc_m2
no_path.rhisa.m2<-no_path$unc_rhisa_m2

no_path.ambam.m3<-no_path$unc_ambam_m3
no_path.ambma.m3<-no_path$unc_ambma_m3
no_path.derva.m3<-no_path$unc_derva_m3
no_path.ixoaf.m3<-no_path$unc_ixoaf_m3
no_path.ixosc.m3<-no_path$unc_ixosc_m3
no_path.rhisa.m3<-no_path$unc_rhisa_m3

no_path.ambam.m4<-no_path$unc_ambam_m4
no_path.ambma.m4<-no_path$unc_ambma_m4
no_path.derva.m4<-no_path$unc_derva_m4
no_path.ixoaf.m4<-no_path$unc_ixoaf_m4
no_path.ixosc.m4<-no_path$unc_ixosc_m4
no_path.rhisa.m4<-no_path$unc_rhisa_m4

no_path.ambam.m5<-no_path$unc_ambam_m5
no_path.ambma.m5<-no_path$unc_ambma_m5
no_path.derva.m5<-no_path$unc_derva_m5
no_path.ixoaf.m5<-no_path$unc_ixoaf_m5
no_path.ixosc.m5<-no_path$unc_ixosc_m5
no_path.rhisa.m5<-no_path$unc_rhisa_m5

no_path.ambam.m6<-no_path$unc_ambam_m6
no_path.ambma.m6<-no_path$unc_ambma_m6
no_path.derva.m6<-no_path$unc_derva_m6
no_path.ixoaf.m6<-no_path$unc_ixoaf_m6
no_path.ixosc.m6<-no_path$unc_ixosc_m6
no_path.rhisa.m6<-no_path$unc_rhisa_m6

m1_a<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m7_sima.csv")
m1_c<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m7_simc.csv")
m1_d<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m7_simd.csv")

m2_a<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m8_sima.csv")
m2_c<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m8_simc.csv")
m2_d<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m8_simd.csv")

m3_a<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m9_sima.csv")
m3_c<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m9_simc.csv")
m3_d<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m9_simd.csv")

m4_a<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m10_sima.csv")
m4_c<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m10_simc.csv")
m4_d<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m10_simd.csv")

m5_a<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m11_sima.csv")
m5_c<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m11_simc.csv")
m5_d<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m11_simd.csv")

m6_a<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m12_sima.csv")
m6_c<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m12_simc.csv")
m6_d<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/m7_m12_simulations/predictions/pred_m12_simd.csv")


