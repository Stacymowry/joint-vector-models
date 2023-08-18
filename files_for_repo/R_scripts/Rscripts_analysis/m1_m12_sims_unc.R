##calculate average uncertainty over all runs 
#Read in m1-m6 full outputs x 10
m1_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m7a_run1_full.csv")
m1_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m7a_run2_full.csv")
m1_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m7a_run3_full.csv")
m1_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m7a_run4_full.csv")
m1_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m7a_run5_full.csv")
m1_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m7a_run6_full.csv")
m1_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m7a_run7_full.csv")
m1_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m7a_run8_full.csv")
m1_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m7a_run9_full.csv")
m1_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m7a_run10_full.csv")

m2_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m8a_run1_full.csv")
m2_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m8a_run2_full.csv")
m2_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m8a_run3_full.csv")
m2_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m8a_run4_full.csv")
m2_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m8a_run5_full.csv")
m2_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m8a_run6_full.csv")
m2_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m8a_run7_full.csv")
m2_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m8a_run8_full.csv")
m2_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m8a_run9_full.csv")
m2_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m8a_run10_full.csv")

m3_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m9a_run1_full.csv")
m3_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m9a_run2_full.csv")
m3_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m9a_run3_full.csv")
m3_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m9a_run4_full.csv")
m3_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m9a_run5_full.csv")
m3_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m9a_run6_full.csv")
m3_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m9a_run7_full.csv")
m3_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m9a_run8_full.csv")
m3_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m9a_run9_full.csv")
m3_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m9a_run10_full.csv")

m4_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m10a_run1_full.csv")
m4_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m10a_run2_full.csv")
m4_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m10a_run3_full.csv")
m4_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m10a_run4_full.csv")
m4_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m10a_run5_full.csv")
m4_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m10a_run6_full.csv")
m4_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m10a_run7_full.csv")
m4_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m10a_run8_full.csv")
m4_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m10a_run9_full.csv")
m4_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m10a_run10_full.csv")

m5_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m11a_run1_full.csv")
m5_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m11a_run2_full.csv")
m5_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m11a_run3_full.csv")
m5_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m11a_run4_full.csv")
m5_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m11a_run5_full.csv")
m5_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m11a_run6_full.csv")
m5_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m11a_run7_full.csv")
m5_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m11a_run8_full.csv")
m5_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m11a_run9_full.csv")
m5_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m11a_run10_full.csv")

m6_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_1/m7_m12/Sim_A/full_preds/m12a_run1_full.csv")
m6_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_2/m7_m12/Sim_A/full_preds/m12a_run2_full.csv")
m6_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_3/m7_m12/Sim_A/full_preds/m12a_run3_full.csv")
m6_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_4/m7_m12/Sim_A/full_preds/m12a_run4_full.csv")
m6_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_5/m7_m12/Sim_A/full_preds/m12a_run5_full.csv")
m6_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_6/m7_m12/Sim_A/full_preds/m12a_run6_full.csv")
m6_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_7/m7_m12/Sim_A/full_preds/m12a_run7_full.csv")
m6_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_8/m7_m12/Sim_A/full_preds/m12a_run8_full.csv")
m6_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_9/m7_m12/Sim_A/full_preds/m12a_run9_full.csv")
m6_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Run_10/m7_m12/Sim_A/full_preds/m12a_run10_full.csv")


##bind together ixoaf and rhisa unc from each mod x sim
uncs<-cbind(
  c(m1_full_1$unc_ixosc_m1,m1_full_2$unc_ixosc_m1,m1_full_3$unc_ixosc_m1,
    m1_full_4$unc_ixosc_m1,m1_full_5$unc_ixosc_m1,m1_full_6$unc_ixosc_m1,
    m1_full_7$unc_ixosc_m1,m1_full_8$unc_ixosc_m1,m1_full_9$unc_ixosc_m1,
    m1_full_10$unc_ixosc_m1),
  
  c(m2_full_1$unc_ixosc_m2,m2_full_2$unc_ixosc_m2,m2_full_3$unc_ixosc_m2,
    m2_full_4$unc_ixosc_m2,m2_full_5$unc_ixosc_m2,m2_full_6$unc_ixosc_m2,
    m2_full_7$unc_ixosc_m2,m2_full_8$unc_ixosc_m2,m2_full_9$unc_ixosc_m2,
    m2_full_10$unc_ixosc_m2),
  
  c(m3_full_1$unc_ixosc_m3,m3_full_2$unc_ixosc_m3,m3_full_3$unc_ixosc_m3,
    m3_full_4$unc_ixosc_m3,m3_full_5$unc_ixosc_m3,m3_full_6$unc_ixosc_m3,
    m3_full_7$unc_ixosc_m3,m3_full_8$unc_ixosc_m3,m3_full_9$unc_ixosc_m3,
    m3_full_10$unc_ixosc_m3),
  
  c(m4_full_1$unc_ixosc_m4,m4_full_2$unc_ixosc_m4,m4_full_3$unc_ixosc_m4,
    m4_full_4$unc_ixosc_m4,m4_full_5$unc_ixosc_m4,m4_full_6$unc_ixosc_m4,
    m4_full_7$unc_ixosc_m4,m4_full_8$unc_ixosc_m4,m4_full_9$unc_ixosc_m4,
    m4_full_10$unc_ixosc_m4),
  
  c(m5_full_1$unc_ixosc_m5,m5_full_2$unc_ixosc_m5,m5_full_3$unc_ixosc_m5,
    m5_full_4$unc_ixosc_m5,m5_full_5$unc_ixosc_m5,m5_full_6$unc_ixosc_m5,
    m5_full_7$unc_ixosc_m5,m5_full_8$unc_ixosc_m5,m5_full_9$unc_ixosc_m5,
    m5_full_10$unc_ixosc_m5),
  
  c(m6_full_1$unc_ixosc_m6,m6_full_2$unc_ixosc_m6,m6_full_3$unc_ixosc_m6,
    m6_full_4$unc_ixosc_m6,m6_full_5$unc_ixosc_m6,m6_full_6$unc_ixosc_m6,
    m6_full_7$unc_ixosc_m6,m6_full_8$unc_ixosc_m6,m6_full_9$unc_ixosc_m6,
    m6_full_10$unc_ixosc_m6)
  
)

colnames(uncs)<-c("unc_ixosc_m7","unc_ixosc_m8","unc_ixosc_m9","unc_ixosc_m10","unc_ixosc_m11","unc_ixosc_m12")

#calc avgs
apply(uncs,2,mean)

write.csv(uncs,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Simulations/Summary/m7_m12_unc_SimA.csv")