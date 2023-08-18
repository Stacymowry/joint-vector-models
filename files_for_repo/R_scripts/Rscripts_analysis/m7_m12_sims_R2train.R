##calc R2_train from yhats


#load function
calc_yhat<-function(name_quant,name_diff,name_mean,file_in,file_out)
{
  preds<-read.csv(file_in)
  name_quant<-matrix(nrow=2000,ncol=2)
  name_diff<-vector(length=2000)
  name_mean<-vector(length=2000)
  for (i in 2: ncol(preds)){
    name_quant[i-1,]<-quantile(as.numeric(preds[,i]), probs = c(0.025, 0.975), na.rm=TRUE)
    name_diff[i-1]<-name_quant[i-1,2]-name_quant[i-1,1]
    name_mean[i-1]<-mean(as.numeric(preds[,i]),na.rm=TRUE)
  }
  out<-cbind(name_mean,name_diff)
  colnames(out)<-c("mean","unc")
  write.csv(out, file_out)
  rm(preds)
}

##Run function
calc_yhat(quants_m1a_1,diff_m1a_1,mean_m1a_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/yhat_m1path_a_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m1path_a_1.csv")

calc_yhat(quants_m2a_1,diff_m2a_1,mean_m2a_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/yhat_m2path_a_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m2path_a_1.csv")

calc_yhat(quants_m3a_1,diff_m3a_1,mean_m3a_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/yhat_m3path_a_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m3path_a_1.csv")

calc_yhat(quants_m4a_1,diff_m4a_1,mean_m4a_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/yhat_m4path_a_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m4path_a_1.csv")

calc_yhat(quants_m5a_1,diff_m5a_1,mean_m5a_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/yhat_m5path_a_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m5path_a_1.csv")

calc_yhat(quants_m6a_1,diff_m6a_1,mean_m6a_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/yhat_m6path_a_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m6path_a_1.csv")

calc_yhat(quants_m1a_2,diff_m1a_2,mean_m1a_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/yhat_m1path_a_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m1path_a_2.csv")

calc_yhat(quants_m2a_2,diff_m2a_2,mean_m2a_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/yhat_m2path_a_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m2path_a_2.csv")

calc_yhat(quants_m3a_2,diff_m3a_2,mean_m3a_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/yhat_m3path_a_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m3path_a_2.csv")

calc_yhat(quants_m4a_2,diff_m4a_2,mean_m4a_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/yhat_m4path_a_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m4path_a_2.csv")

calc_yhat(quants_m5a_2,diff_m5a_2,mean_m5a_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/yhat_m5path_a_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m5path_a_2.csv")

calc_yhat(quants_m6a_2,diff_m6a_2,mean_m6a_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/yhat_m6path_a_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m6path_a_2.csv")

calc_yhat(quants_m1a_3,diff_m1a_3,mean_m1a_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/yhat_m1path_a_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m1path_a_3.csv")

calc_yhat(quants_m2a_3,diff_m2a_3,mean_m2a_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/yhat_m2path_a_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m2path_a_3.csv")

calc_yhat(quants_m3a_3,diff_m3a_3,mean_m3a_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/yhat_m3path_a_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m3path_a_3.csv")

calc_yhat(quants_m4a_3,diff_m4a_3,mean_m4a_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/yhat_m4path_a_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m4path_a_3.csv")

calc_yhat(quants_m5a_3,diff_m5a_3,mean_m5a_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/yhat_m5path_a_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m5path_a_3.csv")

calc_yhat(quants_m6a_3,diff_m6a_3,mean_m6a_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/yhat_m6path_a_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m6path_a_3.csv")

calc_yhat(quants_m1a_4,diff_m1a_4,mean_m1a_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/yhat_m1path_a_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m1path_a_4.csv")

calc_yhat(quants_m2a_4,diff_m2a_4,mean_m2a_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/yhat_m2path_a_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m2path_a_4.csv")

calc_yhat(quants_m3a_4,diff_m3a_4,mean_m3a_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/yhat_m3path_a_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m3path_a_4.csv")

calc_yhat(quants_m4a_4,diff_m4a_4,mean_m4a_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/yhat_m4path_a_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m4path_a_4.csv")

calc_yhat(quants_m5a_4,diff_m5a_4,mean_m5a_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/yhat_m5path_a_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m5path_a_4.csv")

calc_yhat(quants_m6a_4,diff_m6a_4,mean_m6a_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/yhat_m6path_a_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m6path_a_4.csv")

calc_yhat(quants_m1a_5,diff_m1a_5,mean_m1a_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/yhat_m1path_a_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m1path_a_5.csv")

calc_yhat(quants_m2a_5,diff_m2a_5,mean_m2a_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/yhat_m2path_a_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m2path_a_5.csv")

calc_yhat(quants_m3a_5,diff_m3a_5,mean_m3a_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/yhat_m3path_a_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m3path_a_5.csv")

calc_yhat(quants_m4a_5,diff_m4a_5,mean_m4a_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/yhat_m4path_a_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m4path_a_5.csv")

calc_yhat(quants_m5a_5,diff_m5a_5,mean_m5a_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/yhat_m5path_a_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m5path_a_5.csv")

calc_yhat(quants_m6a_5,diff_m6a_5,mean_m6a_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/yhat_m6path_a_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m6path_a_5.csv")

calc_yhat(quants_m1a_6,diff_m1a_6,mean_m1a_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/yhat_m1path_a_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m1path_a_6.csv")

calc_yhat(quants_m2a_6,diff_m2a_6,mean_m2a_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/yhat_m2path_a_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m2path_a_6.csv")

calc_yhat(quants_m3a_6,diff_m3a_6,mean_m3a_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/yhat_m3path_a_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m3path_a_6.csv")

calc_yhat(quants_m4a_6,diff_m4a_6,mean_m4a_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/yhat_m4path_a_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m4path_a_6.csv")

calc_yhat(quants_m5a_6,diff_m5a_6,mean_m5a_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/yhat_m5path_a_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m5path_a_6.csv")

calc_yhat(quants_m6a_6,diff_m6a_6,mean_m6a_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/yhat_m6path_a_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m6path_a_6.csv")

calc_yhat(quants_m1a_7,diff_m1a_7,mean_m1a_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/yhat_m1path_a_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m1path_a_7.csv")

calc_yhat(quants_m2a_7,diff_m2a_7,mean_m2a_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/yhat_m2path_a_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m2path_a_7.csv")

calc_yhat(quants_m3a_7,diff_m3a_7,mean_m3a_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/yhat_m3path_a_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m3path_a_7.csv")

calc_yhat(quants_m4a_7,diff_m4a_7,mean_m4a_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/yhat_m4path_a_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m4path_a_7.csv")

calc_yhat(quants_m5a_7,diff_m5a_7,mean_m5a_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/yhat_m5path_a_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m5path_a_7.csv")

calc_yhat(quants_m6a_7,diff_m6a_7,mean_m6a_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/yhat_m6path_a_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m6path_a_7.csv")

calc_yhat(quants_m1a_8,diff_m1a_8,mean_m1a_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/yhat_m1path_a_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m1path_a_8.csv")

calc_yhat(quants_m2a_8,diff_m2a_8,mean_m2a_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/yhat_m2path_a_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m2path_a_8.csv")

calc_yhat(quants_m3a_8,diff_m3a_8,mean_m3a_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/yhat_m3path_a_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m3path_a_8.csv")

calc_yhat(quants_m4a_8,diff_m4a_8,mean_m4a_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/yhat_m4path_a_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m4path_a_8.csv")

calc_yhat(quants_m5a_8,diff_m5a_8,mean_m5a_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/yhat_m5path_a_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m5path_a_8.csv")

calc_yhat(quants_m6a_8,diff_m6a_8,mean_m6a_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/yhat_m6path_a_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m6path_a_8.csv")

calc_yhat(quants_m1a_9,diff_m1a_9,mean_m1a_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/yhat_m1path_a_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m1path_a_9.csv")

calc_yhat(quants_m2a_9,diff_m2a_9,mean_m2a_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/yhat_m2path_a_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m2path_a_9.csv")

calc_yhat(quants_m3a_9,diff_m3a_9,mean_m3a_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/yhat_m3path_a_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m3path_a_9.csv")

calc_yhat(quants_m4a_9,diff_m4a_9,mean_m4a_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/yhat_m4path_a_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m4path_a_9.csv")

calc_yhat(quants_m5a_9,diff_m5a_9,mean_m5a_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/yhat_m5path_a_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m5path_a_9.csv")
calc_yhat(quants_m6a_9,diff_m6a_9,mean_m6a_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/yhat_m6path_a_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m6path_a_9.csv")

calc_yhat(quants_m1a_10,diff_m1a_10,mean_m1a_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/yhat_m1path_a_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m1path_a_10.csv")

calc_yhat(quants_m2a_10,diff_m2a_10,mean_m2a_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/yhat_m2path_a_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m2path_a_10.csv")

calc_yhat(quants_m3a_10,diff_m3a_10,mean_m3a_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/yhat_m3path_a_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m3path_a_10.csv")

calc_yhat(quants_m4a_10,diff_m4a_10,mean_m4a_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/yhat_m4path_a_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m4path_a_10.csv")

calc_yhat(quants_m5a_10,diff_m5a_10,mean_m5a_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/yhat_m5path_a_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m5path_a_10.csv")

calc_yhat(quants_m6a_10,diff_m6a_10,mean_m6a_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/yhat_m6path_a_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m6path_a_10.csv")

calc_yhat(quants_m1c_1,diff_m1c_1,mean_m1c_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/yhat_m1path_c_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m1path_c_1.csv")

calc_yhat(quants_m2c_1,diff_m2c_1,mean_m2c_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/yhat_m2path_c_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m2path_c_1.csv")

calc_yhat(quants_m3c_1,diff_m3c_1,mean_m3c_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/yhat_m3path_c_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m3path_c_1.csv")

calc_yhat(quants_m4c_1,diff_m4c_1,mean_m4c_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/yhat_m4path_c_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m4path_c_1.csv")

calc_yhat(quants_m5c_1,diff_m5c_1,mean_m5c_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/yhat_m5path_c_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m5path_c_1.csv")

calc_yhat(quants_m6c_1,diff_m6c_1,mean_m6c_1,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/yhat_m6path_c_1.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m6path_c_1.csv")

calc_yhat(quants_m1c_2,diff_m1c_2,mean_m1c_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/yhat_m1path_c_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m1path_c_2.csv")

calc_yhat(quants_m2c_2,diff_m2c_2,mean_m2c_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/yhat_m2path_c_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m2path_c_2.csv")

calc_yhat(quants_m3c_2,diff_m3c_2,mean_m3c_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/yhat_m3path_c_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m3path_c_2.csv")

calc_yhat(quants_m4c_2,diff_m4c_2,mean_m4c_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/yhat_m4path_c_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m4path_c_2.csv")

calc_yhat(quants_m5c_2,diff_m5c_2,mean_m5c_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/yhat_m5path_c_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m5path_c_2.csv")

calc_yhat(quants_m6c_2,diff_m6c_2,mean_m6c_2,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/yhat_m6path_c_2.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m6path_c_2.csv")

calc_yhat(quants_m1c_3,diff_m1c_3,mean_m1c_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/yhat_m1path_c_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m1path_c_3.csv")

calc_yhat(quants_m2c_3,diff_m2c_3,mean_m2c_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/yhat_m2path_c_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m2path_c_3.csv")

calc_yhat(quants_m3c_3,diff_m3c_3,mean_m3c_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/yhat_m3path_c_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m3path_c_3.csv")

calc_yhat(quants_m4c_3,diff_m4c_3,mean_m4c_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/yhat_m4path_c_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m4path_c_3.csv")

calc_yhat(quants_m5c_3,diff_m5c_3,mean_m5c_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/yhat_m5path_c_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m5path_c_3.csv")

calc_yhat(quants_m6c_3,diff_m6c_3,mean_m6c_3,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/yhat_m6path_c_3.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m6path_c_3.csv")

calc_yhat(quants_m1c_4,diff_m1c_4,mean_m1c_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/yhat_m1path_c_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m1path_c_4.csv")

calc_yhat(quants_m2c_4,diff_m2c_4,mean_m2c_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/yhat_m2path_c_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m2path_c_4.csv")

calc_yhat(quants_m3c_4,diff_m3c_4,mean_m3c_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/yhat_m3path_c_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m3path_c_4.csv")

calc_yhat(quants_m4c_4,diff_m4c_4,mean_m4c_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/yhat_m4path_c_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m4path_c_4.csv")

calc_yhat(quants_m5c_4,diff_m5c_4,mean_m5c_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/yhat_m5path_c_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m5path_c_4.csv")

calc_yhat(quants_m6c_4,diff_m6c_4,mean_m6c_4,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/yhat_m6path_c_4.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m6path_c_4.csv")

calc_yhat(quants_m1c_5,diff_m1c_5,mean_m1c_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/yhat_m1path_c_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m1path_c_5.csv")

calc_yhat(quants_m2c_5,diff_m2c_5,mean_m2c_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/yhat_m2path_c_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m2path_c_5.csv")

calc_yhat(quants_m3c_5,diff_m3c_5,mean_m3c_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/yhat_m3path_c_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m3path_c_5.csv")

calc_yhat(quants_m4c_5,diff_m4c_5,mean_m4c_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/yhat_m4path_c_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m4path_c_5.csv")

calc_yhat(quants_m5c_5,diff_m5c_5,mean_m5c_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/yhat_m5path_c_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m5path_c_5.csv")

calc_yhat(quants_m6c_5,diff_m6c_5,mean_m6c_5,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/yhat_m6path_c_5.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m6path_c_5.csv")

calc_yhat(quants_m1c_6,diff_m1c_6,mean_m1c_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/yhat_m1path_c_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m1path_c_6.csv")

calc_yhat(quants_m2c_6,diff_m2c_6,mean_m2c_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/yhat_m2path_c_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m2path_c_6.csv")

calc_yhat(quants_m3c_6,diff_m3c_6,mean_m3c_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/yhat_m3path_c_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m3path_c_6.csv")

calc_yhat(quants_m4c_6,diff_m4c_6,mean_m4c_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/yhat_m4path_c_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m4path_c_6.csv")

calc_yhat(quants_m5c_6,diff_m5c_6,mean_m5c_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/yhat_m5path_c_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m5path_c_6.csv")

calc_yhat(quants_m6c_6,diff_m6c_6,mean_m6c_6,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/yhat_m6path_c_6.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m6path_c_6.csv")

calc_yhat(quants_m1c_7,diff_m1c_7,mean_m1c_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/yhat_m1path_c_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m1path_c_7.csv")

calc_yhat(quants_m2c_7,diff_m2c_7,mean_m2c_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/yhat_m2path_c_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m2path_c_7.csv")

calc_yhat(quants_m3c_7,diff_m3c_7,mean_m3c_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/yhat_m3path_c_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m3path_c_7.csv")

calc_yhat(quants_m4c_7,diff_m4c_7,mean_m4c_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/yhat_m4path_c_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m4path_c_7.csv")

calc_yhat(quants_m5c_7,diff_m5c_7,mean_m5c_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/yhat_m5path_c_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m5path_c_7.csv")

calc_yhat(quants_m6c_7,diff_m6c_7,mean_m6c_7,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/yhat_m6path_c_7.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m6path_c_7.csv")

calc_yhat(quants_m1c_8,diff_m1c_8,mean_m1c_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/yhat_m1path_c_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m1path_c_8.csv")

calc_yhat(quants_m2c_8,diff_m2c_8,mean_m2c_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/yhat_m2path_c_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m2path_c_8.csv")

calc_yhat(quants_m3c_8,diff_m3c_8,mean_m3c_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/yhat_m3path_c_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m3path_c_8.csv")

calc_yhat(quants_m4c_8,diff_m4c_8,mean_m4c_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/yhat_m4path_c_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m4path_c_8.csv")

calc_yhat(quants_m5c_8,diff_m5c_8,mean_m5c_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/yhat_m5path_c_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m5path_c_8.csv")

calc_yhat(quants_m6c_8,diff_m6c_8,mean_m6c_8,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/yhat_m6path_c_8.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m6path_c_8.csv")

calc_yhat(quants_m1c_9,diff_m1c_9,mean_m1c_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/yhat_m1path_c_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m1path_c_9.csv")

calc_yhat(quants_m2c_9,diff_m2c_9,mean_m2c_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/yhat_m2path_c_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m2path_c_9.csv")

calc_yhat(quants_m3c_9,diff_m3c_9,mean_m3c_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/yhat_m3path_c_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m3path_c_9.csv")

calc_yhat(quants_m4c_9,diff_m4c_9,mean_m4c_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/yhat_m4path_c_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m4path_c_9.csv")

calc_yhat(quants_m5c_9,diff_m5c_9,mean_m5c_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/yhat_m5path_c_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m5path_c_9.csv")
calc_yhat(quants_m6c_9,diff_m6c_9,mean_m6c_9,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/yhat_m6path_c_9.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m6path_c_9.csv")

calc_yhat(quants_m1c_10,diff_m1c_10,mean_m1c_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/yhat_m1path_c_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m1path_c_10.csv")

calc_yhat(quants_m2c_10,diff_m2c_10,mean_m2c_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/yhat_m2path_c_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m2path_c_10.csv")

calc_yhat(quants_m3c_10,diff_m3c_10,mean_m3c_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/yhat_m3path_c_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m3path_c_10.csv")

calc_yhat(quants_m4c_10,diff_m4c_10,mean_m4c_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/yhat_m4path_c_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m4path_c_10.csv")

calc_yhat(quants_m5c_10,diff_m5c_10,mean_m5c_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/yhat_m5path_c_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m5path_c_10.csv")

calc_yhat(quants_m6c_10,diff_m6c_10,mean_m6c_10,
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/yhat_m6path_c_10.csv",
          "/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m6path_c_10.csv")

##load in outputs
##Sim A
m1a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m1path_a_1.csv")
m2a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m2path_a_1.csv")
m3a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m3path_a_1.csv")
m4a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m4path_a_1.csv")
m5a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m5path_a_1.csv")
m6a_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/test_preds/avgs_m6path_a_1.csv")

m1a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m1path_a_2.csv")
m2a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m2path_a_2.csv")
m3a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m3path_a_2.csv")
m4a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m4path_a_2.csv")
m5a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m5path_a_2.csv")
m6a_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/test_preds/avgs_m6path_a_2.csv")

m1a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m1path_a_3.csv")
m2a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m2path_a_3.csv")
m3a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m3path_a_3.csv")
m4a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m4path_a_3.csv")
m5a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m5path_a_3.csv")
m6a_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/test_preds/avgs_m6path_a_3.csv")

m1a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m1path_a_4.csv")
m2a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m2path_a_4.csv")
m3a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m3path_a_4.csv")
m4a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m4path_a_4.csv")
m5a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m5path_a_4.csv")
m6a_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/test_preds/avgs_m6path_a_4.csv")

m1a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m1path_a_5.csv")
m2a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m2path_a_5.csv")
m3a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m3path_a_5.csv")
m4a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m4path_a_5.csv")
m5a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m5path_a_5.csv")
m6a_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/test_preds/avgs_m6path_a_5.csv")

m1a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m1path_a_6.csv")
m2a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m2path_a_6.csv")
m3a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m3path_a_6.csv")
m4a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m4path_a_6.csv")
m5a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m5path_a_6.csv")
m6a_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/test_preds/avgs_m6path_a_6.csv")

m1a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m1path_a_7.csv")
m2a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m2path_a_7.csv")
m3a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m3path_a_7.csv")
m4a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m4path_a_7.csv")
m5a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m5path_a_7.csv")
m6a_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/test_preds/avgs_m6path_a_7.csv")

m1a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m1path_a_8.csv")
m2a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m2path_a_8.csv")
m3a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m3path_a_8.csv")
m4a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m4path_a_8.csv")
m5a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m5path_a_8.csv")
m6a_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/test_preds/avgs_m6path_a_8.csv")

m1a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m1path_a_9.csv")
m2a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m2path_a_9.csv")
m3a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m3path_a_9.csv")
m4a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m4path_a_9.csv")
m5a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m5path_a_9.csv")
m6a_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/test_preds/avgs_m6path_a_9.csv")

m1a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m1path_a_10.csv")
m2a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m2path_a_10.csv")
m3a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m3path_a_10.csv")
m4a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m4path_a_10.csv")
m5a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m5path_a_10.csv")
m6a_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/test_preds/avgs_m6path_a_10.csv")

##Sim C

m1c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m1path_c_1.csv")
m2c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m2path_c_1.csv")
m3c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m3path_c_1.csv")
m4c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m4path_c_1.csv")
m5c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m5path_c_1.csv")
m6c_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_C/test_preds/avgs_m6path_c_1.csv")

m1c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m1path_c_2.csv")
m2c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m2path_c_2.csv")
m3c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m3path_c_2.csv")
m4c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m4path_c_2.csv")
m5c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m5path_c_2.csv")
m6c_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_C/test_preds/avgs_m6path_c_2.csv")

m1c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m1path_c_3.csv")
m2c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m2path_c_3.csv")
m3c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m3path_c_3.csv")
m4c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m4path_c_3.csv")
m5c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m5path_c_3.csv")
m6c_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_C/test_preds/avgs_m6path_c_3.csv")

m1c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m1path_c_4.csv")
m2c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m2path_c_4.csv")
m3c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m3path_c_4.csv")
m4c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m4path_c_4.csv")
m5c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m5path_c_4.csv")
m6c_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_C/test_preds/avgs_m6path_c_4.csv")

m1c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m1path_c_5.csv")
m2c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m2path_c_5.csv")
m3c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m3path_c_5.csv")
m4c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m4path_c_5.csv")
m5c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m5path_c_5.csv")
m6c_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_C/test_preds/avgs_m6path_c_5.csv")

m1c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m1path_c_6.csv")
m2c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m2path_c_6.csv")
m3c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m3path_c_6.csv")
m4c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m4path_c_6.csv")
m5c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m5path_c_6.csv")
m6c_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_C/test_preds/avgs_m6path_c_6.csv")

m1c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m1path_c_7.csv")
m2c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m2path_c_7.csv")
m3c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m3path_c_7.csv")
m4c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m4path_c_7.csv")
m5c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m5path_c_7.csv")
m6c_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_C/test_preds/avgs_m6path_c_7.csv")

m1c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m1path_c_8.csv")
m2c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m2path_c_8.csv")
m3c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m3path_c_8.csv")
m4c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m4path_c_8.csv")
m5c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m5path_c_8.csv")
m6c_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_C/test_preds/avgs_m6path_c_8.csv")

m1c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m1path_c_9.csv")
m2c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m2path_c_9.csv")
m3c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m3path_c_9.csv")
m4c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m4path_c_9.csv")
m5c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m5path_c_9.csv")
m6c_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_C/test_preds/avgs_m6path_c_9.csv")

m1c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m1path_c_10.csv")
m2c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m2path_c_10.csv")
m3c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m3path_c_10.csv")
m4c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m4path_c_10.csv")
m5c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m5path_c_10.csv")
m6c_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_C/test_preds/avgs_m6path_c_10.csv")

##Bind Sim A together
Sim_A_out<-cbind(m1a_1[,2:3],m2a_1[,2:3],m3a_1[,2:3],m4a_1[,2:3],m5a_1[,2:3],m6a_1[,2:3],
                 m1a_2[,2:3],m2a_2[,2:3],m3a_2[,2:3],m4a_2[,2:3],m5a_2[,2:3],m6a_2[,2:3],
                 m1a_3[,2:3],m2a_3[,2:3],m3a_3[,2:3],m4a_3[,2:3],m5a_3[,2:3],m6a_3[,2:3],
                 m1a_4[,2:3],m2a_4[,2:3],m3a_4[,2:3],m4a_4[,2:3],m5a_4[,2:3],m6a_4[,2:3],
                 m1a_5[,2:3],m2a_5[,2:3],m3a_5[,2:3],m4a_5[,2:3],m5a_5[,2:3],m6a_5[,2:3],
                 m1a_6[,2:3],m2a_6[,2:3],m3a_6[,2:3],m4a_6[,2:3],m5a_6[,2:3],m6a_6[,2:3],
                 m1a_7[,2:3],m2a_7[,2:3],m3a_7[,2:3],m4a_7[,2:3],m5a_7[,2:3],m6a_7[,2:3],
                 m1a_8[,2:3],m2a_8[,2:3],m3a_8[,2:3],m4a_8[,2:3],m5a_8[,2:3],m6a_8[,2:3],
                 m1a_9[,2:3],m2a_9[,2:3],m3a_9[,2:3],m4a_9[,2:3],m5a_9[,2:3],m6a_9[,2:3],
                 m1a_10[,2:3],m2a_10[,2:3],m3a_10[,2:3],m4a_10[,2:3],m5a_10[,2:3],m6a_10[,2:3],
                 sim_a_3[,50:89])
colnames(Sim_A_out)<-c("m1a_1_mean","m1a_1_unc",
                       "m2a_1_mean","m2a_1_unc",
                       "m3a_1_mean","m3a_1_unc",
                       "m4a_1_mean","m4a_1_unc",
                       "m5a_1_mean","m5a_1_unc",
                       "m6a_1_mean","m6a_1_unc",
                       
                       "m1a_2_mean","m1a_2_unc",
                       "m2a_2_mean","m2a_2_unc",
                       "m3a_2_mean","m3a_2_unc",
                       "m4a_2_mean","m4a_2_unc",
                       "m5a_2_mean","m5a_2_unc",
                       "m6a_2_mean","m6a_2_unc",
                       
                       "m1a_3_mean","m1a_3_unc",
                       "m2a_3_mean","m2a_3_unc",
                       "m3a_3_mean","m3a_3_unc",
                       "m4a_3_mean","m4a_3_unc",
                       "m5a_3_mean","m5a_3_unc",
                       "m6a_3_mean","m6a_3_unc",
                       
                       "m1a_4_mean","m1a_4_unc",
                       "m2a_4_mean","m2a_4_unc",
                       "m3a_4_mean","m3a_4_unc",
                       "m4a_4_mean","m4a_4_unc",
                       "m5a_4_mean","m5a_4_unc",
                       "m6a_4_mean","m6a_4_unc",
                       
                       "m1a_5_mean","m1a_5_unc",
                       "m2a_5_mean","m2a_5_unc",
                       "m3a_5_mean","m3a_5_unc",
                       "m4a_5_mean","m4a_5_unc",
                       "m5a_5_mean","m5a_5_unc",
                       "m6a_5_mean","m6a_5_unc",
                       
                       "m1a_6_mean","m1a_6_unc",
                       "m2a_6_mean","m2a_6_unc",
                       "m3a_6_mean","m3a_6_unc",
                       "m4a_6_mean","m4a_6_unc",
                       "m5a_6_mean","m5a_6_unc",
                       "m6a_6_mean","m6a_6_unc",
                       
                       "m1a_7_mean","m1a_7_unc",
                       "m2a_7_mean","m2a_7_unc",
                       "m3a_7_mean","m3a_7_unc",
                       "m4a_7_mean","m4a_7_unc",
                       "m5a_7_mean","m5a_7_unc",
                       "m6a_7_mean","m6a_7_unc",
                       
                       "m1a_8_mean","m1a_8_unc",
                       "m2a_8_mean","m2a_8_unc",
                       "m3a_8_mean","m3a_8_unc",
                       "m4a_8_mean","m4a_8_unc",
                       "m5a_8_mean","m5a_8_unc",
                       "m6a_8_mean","m6a_8_unc",
                       
                       "m1a_9_mean","m1a_9_unc",
                       "m2a_9_mean","m2a_9_unc",
                       "m3a_9_mean","m3a_9_unc",
                       "m4a_9_mean","m4a_9_unc",
                       "m5a_9_mean","m5a_9_unc",
                       "m6a_9_mean","m6a_9_unc",
                       
                       "m1a_10_mean","m1a_10_unc",
                       "m2a_10_mean","m2a_10_unc",
                       "m3a_10_mean","m3a_10_unc",
                       "m4a_10_mean","m4a_10_unc",
                       "m5a_10_mean","m5a_10_unc",
                       "m6a_10_mean","m6a_10_unc",
                       "ambam_1",
                       "ambam_2",
                       "ambam_3",
                       "ambam_4",
                       "ambam_5",
                       "ambam_6",
                       "ambam_7",
                       "ambam_8",
                       "ambam_9",
                       "ambam_10",
                       
                       "ambma_1",
                       "ambma_2",
                       "ambma_3",
                       "ambma_4",
                       "ambma_5",
                       "ambma_6",
                       "ambma_7",
                       "ambma_8",
                       "ambma_9",
                       "ambma_10",
                       
                       "derva_1",
                       "derva_2",
                       "derva_3",
                       "derva_4",
                       "derva_5",
                       "derva_6",
                       "derva_7",
                       "derva_8",
                       "derva_9",
                       "derva_10",
                       
                       "ixosc_1",
                       "ixosc_2",
                       "ixosc_3",
                       "ixosc_4",
                       "ixosc_5",
                       "ixosc_6",
                       "ixosc_7",
                       "ixosc_8",
                       "ixosc_9",
                       "ixosc_10")

Sim_A_out$Rsq_m1_ambam_1<-cor(Sim_A_out$m1a_1_mean[1:500],Sim_A_out$ambam_1[1:500])  
Sim_A_out$Rsq_m2_ambam_1<-cor(Sim_A_out$m2a_1_mean[1:500],Sim_A_out$ambam_1[1:500])  
Sim_A_out$Rsq_m3_ambam_1<-cor(Sim_A_out$m3a_1_mean[1:500],Sim_A_out$ambam_1[1:500])  
Sim_A_out$Rsq_m4_ambam_1<-cor(Sim_A_out$m4a_1_mean[1:500],Sim_A_out$ambam_1[1:500])  
Sim_A_out$Rsq_m5_ambam_1<-cor(Sim_A_out$m5a_1_mean[1:500],Sim_A_out$ambam_1[1:500])  
Sim_A_out$Rsq_m6_ambam_1<-cor(Sim_A_out$m6a_1_mean[1:500],Sim_A_out$ambam_1[1:500])  

Sim_A_out$Rsq_m1_ambma_1<-cor(Sim_A_out$m1a_1_mean[501:1000],Sim_A_out$ambma_1[501:1000])  
Sim_A_out$Rsq_m2_ambma_1<-cor(Sim_A_out$m2a_1_mean[501:1000],Sim_A_out$ambma_1[501:1000])  
Sim_A_out$Rsq_m3_ambma_1<-cor(Sim_A_out$m3a_1_mean[501:1000],Sim_A_out$ambma_1[501:1000])  
Sim_A_out$Rsq_m4_ambma_1<-cor(Sim_A_out$m4a_1_mean[501:1000],Sim_A_out$ambma_1[501:1000])  
Sim_A_out$Rsq_m5_ambma_1<-cor(Sim_A_out$m5a_1_mean[501:1000],Sim_A_out$ambma_1[501:1000])  
Sim_A_out$Rsq_m6_ambma_1<-cor(Sim_A_out$m6a_1_mean[501:1000],Sim_A_out$ambma_1[501:1000])  

Sim_A_out$Rsq_m1_derva_1<-cor(Sim_A_out$m1a_1_mean[1001:1500],Sim_A_out$derva_1[1001:1500])  
Sim_A_out$Rsq_m2_derva_1<-cor(Sim_A_out$m2a_1_mean[1001:1500],Sim_A_out$derva_1[1001:1500])  
Sim_A_out$Rsq_m3_derva_1<-cor(Sim_A_out$m3a_1_mean[1001:1500],Sim_A_out$derva_1[1001:1500])  
Sim_A_out$Rsq_m4_derva_1<-cor(Sim_A_out$m4a_1_mean[1001:1500],Sim_A_out$derva_1[1001:1500])  
Sim_A_out$Rsq_m5_derva_1<-cor(Sim_A_out$m5a_1_mean[1001:1500],Sim_A_out$derva_1[1001:1500])  
Sim_A_out$Rsq_m6_derva_1<-cor(Sim_A_out$m6a_1_mean[1001:1500],Sim_A_out$derva_1[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_1<-cor(Sim_A_out$m1a_1_mean[1501:2000],Sim_A_out$ixosc_1[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_1<-cor(Sim_A_out$m2a_1_mean[1501:2000],Sim_A_out$ixosc_1[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_1<-cor(Sim_A_out$m3a_1_mean[1501:2000],Sim_A_out$ixosc_1[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_1<-cor(Sim_A_out$m4a_1_mean[1501:2000],Sim_A_out$ixosc_1[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_1<-cor(Sim_A_out$m5a_1_mean[1501:2000],Sim_A_out$ixosc_1[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_1<-cor(Sim_A_out$m6a_1_mean[1501:2000],Sim_A_out$ixosc_1[1501:2000])  

Sim_A_out$Rsq_m1_ambam_2<-cor(Sim_A_out$m1a_2_mean[1:500],Sim_A_out$ambam_2[1:500])  
Sim_A_out$Rsq_m2_ambam_2<-cor(Sim_A_out$m2a_2_mean[1:500],Sim_A_out$ambam_2[1:500])  
Sim_A_out$Rsq_m3_ambam_2<-cor(Sim_A_out$m3a_2_mean[1:500],Sim_A_out$ambam_2[1:500])  
Sim_A_out$Rsq_m4_ambam_2<-cor(Sim_A_out$m4a_2_mean[1:500],Sim_A_out$ambam_2[1:500])  
Sim_A_out$Rsq_m5_ambam_2<-cor(Sim_A_out$m5a_2_mean[1:500],Sim_A_out$ambam_2[1:500])  
Sim_A_out$Rsq_m6_ambam_2<-cor(Sim_A_out$m6a_2_mean[1:500],Sim_A_out$ambam_2[1:500])  

Sim_A_out$Rsq_m1_ambma_2<-cor(Sim_A_out$m1a_2_mean[501:1000],Sim_A_out$ambma_2[501:1000])  
Sim_A_out$Rsq_m2_ambma_2<-cor(Sim_A_out$m2a_2_mean[501:1000],Sim_A_out$ambma_2[501:1000])  
Sim_A_out$Rsq_m3_ambma_2<-cor(Sim_A_out$m3a_2_mean[501:1000],Sim_A_out$ambma_2[501:1000])  
Sim_A_out$Rsq_m4_ambma_2<-cor(Sim_A_out$m4a_2_mean[501:1000],Sim_A_out$ambma_2[501:1000])  
Sim_A_out$Rsq_m5_ambma_2<-cor(Sim_A_out$m5a_2_mean[501:1000],Sim_A_out$ambma_2[501:1000])  
Sim_A_out$Rsq_m6_ambma_2<-cor(Sim_A_out$m6a_2_mean[501:1000],Sim_A_out$ambma_2[501:1000])  

Sim_A_out$Rsq_m1_derva_2<-cor(Sim_A_out$m1a_2_mean[1001:1500],Sim_A_out$derva_2[1001:1500])  
Sim_A_out$Rsq_m2_derva_2<-cor(Sim_A_out$m2a_2_mean[1001:1500],Sim_A_out$derva_2[1001:1500])  
Sim_A_out$Rsq_m3_derva_2<-cor(Sim_A_out$m3a_2_mean[1001:1500],Sim_A_out$derva_2[1001:1500])  
Sim_A_out$Rsq_m4_derva_2<-cor(Sim_A_out$m4a_2_mean[1001:1500],Sim_A_out$derva_2[1001:1500])  
Sim_A_out$Rsq_m5_derva_2<-cor(Sim_A_out$m5a_2_mean[1001:1500],Sim_A_out$derva_2[1001:1500])  
Sim_A_out$Rsq_m6_derva_2<-cor(Sim_A_out$m6a_2_mean[1001:1500],Sim_A_out$derva_2[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_2<-cor(Sim_A_out$m1a_2_mean[1501:2000],Sim_A_out$ixosc_2[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_2<-cor(Sim_A_out$m2a_2_mean[1501:2000],Sim_A_out$ixosc_2[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_2<-cor(Sim_A_out$m3a_2_mean[1501:2000],Sim_A_out$ixosc_2[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_2<-cor(Sim_A_out$m4a_2_mean[1501:2000],Sim_A_out$ixosc_2[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_2<-cor(Sim_A_out$m5a_2_mean[1501:2000],Sim_A_out$ixosc_2[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_2<-cor(Sim_A_out$m6a_2_mean[1501:2000],Sim_A_out$ixosc_2[1501:2000])  

Sim_A_out$Rsq_m1_ambam_3<-cor(Sim_A_out$m1a_3_mean[1:500],Sim_A_out$ambam_3[1:500])  
Sim_A_out$Rsq_m2_ambam_3<-cor(Sim_A_out$m2a_3_mean[1:500],Sim_A_out$ambam_3[1:500])  
Sim_A_out$Rsq_m3_ambam_3<-cor(Sim_A_out$m3a_3_mean[1:500],Sim_A_out$ambam_3[1:500])  
Sim_A_out$Rsq_m4_ambam_3<-cor(Sim_A_out$m4a_3_mean[1:500],Sim_A_out$ambam_3[1:500])  
Sim_A_out$Rsq_m5_ambam_3<-cor(Sim_A_out$m5a_3_mean[1:500],Sim_A_out$ambam_3[1:500])  
Sim_A_out$Rsq_m6_ambam_3<-cor(Sim_A_out$m6a_3_mean[1:500],Sim_A_out$ambam_3[1:500])  

Sim_A_out$Rsq_m1_ambma_3<-cor(Sim_A_out$m1a_3_mean[501:1000],Sim_A_out$ambma_3[501:1000])  
Sim_A_out$Rsq_m2_ambma_3<-cor(Sim_A_out$m2a_3_mean[501:1000],Sim_A_out$ambma_3[501:1000])  
Sim_A_out$Rsq_m3_ambma_3<-cor(Sim_A_out$m3a_3_mean[501:1000],Sim_A_out$ambma_3[501:1000])  
Sim_A_out$Rsq_m4_ambma_3<-cor(Sim_A_out$m4a_3_mean[501:1000],Sim_A_out$ambma_3[501:1000])  
Sim_A_out$Rsq_m5_ambma_3<-cor(Sim_A_out$m5a_3_mean[501:1000],Sim_A_out$ambma_3[501:1000])  
Sim_A_out$Rsq_m6_ambma_3<-cor(Sim_A_out$m6a_3_mean[501:1000],Sim_A_out$ambma_3[501:1000])  

Sim_A_out$Rsq_m1_derva_3<-cor(Sim_A_out$m1a_3_mean[1001:1500],Sim_A_out$derva_3[1001:1500])  
Sim_A_out$Rsq_m2_derva_3<-cor(Sim_A_out$m2a_3_mean[1001:1500],Sim_A_out$derva_3[1001:1500])  
Sim_A_out$Rsq_m3_derva_3<-cor(Sim_A_out$m3a_3_mean[1001:1500],Sim_A_out$derva_3[1001:1500])  
Sim_A_out$Rsq_m4_derva_3<-cor(Sim_A_out$m4a_3_mean[1001:1500],Sim_A_out$derva_3[1001:1500])  
Sim_A_out$Rsq_m5_derva_3<-cor(Sim_A_out$m5a_3_mean[1001:1500],Sim_A_out$derva_3[1001:1500])  
Sim_A_out$Rsq_m6_derva_3<-cor(Sim_A_out$m6a_3_mean[1001:1500],Sim_A_out$derva_3[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_3<-cor(Sim_A_out$m1a_3_mean[1501:2000],Sim_A_out$ixosc_3[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_3<-cor(Sim_A_out$m2a_3_mean[1501:2000],Sim_A_out$ixosc_3[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_3<-cor(Sim_A_out$m3a_3_mean[1501:2000],Sim_A_out$ixosc_3[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_3<-cor(Sim_A_out$m4a_3_mean[1501:2000],Sim_A_out$ixosc_3[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_3<-cor(Sim_A_out$m5a_3_mean[1501:2000],Sim_A_out$ixosc_3[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_3<-cor(Sim_A_out$m6a_3_mean[1501:2000],Sim_A_out$ixosc_3[1501:2000])

Sim_A_out$Rsq_m1_ambam_4<-cor(Sim_A_out$m1a_4_mean[1:500],Sim_A_out$ambam_4[1:500])  
Sim_A_out$Rsq_m2_ambam_4<-cor(Sim_A_out$m2a_4_mean[1:500],Sim_A_out$ambam_4[1:500])  
Sim_A_out$Rsq_m3_ambam_4<-cor(Sim_A_out$m3a_4_mean[1:500],Sim_A_out$ambam_4[1:500])  
Sim_A_out$Rsq_m4_ambam_4<-cor(Sim_A_out$m4a_4_mean[1:500],Sim_A_out$ambam_4[1:500])  
Sim_A_out$Rsq_m5_ambam_4<-cor(Sim_A_out$m5a_4_mean[1:500],Sim_A_out$ambam_4[1:500])  
Sim_A_out$Rsq_m6_ambam_4<-cor(Sim_A_out$m6a_4_mean[1:500],Sim_A_out$ambam_4[1:500])  

Sim_A_out$Rsq_m1_ambma_4<-cor(Sim_A_out$m1a_4_mean[501:1000],Sim_A_out$ambma_4[501:1000])  
Sim_A_out$Rsq_m2_ambma_4<-cor(Sim_A_out$m2a_4_mean[501:1000],Sim_A_out$ambma_4[501:1000])  
Sim_A_out$Rsq_m3_ambma_4<-cor(Sim_A_out$m3a_4_mean[501:1000],Sim_A_out$ambma_4[501:1000])  
Sim_A_out$Rsq_m4_ambma_4<-cor(Sim_A_out$m4a_4_mean[501:1000],Sim_A_out$ambma_4[501:1000])  
Sim_A_out$Rsq_m5_ambma_4<-cor(Sim_A_out$m5a_4_mean[501:1000],Sim_A_out$ambma_4[501:1000])  
Sim_A_out$Rsq_m6_ambma_4<-cor(Sim_A_out$m6a_4_mean[501:1000],Sim_A_out$ambma_4[501:1000])  

Sim_A_out$Rsq_m1_derva_4<-cor(Sim_A_out$m1a_4_mean[1001:1500],Sim_A_out$derva_4[1001:1500])  
Sim_A_out$Rsq_m2_derva_4<-cor(Sim_A_out$m2a_4_mean[1001:1500],Sim_A_out$derva_4[1001:1500])  
Sim_A_out$Rsq_m3_derva_4<-cor(Sim_A_out$m3a_4_mean[1001:1500],Sim_A_out$derva_4[1001:1500])  
Sim_A_out$Rsq_m4_derva_4<-cor(Sim_A_out$m4a_4_mean[1001:1500],Sim_A_out$derva_4[1001:1500])  
Sim_A_out$Rsq_m5_derva_4<-cor(Sim_A_out$m5a_4_mean[1001:1500],Sim_A_out$derva_4[1001:1500])  
Sim_A_out$Rsq_m6_derva_4<-cor(Sim_A_out$m6a_4_mean[1001:1500],Sim_A_out$derva_4[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_4<-cor(Sim_A_out$m1a_4_mean[1501:2000],Sim_A_out$ixosc_4[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_4<-cor(Sim_A_out$m2a_4_mean[1501:2000],Sim_A_out$ixosc_4[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_4<-cor(Sim_A_out$m3a_4_mean[1501:2000],Sim_A_out$ixosc_4[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_4<-cor(Sim_A_out$m4a_4_mean[1501:2000],Sim_A_out$ixosc_4[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_4<-cor(Sim_A_out$m5a_4_mean[1501:2000],Sim_A_out$ixosc_4[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_4<-cor(Sim_A_out$m6a_4_mean[1501:2000],Sim_A_out$ixosc_4[1501:2000])  

Sim_A_out$Rsq_m1_ambam_5<-cor(Sim_A_out$m1a_5_mean[1:500],Sim_A_out$ambam_5[1:500])  
Sim_A_out$Rsq_m2_ambam_5<-cor(Sim_A_out$m2a_5_mean[1:500],Sim_A_out$ambam_5[1:500])  
Sim_A_out$Rsq_m3_ambam_5<-cor(Sim_A_out$m3a_5_mean[1:500],Sim_A_out$ambam_5[1:500])  
Sim_A_out$Rsq_m4_ambam_5<-cor(Sim_A_out$m4a_5_mean[1:500],Sim_A_out$ambam_5[1:500])  
Sim_A_out$Rsq_m5_ambam_5<-cor(Sim_A_out$m5a_5_mean[1:500],Sim_A_out$ambam_5[1:500])  
Sim_A_out$Rsq_m6_ambam_5<-cor(Sim_A_out$m6a_5_mean[1:500],Sim_A_out$ambam_5[1:500])  

Sim_A_out$Rsq_m1_ambma_5<-cor(Sim_A_out$m1a_5_mean[501:1000],Sim_A_out$ambma_5[501:1000])  
Sim_A_out$Rsq_m2_ambma_5<-cor(Sim_A_out$m2a_5_mean[501:1000],Sim_A_out$ambma_5[501:1000])  
Sim_A_out$Rsq_m3_ambma_5<-cor(Sim_A_out$m3a_5_mean[501:1000],Sim_A_out$ambma_5[501:1000])  
Sim_A_out$Rsq_m4_ambma_5<-cor(Sim_A_out$m4a_5_mean[501:1000],Sim_A_out$ambma_5[501:1000])  
Sim_A_out$Rsq_m5_ambma_5<-cor(Sim_A_out$m5a_5_mean[501:1000],Sim_A_out$ambma_5[501:1000])  
Sim_A_out$Rsq_m6_ambma_5<-cor(Sim_A_out$m6a_5_mean[501:1000],Sim_A_out$ambma_5[501:1000])  

Sim_A_out$Rsq_m1_derva_5<-cor(Sim_A_out$m1a_5_mean[1001:1500],Sim_A_out$derva_5[1001:1500])  
Sim_A_out$Rsq_m2_derva_5<-cor(Sim_A_out$m2a_5_mean[1001:1500],Sim_A_out$derva_5[1001:1500])  
Sim_A_out$Rsq_m3_derva_5<-cor(Sim_A_out$m3a_5_mean[1001:1500],Sim_A_out$derva_5[1001:1500])  
Sim_A_out$Rsq_m4_derva_5<-cor(Sim_A_out$m4a_5_mean[1001:1500],Sim_A_out$derva_5[1001:1500])  
Sim_A_out$Rsq_m5_derva_5<-cor(Sim_A_out$m5a_5_mean[1001:1500],Sim_A_out$derva_5[1001:1500])  
Sim_A_out$Rsq_m6_derva_5<-cor(Sim_A_out$m6a_5_mean[1001:1500],Sim_A_out$derva_5[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_5<-cor(Sim_A_out$m1a_5_mean[1501:2000],Sim_A_out$ixosc_5[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_5<-cor(Sim_A_out$m2a_5_mean[1501:2000],Sim_A_out$ixosc_5[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_5<-cor(Sim_A_out$m3a_5_mean[1501:2000],Sim_A_out$ixosc_5[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_5<-cor(Sim_A_out$m4a_5_mean[1501:2000],Sim_A_out$ixosc_5[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_5<-cor(Sim_A_out$m5a_5_mean[1501:2000],Sim_A_out$ixosc_5[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_5<-cor(Sim_A_out$m6a_5_mean[1501:2000],Sim_A_out$ixosc_5[1501:2000])  

Sim_A_out$Rsq_m1_ambam_6<-cor(Sim_A_out$m1a_6_mean[1:500],Sim_A_out$ambam_6[1:500])  
Sim_A_out$Rsq_m2_ambam_6<-cor(Sim_A_out$m2a_6_mean[1:500],Sim_A_out$ambam_6[1:500])  
Sim_A_out$Rsq_m3_ambam_6<-cor(Sim_A_out$m3a_6_mean[1:500],Sim_A_out$ambam_6[1:500])  
Sim_A_out$Rsq_m4_ambam_6<-cor(Sim_A_out$m4a_6_mean[1:500],Sim_A_out$ambam_6[1:500])  
Sim_A_out$Rsq_m5_ambam_6<-cor(Sim_A_out$m5a_6_mean[1:500],Sim_A_out$ambam_6[1:500])  
Sim_A_out$Rsq_m6_ambam_6<-cor(Sim_A_out$m6a_6_mean[1:500],Sim_A_out$ambam_6[1:500])  

Sim_A_out$Rsq_m1_ambma_6<-cor(Sim_A_out$m1a_6_mean[501:1000],Sim_A_out$ambma_6[501:1000])  
Sim_A_out$Rsq_m2_ambma_6<-cor(Sim_A_out$m2a_6_mean[501:1000],Sim_A_out$ambma_6[501:1000])  
Sim_A_out$Rsq_m3_ambma_6<-cor(Sim_A_out$m3a_6_mean[501:1000],Sim_A_out$ambma_6[501:1000])  
Sim_A_out$Rsq_m4_ambma_6<-cor(Sim_A_out$m4a_6_mean[501:1000],Sim_A_out$ambma_6[501:1000])  
Sim_A_out$Rsq_m5_ambma_6<-cor(Sim_A_out$m5a_6_mean[501:1000],Sim_A_out$ambma_6[501:1000])  
Sim_A_out$Rsq_m6_ambma_6<-cor(Sim_A_out$m6a_6_mean[501:1000],Sim_A_out$ambma_6[501:1000])  

Sim_A_out$Rsq_m1_derva_6<-cor(Sim_A_out$m1a_6_mean[1001:1500],Sim_A_out$derva_6[1001:1500])  
Sim_A_out$Rsq_m2_derva_6<-cor(Sim_A_out$m2a_6_mean[1001:1500],Sim_A_out$derva_6[1001:1500])  
Sim_A_out$Rsq_m3_derva_6<-cor(Sim_A_out$m3a_6_mean[1001:1500],Sim_A_out$derva_6[1001:1500])  
Sim_A_out$Rsq_m4_derva_6<-cor(Sim_A_out$m4a_6_mean[1001:1500],Sim_A_out$derva_6[1001:1500])  
Sim_A_out$Rsq_m5_derva_6<-cor(Sim_A_out$m5a_6_mean[1001:1500],Sim_A_out$derva_6[1001:1500])  
Sim_A_out$Rsq_m6_derva_6<-cor(Sim_A_out$m6a_6_mean[1001:1500],Sim_A_out$derva_6[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_6<-cor(Sim_A_out$m1a_6_mean[1501:2000],Sim_A_out$ixosc_6[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_6<-cor(Sim_A_out$m2a_6_mean[1501:2000],Sim_A_out$ixosc_6[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_6<-cor(Sim_A_out$m3a_6_mean[1501:2000],Sim_A_out$ixosc_6[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_6<-cor(Sim_A_out$m4a_6_mean[1501:2000],Sim_A_out$ixosc_6[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_6<-cor(Sim_A_out$m5a_6_mean[1501:2000],Sim_A_out$ixosc_6[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_6<-cor(Sim_A_out$m6a_6_mean[1501:2000],Sim_A_out$ixosc_6[1501:2000])  

Sim_A_out$Rsq_m1_ambam_7<-cor(Sim_A_out$m1a_7_mean[1:500],Sim_A_out$ambam_7[1:500])  
Sim_A_out$Rsq_m2_ambam_7<-cor(Sim_A_out$m2a_7_mean[1:500],Sim_A_out$ambam_7[1:500])  
Sim_A_out$Rsq_m3_ambam_7<-cor(Sim_A_out$m3a_7_mean[1:500],Sim_A_out$ambam_7[1:500])  
Sim_A_out$Rsq_m4_ambam_7<-cor(Sim_A_out$m4a_7_mean[1:500],Sim_A_out$ambam_7[1:500])  
Sim_A_out$Rsq_m5_ambam_7<-cor(Sim_A_out$m5a_7_mean[1:500],Sim_A_out$ambam_7[1:500])  
Sim_A_out$Rsq_m6_ambam_7<-cor(Sim_A_out$m6a_7_mean[1:500],Sim_A_out$ambam_7[1:500])  

Sim_A_out$Rsq_m1_ambma_7<-cor(Sim_A_out$m1a_7_mean[501:1000],Sim_A_out$ambma_7[501:1000])  
Sim_A_out$Rsq_m2_ambma_7<-cor(Sim_A_out$m2a_7_mean[501:1000],Sim_A_out$ambma_7[501:1000])  
Sim_A_out$Rsq_m3_ambma_7<-cor(Sim_A_out$m3a_7_mean[501:1000],Sim_A_out$ambma_7[501:1000])  
Sim_A_out$Rsq_m4_ambma_7<-cor(Sim_A_out$m4a_7_mean[501:1000],Sim_A_out$ambma_7[501:1000])  
Sim_A_out$Rsq_m5_ambma_7<-cor(Sim_A_out$m5a_7_mean[501:1000],Sim_A_out$ambma_7[501:1000])  
Sim_A_out$Rsq_m6_ambma_7<-cor(Sim_A_out$m6a_7_mean[501:1000],Sim_A_out$ambma_7[501:1000])  

Sim_A_out$Rsq_m1_derva_7<-cor(Sim_A_out$m1a_7_mean[1001:1500],Sim_A_out$derva_7[1001:1500])  
Sim_A_out$Rsq_m2_derva_7<-cor(Sim_A_out$m2a_7_mean[1001:1500],Sim_A_out$derva_7[1001:1500])  
Sim_A_out$Rsq_m3_derva_7<-cor(Sim_A_out$m3a_7_mean[1001:1500],Sim_A_out$derva_7[1001:1500])  
Sim_A_out$Rsq_m4_derva_7<-cor(Sim_A_out$m4a_7_mean[1001:1500],Sim_A_out$derva_7[1001:1500])  
Sim_A_out$Rsq_m5_derva_7<-cor(Sim_A_out$m5a_7_mean[1001:1500],Sim_A_out$derva_7[1001:1500])  
Sim_A_out$Rsq_m6_derva_7<-cor(Sim_A_out$m6a_7_mean[1001:1500],Sim_A_out$derva_7[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_7<-cor(Sim_A_out$m1a_7_mean[1501:2000],Sim_A_out$ixosc_7[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_7<-cor(Sim_A_out$m2a_7_mean[1501:2000],Sim_A_out$ixosc_7[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_7<-cor(Sim_A_out$m3a_7_mean[1501:2000],Sim_A_out$ixosc_7[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_7<-cor(Sim_A_out$m4a_7_mean[1501:2000],Sim_A_out$ixosc_7[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_7<-cor(Sim_A_out$m5a_7_mean[1501:2000],Sim_A_out$ixosc_7[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_7<-cor(Sim_A_out$m6a_7_mean[1501:2000],Sim_A_out$ixosc_7[1501:2000])

Sim_A_out$Rsq_m1_ambam_8<-cor(Sim_A_out$m1a_8_mean[1:500],Sim_A_out$ambam_8[1:500])  
Sim_A_out$Rsq_m2_ambam_8<-cor(Sim_A_out$m2a_8_mean[1:500],Sim_A_out$ambam_8[1:500])  
Sim_A_out$Rsq_m3_ambam_8<-cor(Sim_A_out$m3a_8_mean[1:500],Sim_A_out$ambam_8[1:500])  
Sim_A_out$Rsq_m4_ambam_8<-cor(Sim_A_out$m4a_8_mean[1:500],Sim_A_out$ambam_8[1:500])  
Sim_A_out$Rsq_m5_ambam_8<-cor(Sim_A_out$m5a_8_mean[1:500],Sim_A_out$ambam_8[1:500])  
Sim_A_out$Rsq_m6_ambam_8<-cor(Sim_A_out$m6a_8_mean[1:500],Sim_A_out$ambam_8[1:500])  

Sim_A_out$Rsq_m1_ambma_8<-cor(Sim_A_out$m1a_8_mean[501:1000],Sim_A_out$ambma_8[501:1000])  
Sim_A_out$Rsq_m2_ambma_8<-cor(Sim_A_out$m2a_8_mean[501:1000],Sim_A_out$ambma_8[501:1000])  
Sim_A_out$Rsq_m3_ambma_8<-cor(Sim_A_out$m3a_8_mean[501:1000],Sim_A_out$ambma_8[501:1000])  
Sim_A_out$Rsq_m4_ambma_8<-cor(Sim_A_out$m4a_8_mean[501:1000],Sim_A_out$ambma_8[501:1000])  
Sim_A_out$Rsq_m5_ambma_8<-cor(Sim_A_out$m5a_8_mean[501:1000],Sim_A_out$ambma_8[501:1000])  
Sim_A_out$Rsq_m6_ambma_8<-cor(Sim_A_out$m6a_8_mean[501:1000],Sim_A_out$ambma_8[501:1000])  

Sim_A_out$Rsq_m1_derva_8<-cor(Sim_A_out$m1a_8_mean[1001:1500],Sim_A_out$derva_8[1001:1500])  
Sim_A_out$Rsq_m2_derva_8<-cor(Sim_A_out$m2a_8_mean[1001:1500],Sim_A_out$derva_8[1001:1500])  
Sim_A_out$Rsq_m3_derva_8<-cor(Sim_A_out$m3a_8_mean[1001:1500],Sim_A_out$derva_8[1001:1500])  
Sim_A_out$Rsq_m4_derva_8<-cor(Sim_A_out$m4a_8_mean[1001:1500],Sim_A_out$derva_8[1001:1500])  
Sim_A_out$Rsq_m5_derva_8<-cor(Sim_A_out$m5a_8_mean[1001:1500],Sim_A_out$derva_8[1001:1500])  
Sim_A_out$Rsq_m6_derva_8<-cor(Sim_A_out$m6a_8_mean[1001:1500],Sim_A_out$derva_8[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_8<-cor(Sim_A_out$m1a_8_mean[1501:2000],Sim_A_out$ixosc_8[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_8<-cor(Sim_A_out$m2a_8_mean[1501:2000],Sim_A_out$ixosc_8[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_8<-cor(Sim_A_out$m3a_8_mean[1501:2000],Sim_A_out$ixosc_8[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_8<-cor(Sim_A_out$m4a_8_mean[1501:2000],Sim_A_out$ixosc_8[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_8<-cor(Sim_A_out$m5a_8_mean[1501:2000],Sim_A_out$ixosc_8[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_8<-cor(Sim_A_out$m6a_8_mean[1501:2000],Sim_A_out$ixosc_8[1501:2000])  

Sim_A_out$Rsq_m1_ambam_9<-cor(Sim_A_out$m1a_9_mean[1:500],Sim_A_out$ambam_9[1:500])  
Sim_A_out$Rsq_m2_ambam_9<-cor(Sim_A_out$m2a_9_mean[1:500],Sim_A_out$ambam_9[1:500])  
Sim_A_out$Rsq_m3_ambam_9<-cor(Sim_A_out$m3a_9_mean[1:500],Sim_A_out$ambam_9[1:500])  
Sim_A_out$Rsq_m4_ambam_9<-cor(Sim_A_out$m4a_9_mean[1:500],Sim_A_out$ambam_9[1:500])  
Sim_A_out$Rsq_m5_ambam_9<-cor(Sim_A_out$m5a_9_mean[1:500],Sim_A_out$ambam_9[1:500])  
Sim_A_out$Rsq_m6_ambam_9<-cor(Sim_A_out$m6a_9_mean[1:500],Sim_A_out$ambam_9[1:500])  

Sim_A_out$Rsq_m1_ambma_9<-cor(Sim_A_out$m1a_9_mean[501:1000],Sim_A_out$ambma_9[501:1000])  
Sim_A_out$Rsq_m2_ambma_9<-cor(Sim_A_out$m2a_9_mean[501:1000],Sim_A_out$ambma_9[501:1000])  
Sim_A_out$Rsq_m3_ambma_9<-cor(Sim_A_out$m3a_9_mean[501:1000],Sim_A_out$ambma_9[501:1000])  
Sim_A_out$Rsq_m4_ambma_9<-cor(Sim_A_out$m4a_9_mean[501:1000],Sim_A_out$ambma_9[501:1000])  
Sim_A_out$Rsq_m5_ambma_9<-cor(Sim_A_out$m5a_9_mean[501:1000],Sim_A_out$ambma_9[501:1000])  
Sim_A_out$Rsq_m6_ambma_9<-cor(Sim_A_out$m6a_9_mean[501:1000],Sim_A_out$ambma_9[501:1000])  

Sim_A_out$Rsq_m1_derva_9<-cor(Sim_A_out$m1a_9_mean[1001:1500],Sim_A_out$derva_9[1001:1500])  
Sim_A_out$Rsq_m2_derva_9<-cor(Sim_A_out$m2a_9_mean[1001:1500],Sim_A_out$derva_9[1001:1500])  
Sim_A_out$Rsq_m3_derva_9<-cor(Sim_A_out$m3a_9_mean[1001:1500],Sim_A_out$derva_9[1001:1500])  
Sim_A_out$Rsq_m4_derva_9<-cor(Sim_A_out$m4a_9_mean[1001:1500],Sim_A_out$derva_9[1001:1500])  
Sim_A_out$Rsq_m5_derva_9<-cor(Sim_A_out$m5a_9_mean[1001:1500],Sim_A_out$derva_9[1001:1500])  
Sim_A_out$Rsq_m6_derva_9<-cor(Sim_A_out$m6a_9_mean[1001:1500],Sim_A_out$derva_9[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_9<-cor(Sim_A_out$m1a_9_mean[1501:2000],Sim_A_out$ixosc_9[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_9<-cor(Sim_A_out$m2a_9_mean[1501:2000],Sim_A_out$ixosc_9[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_9<-cor(Sim_A_out$m3a_9_mean[1501:2000],Sim_A_out$ixosc_9[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_9<-cor(Sim_A_out$m4a_9_mean[1501:2000],Sim_A_out$ixosc_9[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_9<-cor(Sim_A_out$m5a_9_mean[1501:2000],Sim_A_out$ixosc_9[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_9<-cor(Sim_A_out$m6a_9_mean[1501:2000],Sim_A_out$ixosc_9[1501:2000])  

Sim_A_out$Rsq_m1_ambam_10<-cor(Sim_A_out$m1a_10_mean[1:500],Sim_A_out$ambam_10[1:500])  
Sim_A_out$Rsq_m2_ambam_10<-cor(Sim_A_out$m2a_10_mean[1:500],Sim_A_out$ambam_10[1:500])  
Sim_A_out$Rsq_m3_ambam_10<-cor(Sim_A_out$m3a_10_mean[1:500],Sim_A_out$ambam_10[1:500])  
Sim_A_out$Rsq_m4_ambam_10<-cor(Sim_A_out$m4a_10_mean[1:500],Sim_A_out$ambam_10[1:500])  
Sim_A_out$Rsq_m5_ambam_10<-cor(Sim_A_out$m5a_10_mean[1:500],Sim_A_out$ambam_10[1:500])  
Sim_A_out$Rsq_m6_ambam_10<-cor(Sim_A_out$m6a_10_mean[1:500],Sim_A_out$ambam_10[1:500])  

Sim_A_out$Rsq_m1_ambma_10<-cor(Sim_A_out$m1a_10_mean[501:1000],Sim_A_out$ambma_10[501:1000])  
Sim_A_out$Rsq_m2_ambma_10<-cor(Sim_A_out$m2a_10_mean[501:1000],Sim_A_out$ambma_10[501:1000])  
Sim_A_out$Rsq_m3_ambma_10<-cor(Sim_A_out$m3a_10_mean[501:1000],Sim_A_out$ambma_10[501:1000])  
Sim_A_out$Rsq_m4_ambma_10<-cor(Sim_A_out$m4a_10_mean[501:1000],Sim_A_out$ambma_10[501:1000])  
Sim_A_out$Rsq_m5_ambma_10<-cor(Sim_A_out$m5a_10_mean[501:1000],Sim_A_out$ambma_10[501:1000])  
Sim_A_out$Rsq_m6_ambma_10<-cor(Sim_A_out$m6a_10_mean[501:1000],Sim_A_out$ambma_10[501:1000])  

Sim_A_out$Rsq_m1_derva_10<-cor(Sim_A_out$m1a_10_mean[1001:1500],Sim_A_out$derva_10[1001:1500])  
Sim_A_out$Rsq_m2_derva_10<-cor(Sim_A_out$m2a_10_mean[1001:1500],Sim_A_out$derva_10[1001:1500])  
Sim_A_out$Rsq_m3_derva_10<-cor(Sim_A_out$m3a_10_mean[1001:1500],Sim_A_out$derva_10[1001:1500])  
Sim_A_out$Rsq_m4_derva_10<-cor(Sim_A_out$m4a_10_mean[1001:1500],Sim_A_out$derva_10[1001:1500])  
Sim_A_out$Rsq_m5_derva_10<-cor(Sim_A_out$m5a_10_mean[1001:1500],Sim_A_out$derva_10[1001:1500])  
Sim_A_out$Rsq_m6_derva_10<-cor(Sim_A_out$m6a_10_mean[1001:1500],Sim_A_out$derva_10[1001:1500])  

Sim_A_out$Rsq_m1_ixosc_10<-cor(Sim_A_out$m1a_10_mean[1501:2000],Sim_A_out$ixosc_10[1501:2000])  
Sim_A_out$Rsq_m2_ixosc_10<-cor(Sim_A_out$m2a_10_mean[1501:2000],Sim_A_out$ixosc_10[1501:2000])  
Sim_A_out$Rsq_m3_ixosc_10<-cor(Sim_A_out$m3a_10_mean[1501:2000],Sim_A_out$ixosc_10[1501:2000])  
Sim_A_out$Rsq_m4_ixosc_10<-cor(Sim_A_out$m4a_10_mean[1501:2000],Sim_A_out$ixosc_10[1501:2000])  
Sim_A_out$Rsq_m5_ixosc_10<-cor(Sim_A_out$m5a_10_mean[1501:2000],Sim_A_out$ixosc_10[1501:2000])  
Sim_A_out$Rsq_m6_ixosc_10<-cor(Sim_A_out$m6a_10_mean[1501:2000],Sim_A_out$ixosc_10[1501:2000])  




##Bind Sim C together
Sim_C_out<-cbind(m1c_1[1:1530,2:3],m2c_1[1:1530,2:3],m3c_1[1:1530,2:3],m4c_1[1:1530,2:3],m5c_1[1:1530,2:3],m6c_1[1:1530,2:3],
                 m1c_2[1:1530,2:3],m2c_2[1:1530,2:3],m3c_2[1:1530,2:3],m4c_2[1:1530,2:3],m5c_2[1:1530,2:3],m6c_2[1:1530,2:3],
                 m1c_3[1:1530,2:3],m2c_3[1:1530,2:3],m3c_3[1:1530,2:3],m4c_3[1:1530,2:3],m5c_3[1:1530,2:3],m6c_3[1:1530,2:3],
                 m1c_4[1:1530,2:3],m2c_4[1:1530,2:3],m3c_4[1:1530,2:3],m4c_4[1:1530,2:3],m5c_4[1:1530,2:3],m6c_4[1:1530,2:3],
                 m1c_5[1:1530,2:3],m2c_5[1:1530,2:3],m3c_5[1:1530,2:3],m4c_5[1:1530,2:3],m5c_5[1:1530,2:3],m6c_5[1:1530,2:3],
                 m1c_6[1:1530,2:3],m2c_6[1:1530,2:3],m3c_6[1:1530,2:3],m4c_6[1:1530,2:3],m5c_6[1:1530,2:3],m6c_6[1:1530,2:3],
                 m1c_7[1:1530,2:3],m2c_7[1:1530,2:3],m3c_7[1:1530,2:3],m4c_7[1:1530,2:3],m5c_7[1:1530,2:3],m6c_7[1:1530,2:3],
                 m1c_8[1:1530,2:3],m2c_8[1:1530,2:3],m3c_8[1:1530,2:3],m4c_8[1:1530,2:3],m5c_8[1:1530,2:3],m6c_8[1:1530,2:3],
                 m1c_9[1:1530,2:3],m2c_9[1:1530,2:3],m3c_9[1:1530,2:3],m4c_9[1:1530,2:3],m5c_9[1:1530,2:3],m6c_9[1:1530,2:3],
                 m1c_10[1:1530,2:3],m2c_10[1:1530,2:3],m3c_10[1:1530,2:3],m4c_10[1:1530,2:3],m5c_10[1:1530,2:3],m6c_10[1:1530,2:3],
                 sim_c_3[,50:89])
colnames(Sim_C_out)<-c("m1_c_1_mean","m1c_1_unc",
                       "m2_c_1_mean","m2c_1_unc",
                       "m3_c_1_mean","m3c_1_unc",
                       "m4_c_1_mean","m4c_1_unc",
                       "m5_c_1_mean","m5c_1_unc",
                       "m6_c_1_mean","m6c_1_unc",
                       
                       "m1_c_2_mean","m1c_2_unc",
                       "m2_c_2_mean","m2c_2_unc",
                       "m3_c_2_mean","m3c_2_unc",
                       "m4_c_2_mean","m4c_2_unc",
                       "m5_c_2_mean","m5c_2_unc",
                       "m6_c_2_mean","m6c_2_unc",
                       
                       "m1_c_3_mean","m1c_3_unc",
                       "m2_c_3_mean","m2c_3_unc",
                       "m3_c_3_mean","m3c_3_unc",
                       "m4_c_3_mean","m4c_3_unc",
                       "m5_c_3_mean","m5c_3_unc",
                       "m6_c_3_mean","m6c_3_unc",
                       
                       "m1_c_4_mean","m1c_4_unc",
                       "m2_c_4_mean","m2c_4_unc",
                       "m3_c_4_mean","m3c_4_unc",
                       "m4_c_4_mean","m4c_4_unc",
                       "m5_c_4_mean","m5c_4_unc",
                       "m6_c_4_mean","m6c_4_unc",
                       
                       "m1_c_5_mean","m1c_5_unc",
                       "m2_c_5_mean","m2c_5_unc",
                       "m3_c_5_mean","m3c_5_unc",
                       "m4_c_5_mean","m4c_5_unc",
                       "m5_c_5_mean","m5c_5_unc",
                       "m6_c_5_mean","m6c_5_unc",
                       
                       "m1_c_6_mean","m1c_6_unc",
                       "m2_c_6_mean","m2c_6_unc",
                       "m3_c_6_mean","m3c_6_unc",
                       "m4_c_6_mean","m4c_6_unc",
                       "m5_c_6_mean","m5c_6_unc",
                       "m6_c_6_mean","m6c_6_unc",
                       
                       "m1_c_7_mean","m1c_7_unc",
                       "m2_c_7_mean","m2c_7_unc",
                       "m3_c_7_mean","m3c_7_unc",
                       "m4_c_7_mean","m4c_7_unc",
                       "m5_c_7_mean","m5c_7_unc",
                       "m6_c_7_mean","m6c_7_unc",
                       
                       "m1_c_8_mean","m1c_8_unc",
                       "m2_c_8_mean","m2c_8_unc",
                       "m3_c_8_mean","m3c_8_unc",
                       "m4_c_8_mean","m4c_8_unc",
                       "m5_c_8_mean","m5c_8_unc",
                       "m6_c_8_mean","m6c_8_unc",
                       
                       "m1_c_9_mean","m1c_9_unc",
                       "m2_c_9_mean","m2c_9_unc",
                       "m3_c_9_mean","m3c_9_unc",
                       "m4_c_9_mean","m4c_9_unc",
                       "m5_c_9_mean","m5c_9_unc",
                       "m6_c_9_mean","m6c_9_unc",
                       
                       "m1_c_10_mean","m1c_10_unc",
                       "m2_c_10_mean","m2c_10_unc",
                       "m3_c_10_mean","m3c_10_unc",
                       "m4_c_10_mean","m4c_10_unc",
                       "m5_c_10_mean","m5c_10_unc",
                       "m6_c_10_mean","m6c_10_unc",
                       "ambam_1",
                       "ambam_2",
                       "ambam_3",
                       "ambam_4",
                       "ambam_5",
                       "ambam_6",
                       "ambam_7",
                       "ambam_8",
                       "ambam_9",
                       "ambam_10",
                       
                       "ambma_1",
                       "ambma_2",
                       "ambma_3",
                       "ambma_4",
                       "ambma_5",
                       "ambma_6",
                       "ambma_7",
                       "ambma_8",
                       "ambma_9",
                       "ambma_10",
                       
                       "derva_1",
                       "derva_2",
                       "derva_3",
                       "derva_4",
                       "derva_5",
                       "derva_6",
                       "derva_7",
                       "derva_8",
                       "derva_9",
                       "derva_10",
                       
                       "ixosc_1",
                       "ixosc_2",
                       "ixosc_3",
                       "ixosc_4",
                       "ixosc_5",
                       "ixosc_6",
                       "ixosc_7",
                       "ixosc_8",
                       "ixosc_9",
                       "ixosc_10")



Sim_C_out$Rsq_m1_ambam_1<-cor(Sim_C_out$m1_c_1_mean[1:500],Sim_C_out$ambam_1[1:500])  
Sim_C_out$Rsq_m2_ambam_1<-cor(Sim_C_out$m2_c_1_mean[1:500],Sim_C_out$ambam_1[1:500])  
Sim_C_out$Rsq_m3_ambam_1<-cor(Sim_C_out$m3_c_1_mean[1:500],Sim_C_out$ambam_1[1:500])  
Sim_C_out$Rsq_m4_ambam_1<-cor(Sim_C_out$m4_c_1_mean[1:500],Sim_C_out$ambam_1[1:500])  
Sim_C_out$Rsq_m5_ambam_1<-cor(Sim_C_out$m5_c_1_mean[1:500],Sim_C_out$ambam_1[1:500])  
Sim_C_out$Rsq_m6_ambam_1<-cor(Sim_C_out$m6_c_1_mean[1:500],Sim_C_out$ambam_1[1:500])  

Sim_C_out$Rsq_m1_ambma_1<-cor(Sim_C_out$m1_c_1_mean[501:1000],Sim_C_out$ambma_1[501:1000])  
Sim_C_out$Rsq_m2_ambma_1<-cor(Sim_C_out$m2_c_1_mean[501:1000],Sim_C_out$ambma_1[501:1000])  
Sim_C_out$Rsq_m3_ambma_1<-cor(Sim_C_out$m3_c_1_mean[501:1000],Sim_C_out$ambma_1[501:1000])  
Sim_C_out$Rsq_m4_ambma_1<-cor(Sim_C_out$m4_c_1_mean[501:1000],Sim_C_out$ambma_1[501:1000])  
Sim_C_out$Rsq_m5_ambma_1<-cor(Sim_C_out$m5_c_1_mean[501:1000],Sim_C_out$ambma_1[501:1000])  
Sim_C_out$Rsq_m6_ambma_1<-cor(Sim_C_out$m6_c_1_mean[501:1000],Sim_C_out$ambma_1[501:1000])  

Sim_C_out$Rsq_m1_derva_1<-cor(Sim_C_out$m1_c_1_mean[1001:1500],Sim_C_out$derva_1[1001:1500])  
Sim_C_out$Rsq_m2_derva_1<-cor(Sim_C_out$m2_c_1_mean[1001:1500],Sim_C_out$derva_1[1001:1500])  
Sim_C_out$Rsq_m3_derva_1<-cor(Sim_C_out$m3_c_1_mean[1001:1500],Sim_C_out$derva_1[1001:1500])  
Sim_C_out$Rsq_m4_derva_1<-cor(Sim_C_out$m4_c_1_mean[1001:1500],Sim_C_out$derva_1[1001:1500])  
Sim_C_out$Rsq_m5_derva_1<-cor(Sim_C_out$m5_c_1_mean[1001:1500],Sim_C_out$derva_1[1001:1500])  
Sim_C_out$Rsq_m6_derva_1<-cor(Sim_C_out$m6_c_1_mean[1001:1500],Sim_C_out$derva_1[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_1<-cor(Sim_C_out$m1_c_1_mean[1501:1530],Sim_C_out$ixosc_1[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_1<-cor(Sim_C_out$m2_c_1_mean[1501:1530],Sim_C_out$ixosc_1[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_1<-cor(Sim_C_out$m3_c_1_mean[1501:1530],Sim_C_out$ixosc_1[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_1<-cor(Sim_C_out$m4_c_1_mean[1501:1530],Sim_C_out$ixosc_1[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_1<-cor(Sim_C_out$m5_c_1_mean[1501:1530],Sim_C_out$ixosc_1[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_1<-cor(Sim_C_out$m6_c_1_mean[1501:1530],Sim_C_out$ixosc_1[1501:1530])  

Sim_C_out$Rsq_m1_ambam_2<-cor(Sim_C_out$m1_c_2_mean[1:500],Sim_C_out$ambam_2[1:500])  
Sim_C_out$Rsq_m2_ambam_2<-cor(Sim_C_out$m2_c_2_mean[1:500],Sim_C_out$ambam_2[1:500])  
Sim_C_out$Rsq_m3_ambam_2<-cor(Sim_C_out$m3_c_2_mean[1:500],Sim_C_out$ambam_2[1:500])  
Sim_C_out$Rsq_m4_ambam_2<-cor(Sim_C_out$m4_c_2_mean[1:500],Sim_C_out$ambam_2[1:500])  
Sim_C_out$Rsq_m5_ambam_2<-cor(Sim_C_out$m5_c_2_mean[1:500],Sim_C_out$ambam_2[1:500])  
Sim_C_out$Rsq_m6_ambam_2<-cor(Sim_C_out$m6_c_2_mean[1:500],Sim_C_out$ambam_2[1:500])  

Sim_C_out$Rsq_m1_ambma_2<-cor(Sim_C_out$m1_c_2_mean[501:1000],Sim_C_out$ambma_2[501:1000])  
Sim_C_out$Rsq_m2_ambma_2<-cor(Sim_C_out$m2_c_2_mean[501:1000],Sim_C_out$ambma_2[501:1000])  
Sim_C_out$Rsq_m3_ambma_2<-cor(Sim_C_out$m3_c_2_mean[501:1000],Sim_C_out$ambma_2[501:1000])  
Sim_C_out$Rsq_m4_ambma_2<-cor(Sim_C_out$m4_c_2_mean[501:1000],Sim_C_out$ambma_2[501:1000])  
Sim_C_out$Rsq_m5_ambma_2<-cor(Sim_C_out$m5_c_2_mean[501:1000],Sim_C_out$ambma_2[501:1000])  
Sim_C_out$Rsq_m6_ambma_2<-cor(Sim_C_out$m6_c_2_mean[501:1000],Sim_C_out$ambma_2[501:1000])  

Sim_C_out$Rsq_m1_derva_2<-cor(Sim_C_out$m1_c_2_mean[1001:1500],Sim_C_out$derva_2[1001:1500])  
Sim_C_out$Rsq_m2_derva_2<-cor(Sim_C_out$m2_c_2_mean[1001:1500],Sim_C_out$derva_2[1001:1500])  
Sim_C_out$Rsq_m3_derva_2<-cor(Sim_C_out$m3_c_2_mean[1001:1500],Sim_C_out$derva_2[1001:1500])  
Sim_C_out$Rsq_m4_derva_2<-cor(Sim_C_out$m4_c_2_mean[1001:1500],Sim_C_out$derva_2[1001:1500])  
Sim_C_out$Rsq_m5_derva_2<-cor(Sim_C_out$m5_c_2_mean[1001:1500],Sim_C_out$derva_2[1001:1500])  
Sim_C_out$Rsq_m6_derva_2<-cor(Sim_C_out$m6_c_2_mean[1001:1500],Sim_C_out$derva_2[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_2<-cor(Sim_C_out$m1_c_2_mean[1501:1530],Sim_C_out$ixosc_2[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_2<-cor(Sim_C_out$m2_c_2_mean[1501:1530],Sim_C_out$ixosc_2[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_2<-cor(Sim_C_out$m3_c_2_mean[1501:1530],Sim_C_out$ixosc_2[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_2<-cor(Sim_C_out$m4_c_2_mean[1501:1530],Sim_C_out$ixosc_2[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_2<-cor(Sim_C_out$m5_c_2_mean[1501:1530],Sim_C_out$ixosc_2[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_2<-cor(Sim_C_out$m6_c_2_mean[1501:1530],Sim_C_out$ixosc_2[1501:1530])  

Sim_C_out$Rsq_m1_ambam_3<-cor(Sim_C_out$m1_c_3_mean[1:500],Sim_C_out$ambam_3[1:500])  
Sim_C_out$Rsq_m2_ambam_3<-cor(Sim_C_out$m2_c_3_mean[1:500],Sim_C_out$ambam_3[1:500])  
Sim_C_out$Rsq_m3_ambam_3<-cor(Sim_C_out$m3_c_3_mean[1:500],Sim_C_out$ambam_3[1:500])  
Sim_C_out$Rsq_m4_ambam_3<-cor(Sim_C_out$m4_c_3_mean[1:500],Sim_C_out$ambam_3[1:500])  
Sim_C_out$Rsq_m5_ambam_3<-cor(Sim_C_out$m5_c_3_mean[1:500],Sim_C_out$ambam_3[1:500])  
Sim_C_out$Rsq_m6_ambam_3<-cor(Sim_C_out$m6_c_3_mean[1:500],Sim_C_out$ambam_3[1:500])  

Sim_C_out$Rsq_m1_ambma_3<-cor(Sim_C_out$m1_c_3_mean[501:1000],Sim_C_out$ambma_3[501:1000])  
Sim_C_out$Rsq_m2_ambma_3<-cor(Sim_C_out$m2_c_3_mean[501:1000],Sim_C_out$ambma_3[501:1000])  
Sim_C_out$Rsq_m3_ambma_3<-cor(Sim_C_out$m3_c_3_mean[501:1000],Sim_C_out$ambma_3[501:1000])  
Sim_C_out$Rsq_m4_ambma_3<-cor(Sim_C_out$m4_c_3_mean[501:1000],Sim_C_out$ambma_3[501:1000])  
Sim_C_out$Rsq_m5_ambma_3<-cor(Sim_C_out$m5_c_3_mean[501:1000],Sim_C_out$ambma_3[501:1000])  
Sim_C_out$Rsq_m6_ambma_3<-cor(Sim_C_out$m6_c_3_mean[501:1000],Sim_C_out$ambma_3[501:1000])  

Sim_C_out$Rsq_m1_derva_3<-cor(Sim_C_out$m1_c_3_mean[1001:1500],Sim_C_out$derva_3[1001:1500])  
Sim_C_out$Rsq_m2_derva_3<-cor(Sim_C_out$m2_c_3_mean[1001:1500],Sim_C_out$derva_3[1001:1500])  
Sim_C_out$Rsq_m3_derva_3<-cor(Sim_C_out$m3_c_3_mean[1001:1500],Sim_C_out$derva_3[1001:1500])  
Sim_C_out$Rsq_m4_derva_3<-cor(Sim_C_out$m4_c_3_mean[1001:1500],Sim_C_out$derva_3[1001:1500])  
Sim_C_out$Rsq_m5_derva_3<-cor(Sim_C_out$m5_c_3_mean[1001:1500],Sim_C_out$derva_3[1001:1500])  
Sim_C_out$Rsq_m6_derva_3<-cor(Sim_C_out$m6_c_3_mean[1001:1500],Sim_C_out$derva_3[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_3<-cor(Sim_C_out$m1_c_3_mean[1501:1530],Sim_C_out$ixosc_3[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_3<-cor(Sim_C_out$m2_c_3_mean[1501:1530],Sim_C_out$ixosc_3[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_3<-cor(Sim_C_out$m3_c_3_mean[1501:1530],Sim_C_out$ixosc_3[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_3<-cor(Sim_C_out$m4_c_3_mean[1501:1530],Sim_C_out$ixosc_3[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_3<-cor(Sim_C_out$m5_c_3_mean[1501:1530],Sim_C_out$ixosc_3[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_3<-cor(Sim_C_out$m6_c_3_mean[1501:1530],Sim_C_out$ixosc_3[1501:1530])

Sim_C_out$Rsq_m1_ambam_4<-cor(Sim_C_out$m1_c_4_mean[1:500],Sim_C_out$ambam_4[1:500])  
Sim_C_out$Rsq_m2_ambam_4<-cor(Sim_C_out$m2_c_4_mean[1:500],Sim_C_out$ambam_4[1:500])  
Sim_C_out$Rsq_m3_ambam_4<-cor(Sim_C_out$m3_c_4_mean[1:500],Sim_C_out$ambam_4[1:500])  
Sim_C_out$Rsq_m4_ambam_4<-cor(Sim_C_out$m4_c_4_mean[1:500],Sim_C_out$ambam_4[1:500])  
Sim_C_out$Rsq_m5_ambam_4<-cor(Sim_C_out$m5_c_4_mean[1:500],Sim_C_out$ambam_4[1:500])  
Sim_C_out$Rsq_m6_ambam_4<-cor(Sim_C_out$m6_c_4_mean[1:500],Sim_C_out$ambam_4[1:500])  

Sim_C_out$Rsq_m1_ambma_4<-cor(Sim_C_out$m1_c_4_mean[501:1000],Sim_C_out$ambma_4[501:1000])  
Sim_C_out$Rsq_m2_ambma_4<-cor(Sim_C_out$m2_c_4_mean[501:1000],Sim_C_out$ambma_4[501:1000])  
Sim_C_out$Rsq_m3_ambma_4<-cor(Sim_C_out$m3_c_4_mean[501:1000],Sim_C_out$ambma_4[501:1000])  
Sim_C_out$Rsq_m4_ambma_4<-cor(Sim_C_out$m4_c_4_mean[501:1000],Sim_C_out$ambma_4[501:1000])  
Sim_C_out$Rsq_m5_ambma_4<-cor(Sim_C_out$m5_c_4_mean[501:1000],Sim_C_out$ambma_4[501:1000])  
Sim_C_out$Rsq_m6_ambma_4<-cor(Sim_C_out$m6_c_4_mean[501:1000],Sim_C_out$ambma_4[501:1000])  

Sim_C_out$Rsq_m1_derva_4<-cor(Sim_C_out$m1_c_4_mean[1001:1500],Sim_C_out$derva_4[1001:1500])  
Sim_C_out$Rsq_m2_derva_4<-cor(Sim_C_out$m2_c_4_mean[1001:1500],Sim_C_out$derva_4[1001:1500])  
Sim_C_out$Rsq_m3_derva_4<-cor(Sim_C_out$m3_c_4_mean[1001:1500],Sim_C_out$derva_4[1001:1500])  
Sim_C_out$Rsq_m4_derva_4<-cor(Sim_C_out$m4_c_4_mean[1001:1500],Sim_C_out$derva_4[1001:1500])  
Sim_C_out$Rsq_m5_derva_4<-cor(Sim_C_out$m5_c_4_mean[1001:1500],Sim_C_out$derva_4[1001:1500])  
Sim_C_out$Rsq_m6_derva_4<-cor(Sim_C_out$m6_c_4_mean[1001:1500],Sim_C_out$derva_4[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_4<-cor(Sim_C_out$m1_c_4_mean[1501:1530],Sim_C_out$ixosc_4[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_4<-cor(Sim_C_out$m2_c_4_mean[1501:1530],Sim_C_out$ixosc_4[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_4<-cor(Sim_C_out$m3_c_4_mean[1501:1530],Sim_C_out$ixosc_4[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_4<-cor(Sim_C_out$m4_c_4_mean[1501:1530],Sim_C_out$ixosc_4[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_4<-cor(Sim_C_out$m5_c_4_mean[1501:1530],Sim_C_out$ixosc_4[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_4<-cor(Sim_C_out$m6_c_4_mean[1501:1530],Sim_C_out$ixosc_4[1501:1530])  

Sim_C_out$Rsq_m1_ambam_5<-cor(Sim_C_out$m1_c_5_mean,Sim_C_out$ambam_5)  
Sim_C_out$Rsq_m2_ambam_5<-cor(Sim_C_out$m2_c_5_mean[1:500],Sim_C_out$ambam_5[1:500])  
Sim_C_out$Rsq_m3_ambam_5<-cor(Sim_C_out$m3_c_5_mean[1:500],Sim_C_out$ambam_5[1:500])  
Sim_C_out$Rsq_m4_ambam_5<-cor(Sim_C_out$m4_c_5_mean[1:500],Sim_C_out$ambam_5[1:500])  
Sim_C_out$Rsq_m5_ambam_5<-cor(Sim_C_out$m5_c_5_mean[1:500],Sim_C_out$ambam_5[1:500])  
Sim_C_out$Rsq_m6_ambam_5<-cor(Sim_C_out$m6_c_5_mean[1:500],Sim_C_out$ambam_5[1:500])  

Sim_C_out$Rsq_m1_ambma_5<-cor(Sim_C_out$m1_c_5_mean[501:1000],Sim_C_out$ambma_5[501:1000])  
Sim_C_out$Rsq_m2_ambma_5<-cor(Sim_C_out$m2_c_5_mean[501:1000],Sim_C_out$ambma_5[501:1000])  
Sim_C_out$Rsq_m3_ambma_5<-cor(Sim_C_out$m3_c_5_mean[501:1000],Sim_C_out$ambma_5[501:1000])  
Sim_C_out$Rsq_m4_ambma_5<-cor(Sim_C_out$m4_c_5_mean[501:1000],Sim_C_out$ambma_5[501:1000])  
Sim_C_out$Rsq_m5_ambma_5<-cor(Sim_C_out$m5_c_5_mean[501:1000],Sim_C_out$ambma_5[501:1000])  
Sim_C_out$Rsq_m6_ambma_5<-cor(Sim_C_out$m6_c_5_mean[501:1000],Sim_C_out$ambma_5[501:1000])  

Sim_C_out$Rsq_m1_derva_5<-cor(Sim_C_out$m1_c_5_mean[1001:1500],Sim_C_out$derva_5[1001:1500])  
Sim_C_out$Rsq_m2_derva_5<-cor(Sim_C_out$m2_c_5_mean[1001:1500],Sim_C_out$derva_5[1001:1500])  
Sim_C_out$Rsq_m3_derva_5<-cor(Sim_C_out$m3_c_5_mean[1001:1500],Sim_C_out$derva_5[1001:1500])  
Sim_C_out$Rsq_m4_derva_5<-cor(Sim_C_out$m4_c_5_mean[1001:1500],Sim_C_out$derva_5[1001:1500])  
Sim_C_out$Rsq_m5_derva_5<-cor(Sim_C_out$m5_c_5_mean[1001:1500],Sim_C_out$derva_5[1001:1500])  
Sim_C_out$Rsq_m6_derva_5<-cor(Sim_C_out$m6_c_5_mean[1001:1500],Sim_C_out$derva_5[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_5<-cor(Sim_C_out$m1_c_5_mean[1501:1530],Sim_C_out$ixosc_5[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_5<-cor(Sim_C_out$m2_c_5_mean[1501:1530],Sim_C_out$ixosc_5[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_5<-cor(Sim_C_out$m3_c_5_mean[1501:1530],Sim_C_out$ixosc_5[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_5<-cor(Sim_C_out$m4_c_5_mean[1501:1530],Sim_C_out$ixosc_5[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_5<-cor(Sim_C_out$m5_c_5_mean[1501:1530],Sim_C_out$ixosc_5[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_5<-cor(Sim_C_out$m6_c_5_mean[1501:1530],Sim_C_out$ixosc_5[1501:1530])  

Sim_C_out$Rsq_m1_ambam_6<-cor(Sim_C_out$m1_c_6_mean[1:500],Sim_C_out$ambam_6[1:500])  
Sim_C_out$Rsq_m2_ambam_6<-cor(Sim_C_out$m2_c_6_mean[1:500],Sim_C_out$ambam_6[1:500])  
Sim_C_out$Rsq_m3_ambam_6<-cor(Sim_C_out$m3_c_6_mean[1:500],Sim_C_out$ambam_6[1:500])  
Sim_C_out$Rsq_m4_ambam_6<-cor(Sim_C_out$m4_c_6_mean[1:500],Sim_C_out$ambam_6[1:500])  
Sim_C_out$Rsq_m5_ambam_6<-cor(Sim_C_out$m5_c_6_mean[1:500],Sim_C_out$ambam_6[1:500])  
Sim_C_out$Rsq_m6_ambam_6<-cor(Sim_C_out$m6_c_6_mean[1:500],Sim_C_out$ambam_6[1:500])  

Sim_C_out$Rsq_m1_ambma_6<-cor(Sim_C_out$m1_c_6_mean[501:1000],Sim_C_out$ambma_6[501:1000])  
Sim_C_out$Rsq_m2_ambma_6<-cor(Sim_C_out$m2_c_6_mean[501:1000],Sim_C_out$ambma_6[501:1000])  
Sim_C_out$Rsq_m3_ambma_6<-cor(Sim_C_out$m3_c_6_mean[501:1000],Sim_C_out$ambma_6[501:1000])  
Sim_C_out$Rsq_m4_ambma_6<-cor(Sim_C_out$m4_c_6_mean[501:1000],Sim_C_out$ambma_6[501:1000])  
Sim_C_out$Rsq_m5_ambma_6<-cor(Sim_C_out$m5_c_6_mean[501:1000],Sim_C_out$ambma_6[501:1000])  
Sim_C_out$Rsq_m6_ambma_6<-cor(Sim_C_out$m6_c_6_mean[501:1000],Sim_C_out$ambma_6[501:1000])  

Sim_C_out$Rsq_m1_derva_6<-cor(Sim_C_out$m1_c_6_mean[1001:1500],Sim_C_out$derva_6[1001:1500])  
Sim_C_out$Rsq_m2_derva_6<-cor(Sim_C_out$m2_c_6_mean[1001:1500],Sim_C_out$derva_6[1001:1500])  
Sim_C_out$Rsq_m3_derva_6<-cor(Sim_C_out$m3_c_6_mean[1001:1500],Sim_C_out$derva_6[1001:1500])  
Sim_C_out$Rsq_m4_derva_6<-cor(Sim_C_out$m4_c_6_mean[1001:1500],Sim_C_out$derva_6[1001:1500])  
Sim_C_out$Rsq_m5_derva_6<-cor(Sim_C_out$m5_c_6_mean[1001:1500],Sim_C_out$derva_6[1001:1500])  
Sim_C_out$Rsq_m6_derva_6<-cor(Sim_C_out$m6_c_6_mean[1001:1500],Sim_C_out$derva_6[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_6<-cor(Sim_C_out$m1_c_6_mean[1501:1530],Sim_C_out$ixosc_6[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_6<-cor(Sim_C_out$m2_c_6_mean[1501:1530],Sim_C_out$ixosc_6[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_6<-cor(Sim_C_out$m3_c_6_mean[1501:1530],Sim_C_out$ixosc_6[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_6<-cor(Sim_C_out$m4_c_6_mean[1501:1530],Sim_C_out$ixosc_6[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_6<-cor(Sim_C_out$m5_c_6_mean[1501:1530],Sim_C_out$ixosc_6[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_6<-cor(Sim_C_out$m6_c_6_mean[1501:1530],Sim_C_out$ixosc_6[1501:1530])  

Sim_C_out$Rsq_m1_ambam_7<-cor(Sim_C_out$m1_c_7_mean[1:500],Sim_C_out$ambam_7[1:500])  
Sim_C_out$Rsq_m2_ambam_7<-cor(Sim_C_out$m2_c_7_mean[1:500],Sim_C_out$ambam_7[1:500])  
Sim_C_out$Rsq_m3_ambam_7<-cor(Sim_C_out$m3_c_7_mean[1:500],Sim_C_out$ambam_7[1:500])  
Sim_C_out$Rsq_m4_ambam_7<-cor(Sim_C_out$m4_c_7_mean[1:500],Sim_C_out$ambam_7[1:500])  
Sim_C_out$Rsq_m5_ambam_7<-cor(Sim_C_out$m5_c_7_mean[1:500],Sim_C_out$ambam_7[1:500])  
Sim_C_out$Rsq_m6_ambam_7<-cor(Sim_C_out$m6_c_7_mean[1:500],Sim_C_out$ambam_7[1:500])  

Sim_C_out$Rsq_m1_ambma_7<-cor(Sim_C_out$m1_c_7_mean[501:1000],Sim_C_out$ambma_7[501:1000])  
Sim_C_out$Rsq_m2_ambma_7<-cor(Sim_C_out$m2_c_7_mean[501:1000],Sim_C_out$ambma_7[501:1000])  
Sim_C_out$Rsq_m3_ambma_7<-cor(Sim_C_out$m3_c_7_mean[501:1000],Sim_C_out$ambma_7[501:1000])  
Sim_C_out$Rsq_m4_ambma_7<-cor(Sim_C_out$m4_c_7_mean[501:1000],Sim_C_out$ambma_7[501:1000])  
Sim_C_out$Rsq_m5_ambma_7<-cor(Sim_C_out$m5_c_7_mean[501:1000],Sim_C_out$ambma_7[501:1000])  
Sim_C_out$Rsq_m6_ambma_7<-cor(Sim_C_out$m6_c_7_mean[501:1000],Sim_C_out$ambma_7[501:1000])  

Sim_C_out$Rsq_m1_derva_7<-cor(Sim_C_out$m1_c_7_mean[1001:1500],Sim_C_out$derva_7[1001:1500])  
Sim_C_out$Rsq_m2_derva_7<-cor(Sim_C_out$m2_c_7_mean[1001:1500],Sim_C_out$derva_7[1001:1500])  
Sim_C_out$Rsq_m3_derva_7<-cor(Sim_C_out$m3_c_7_mean[1001:1500],Sim_C_out$derva_7[1001:1500])  
Sim_C_out$Rsq_m4_derva_7<-cor(Sim_C_out$m4_c_7_mean[1001:1500],Sim_C_out$derva_7[1001:1500])  
Sim_C_out$Rsq_m5_derva_7<-cor(Sim_C_out$m5_c_7_mean[1001:1500],Sim_C_out$derva_7[1001:1500])  
Sim_C_out$Rsq_m6_derva_7<-cor(Sim_C_out$m6_c_7_mean[1001:1500],Sim_C_out$derva_7[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_7<-cor(Sim_C_out$m1_c_7_mean[1501:1530],Sim_C_out$ixosc_7[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_7<-cor(Sim_C_out$m2_c_7_mean[1501:1530],Sim_C_out$ixosc_7[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_7<-cor(Sim_C_out$m3_c_7_mean[1501:1530],Sim_C_out$ixosc_7[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_7<-cor(Sim_C_out$m4_c_7_mean[1501:1530],Sim_C_out$ixosc_7[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_7<-cor(Sim_C_out$m5_c_7_mean[1501:1530],Sim_C_out$ixosc_7[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_7<-cor(Sim_C_out$m6_c_7_mean[1501:1530],Sim_C_out$ixosc_7[1501:1530])

Sim_C_out$Rsq_m1_ambam_8<-cor(Sim_C_out$m1_c_8_mean[1:500],Sim_C_out$ambam_8[1:500])  
Sim_C_out$Rsq_m2_ambam_8<-cor(Sim_C_out$m2_c_8_mean[1:500],Sim_C_out$ambam_8[1:500])  
Sim_C_out$Rsq_m3_ambam_8<-cor(Sim_C_out$m3_c_8_mean[1:500],Sim_C_out$ambam_8[1:500])  
Sim_C_out$Rsq_m4_ambam_8<-cor(Sim_C_out$m4_c_8_mean[1:500],Sim_C_out$ambam_8[1:500])  
Sim_C_out$Rsq_m5_ambam_8<-cor(Sim_C_out$m5_c_8_mean[1:500],Sim_C_out$ambam_8[1:500])  
Sim_C_out$Rsq_m6_ambam_8<-cor(Sim_C_out$m6_c_8_mean[1:500],Sim_C_out$ambam_8[1:500])  

Sim_C_out$Rsq_m1_ambma_8<-cor(Sim_C_out$m1_c_8_mean[501:1000],Sim_C_out$ambma_8[501:1000])  
Sim_C_out$Rsq_m2_ambma_8<-cor(Sim_C_out$m2_c_8_mean[501:1000],Sim_C_out$ambma_8[501:1000])  
Sim_C_out$Rsq_m3_ambma_8<-cor(Sim_C_out$m3_c_8_mean[501:1000],Sim_C_out$ambma_8[501:1000])  
Sim_C_out$Rsq_m4_ambma_8<-cor(Sim_C_out$m4_c_8_mean[501:1000],Sim_C_out$ambma_8[501:1000])  
Sim_C_out$Rsq_m5_ambma_8<-cor(Sim_C_out$m5_c_8_mean[501:1000],Sim_C_out$ambma_8[501:1000])  
Sim_C_out$Rsq_m6_ambma_8<-cor(Sim_C_out$m6_c_8_mean[501:1000],Sim_C_out$ambma_8[501:1000])  

Sim_C_out$Rsq_m1_derva_8<-cor(Sim_C_out$m1_c_8_mean[1001:1500],Sim_C_out$derva_8[1001:1500])  
Sim_C_out$Rsq_m2_derva_8<-cor(Sim_C_out$m2_c_8_mean[1001:1500],Sim_C_out$derva_8[1001:1500])  
Sim_C_out$Rsq_m3_derva_8<-cor(Sim_C_out$m3_c_8_mean[1001:1500],Sim_C_out$derva_8[1001:1500])  
Sim_C_out$Rsq_m4_derva_8<-cor(Sim_C_out$m4_c_8_mean[1001:1500],Sim_C_out$derva_8[1001:1500])  
Sim_C_out$Rsq_m5_derva_8<-cor(Sim_C_out$m5_c_8_mean[1001:1500],Sim_C_out$derva_8[1001:1500])  
Sim_C_out$Rsq_m6_derva_8<-cor(Sim_C_out$m6_c_8_mean[1001:1500],Sim_C_out$derva_8[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_8<-cor(Sim_C_out$m1_c_8_mean[1501:1530],Sim_C_out$ixosc_8[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_8<-cor(Sim_C_out$m2_c_8_mean[1501:1530],Sim_C_out$ixosc_8[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_8<-cor(Sim_C_out$m3_c_8_mean[1501:1530],Sim_C_out$ixosc_8[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_8<-cor(Sim_C_out$m4_c_8_mean[1501:1530],Sim_C_out$ixosc_8[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_8<-cor(Sim_C_out$m5_c_8_mean[1501:1530],Sim_C_out$ixosc_8[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_8<-cor(Sim_C_out$m6_c_8_mean[1501:1530],Sim_C_out$ixosc_8[1501:1530])  

Sim_C_out$Rsq_m1_ambam_9<-cor(Sim_C_out$m1_c_9_mean[1:500],Sim_C_out$ambam_9[1:500])  
Sim_C_out$Rsq_m2_ambam_9<-cor(Sim_C_out$m2_c_9_mean[1:500],Sim_C_out$ambam_9[1:500])  
Sim_C_out$Rsq_m3_ambam_9<-cor(Sim_C_out$m3_c_9_mean[1:500],Sim_C_out$ambam_9[1:500])  
Sim_C_out$Rsq_m4_ambam_9<-cor(Sim_C_out$m4_c_9_mean[1:500],Sim_C_out$ambam_9[1:500])  
Sim_C_out$Rsq_m5_ambam_9<-cor(Sim_C_out$m5_c_9_mean[1:500],Sim_C_out$ambam_9[1:500])  
Sim_C_out$Rsq_m6_ambam_9<-cor(Sim_C_out$m6_c_9_mean[1:500],Sim_C_out$ambam_9[1:500])  

Sim_C_out$Rsq_m1_ambma_9<-cor(Sim_C_out$m1_c_9_mean[501:1000],Sim_C_out$ambma_9[501:1000])  
Sim_C_out$Rsq_m2_ambma_9<-cor(Sim_C_out$m2_c_9_mean[501:1000],Sim_C_out$ambma_9[501:1000])  
Sim_C_out$Rsq_m3_ambma_9<-cor(Sim_C_out$m3_c_9_mean[501:1000],Sim_C_out$ambma_9[501:1000])  
Sim_C_out$Rsq_m4_ambma_9<-cor(Sim_C_out$m4_c_9_mean[501:1000],Sim_C_out$ambma_9[501:1000])  
Sim_C_out$Rsq_m5_ambma_9<-cor(Sim_C_out$m5_c_9_mean[501:1000],Sim_C_out$ambma_9[501:1000])  
Sim_C_out$Rsq_m6_ambma_9<-cor(Sim_C_out$m6_c_9_mean[501:1000],Sim_C_out$ambma_9[501:1000])  

Sim_C_out$Rsq_m1_derva_9<-cor(Sim_C_out$m1_c_9_mean[1001:1500],Sim_C_out$derva_9[1001:1500])  
Sim_C_out$Rsq_m2_derva_9<-cor(Sim_C_out$m2_c_9_mean[1001:1500],Sim_C_out$derva_9[1001:1500])  
Sim_C_out$Rsq_m3_derva_9<-cor(Sim_C_out$m3_c_9_mean[1001:1500],Sim_C_out$derva_9[1001:1500])  
Sim_C_out$Rsq_m4_derva_9<-cor(Sim_C_out$m4_c_9_mean[1001:1500],Sim_C_out$derva_9[1001:1500])  
Sim_C_out$Rsq_m5_derva_9<-cor(Sim_C_out$m5_c_9_mean[1001:1500],Sim_C_out$derva_9[1001:1500])  
Sim_C_out$Rsq_m6_derva_9<-cor(Sim_C_out$m6_c_9_mean[1001:1500],Sim_C_out$derva_9[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_9<-cor(Sim_C_out$m1_c_9_mean[1501:1530],Sim_C_out$ixosc_9[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_9<-cor(Sim_C_out$m2_c_9_mean[1501:1530],Sim_C_out$ixosc_9[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_9<-cor(Sim_C_out$m3_c_9_mean[1501:1530],Sim_C_out$ixosc_9[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_9<-cor(Sim_C_out$m4_c_9_mean[1501:1530],Sim_C_out$ixosc_9[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_9<-cor(Sim_C_out$m5_c_9_mean[1501:1530],Sim_C_out$ixosc_9[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_9<-cor(Sim_C_out$m6_c_9_mean[1501:1530],Sim_C_out$ixosc_9[1501:1530])  

Sim_C_out$Rsq_m1_ambam_10<-cor(Sim_C_out$m1_c_10_mean[1:500],Sim_C_out$ambam_10[1:500])  
Sim_C_out$Rsq_m2_ambam_10<-cor(Sim_C_out$m2_c_10_mean[1:500],Sim_C_out$ambam_10[1:500])  
Sim_C_out$Rsq_m3_ambam_10<-cor(Sim_C_out$m3_c_10_mean[1:500],Sim_C_out$ambam_10[1:500])  
Sim_C_out$Rsq_m4_ambam_10<-cor(Sim_C_out$m4_c_10_mean[1:500],Sim_C_out$ambam_10[1:500])  
Sim_C_out$Rsq_m5_ambam_10<-cor(Sim_C_out$m5_c_10_mean[1:500],Sim_C_out$ambam_10[1:500])  
Sim_C_out$Rsq_m6_ambam_10<-cor(Sim_C_out$m6_c_10_mean[1:500],Sim_C_out$ambam_10[1:500])  

Sim_C_out$Rsq_m1_ambma_10<-cor(Sim_C_out$m1_c_10_mean[501:1000],Sim_C_out$ambma_10[501:1000])  
Sim_C_out$Rsq_m2_ambma_10<-cor(Sim_C_out$m2_c_10_mean[501:1000],Sim_C_out$ambma_10[501:1000])  
Sim_C_out$Rsq_m3_ambma_10<-cor(Sim_C_out$m3_c_10_mean[501:1000],Sim_C_out$ambma_10[501:1000])  
Sim_C_out$Rsq_m4_ambma_10<-cor(Sim_C_out$m4_c_10_mean[501:1000],Sim_C_out$ambma_10[501:1000])  
Sim_C_out$Rsq_m5_ambma_10<-cor(Sim_C_out$m5_c_10_mean[501:1000],Sim_C_out$ambma_10[501:1000])  
Sim_C_out$Rsq_m6_ambma_10<-cor(Sim_C_out$m6_c_10_mean[501:1000],Sim_C_out$ambma_10[501:1000])  

Sim_C_out$Rsq_m1_derva_10<-cor(Sim_C_out$m1_c_10_mean[1001:1500],Sim_C_out$derva_10[1001:1500])  
Sim_C_out$Rsq_m2_derva_10<-cor(Sim_C_out$m2_c_10_mean[1001:1500],Sim_C_out$derva_10[1001:1500])  
Sim_C_out$Rsq_m3_derva_10<-cor(Sim_C_out$m3_c_10_mean[1001:1500],Sim_C_out$derva_10[1001:1500])  
Sim_C_out$Rsq_m4_derva_10<-cor(Sim_C_out$m4_c_10_mean[1001:1500],Sim_C_out$derva_10[1001:1500])  
Sim_C_out$Rsq_m5_derva_10<-cor(Sim_C_out$m5_c_10_mean[1001:1500],Sim_C_out$derva_10[1001:1500])  
Sim_C_out$Rsq_m6_derva_10<-cor(Sim_C_out$m6_c_10_mean[1001:1500],Sim_C_out$derva_10[1001:1500])  

Sim_C_out$Rsq_m1_ixosc_10<-cor(Sim_C_out$m1_c_10_mean[1501:1530],Sim_C_out$ixosc_10[1501:1530])  
Sim_C_out$Rsq_m2_ixosc_10<-cor(Sim_C_out$m2_c_10_mean[1501:1530],Sim_C_out$ixosc_10[1501:1530])  
Sim_C_out$Rsq_m3_ixosc_10<-cor(Sim_C_out$m3_c_10_mean[1501:1530],Sim_C_out$ixosc_10[1501:1530])  
Sim_C_out$Rsq_m4_ixosc_10<-cor(Sim_C_out$m4_c_10_mean[1501:1530],Sim_C_out$ixosc_10[1501:1530])  
Sim_C_out$Rsq_m5_ixosc_10<-cor(Sim_C_out$m5_c_10_mean[1501:1530],Sim_C_out$ixosc_10[1501:1530])  
Sim_C_out$Rsq_m6_ixosc_10<-cor(Sim_C_out$m6_c_10_mean[1501:1530],Sim_C_out$ixosc_10[1501:1530])  







