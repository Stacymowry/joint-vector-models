##calculate average uncertainty over all runs 

#Read in m1-m6 full outputs x 10
m1_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/full_preds/m1_run1_full.csv")
m1_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/full_preds/m1_run2_full.csv")
m1_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/full_preds/m1_run3_full.csv")
m1_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/full_preds/m1_run4_full.csv")
m1_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/full_preds/m1_run5_full.csv")
m1_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/full_preds/m1_run6_full.csv")
m1_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/full_preds/m1_run7_full.csv")
m1_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/full_preds/m1_run8_full.csv")
m1_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/full_preds/m1_run9_full.csv")
m1_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/full_preds/m1_run10_full.csv")

m2_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/full_preds/m2_run1_full.csv")
m2_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/full_preds/m2_run2_full.csv")
m2_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/full_preds/m2_run3_full.csv")
m2_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/full_preds/m2_run4_full.csv")
m2_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/full_preds/m2_run5_full.csv")
m2_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/full_preds/m2_run6_full.csv")
m2_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/full_preds/m2_run7_full.csv")
m2_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/full_preds/m2_run8_full.csv")
m2_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/full_preds/m2_run9_full.csv")
m2_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/full_preds/m2_run10_full.csv")

m3_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/full_preds/m3_run1_full.csv")
m3_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/full_preds/m3_run2_full.csv")
m3_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/full_preds/m3_run3_full.csv")
m3_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/full_preds/m3_run4_full.csv")
m3_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/full_preds/m3_run5_full.csv")
m3_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/full_preds/m3_run6_full.csv")
m3_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/full_preds/m3_run7_full.csv")
m3_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/full_preds/m3_run8_full.csv")
m3_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/full_preds/m3_run9_full.csv")
m3_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/full_preds/m3_run10_full.csv")

m4_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/full_preds/m4_run1_full.csv")
m4_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/full_preds/m4_run2_full.csv")
m4_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/full_preds/m4_run3_full.csv")
m4_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/full_preds/m4_run4_full.csv")
m4_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/full_preds/m4_run5_full.csv")
m4_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/full_preds/m4_run6_full.csv")
m4_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/full_preds/m4_run7_full.csv")
m4_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/full_preds/m4_run8_full.csv")
m4_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/full_preds/m4_run9_full.csv")
m4_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/full_preds/m4_run10_full.csv")

m5_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/full_preds/m5_run1_full.csv")
m5_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/full_preds/m5_run2_full.csv")
m5_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/full_preds/m5_run3_full.csv")
m5_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/full_preds/m5_run4_full.csv")
m5_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/full_preds/m5_run5_full.csv")
m5_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/full_preds/m5_run6_full.csv")
m5_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/full_preds/m5_run7_full.csv")
m5_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/full_preds/m5_run8_full.csv")
m5_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/full_preds/m5_run9_full.csv")
m5_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/full_preds/m5_run10_full.csv")

m6_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/full_preds/m6_run1_full.csv")
m6_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/full_preds/m6_run2_full.csv")
m6_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/full_preds/m6_run3_full.csv")
m6_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/full_preds/m6_run4_full.csv")
m6_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/full_preds/m6_run5_full.csv")
m6_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/full_preds/m6_run6_full.csv")
m6_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/full_preds/m6_run7_full.csv")
m6_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/full_preds/m6_run8_full.csv")
m6_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/full_preds/m6_run9_full.csv")
m6_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/full_preds/m6_run10_full.csv")

##bind together ixoaf and rhisa unc from each mod x sim
uncs<-cbind(
  c(m1_full_1$unc_ixoaf_m1,m1_full_2$unc_ixoaf_m1,m1_full_3$unc_ixoaf_m1,
    m1_full_4$unc_ixoaf_m1,m1_full_5$unc_ixoaf_m1,m1_full_6$unc_ixoaf_m1,
    m1_full_7$unc_ixoaf_m1,m1_full_8$unc_ixoaf_m1,m1_full_9$unc_ixoaf_m1,
    m1_full_10$unc_ixoaf_m1),
  
  c(m2_full_1$unc_ixoaf_m2,m2_full_2$unc_ixoaf_m2,m2_full_3$unc_ixoaf_m2,
    m2_full_4$unc_ixoaf_m2,m2_full_5$unc_ixoaf_m2,m2_full_6$unc_ixoaf_m2,
    m2_full_7$unc_ixoaf_m2,m2_full_8$unc_ixoaf_m2,m2_full_9$unc_ixoaf_m2,
    m2_full_10$unc_ixoaf_m2),
  
  c(m3_full_1$unc_ixoaf_m3,m3_full_2$unc_ixoaf_m3,m3_full_3$unc_ixoaf_m3,
    m3_full_4$unc_ixoaf_m3,m3_full_5$unc_ixoaf_m3,m3_full_6$unc_ixoaf_m3,
    m3_full_7$unc_ixoaf_m3,m3_full_8$unc_ixoaf_m3,m3_full_9$unc_ixoaf_m3,
    m3_full_10$unc_ixoaf_m3),
  
  c(m4_full_1$unc_ixoaf_m4,m4_full_2$unc_ixoaf_m4,m4_full_3$unc_ixoaf_m4,
    m4_full_4$unc_ixoaf_m4,m4_full_5$unc_ixoaf_m4,m4_full_6$unc_ixoaf_m4,
    m4_full_7$unc_ixoaf_m4,m4_full_8$unc_ixoaf_m4,m4_full_9$unc_ixoaf_m4,
    m4_full_10$unc_ixoaf_m4),
  
  c(m5_full_1$unc_ixoaf_m5,m5_full_2$unc_ixoaf_m5,m5_full_3$unc_ixoaf_m5,
    m5_full_4$unc_ixoaf_m5,m5_full_5$unc_ixoaf_m5,m5_full_6$unc_ixoaf_m5,
    m5_full_7$unc_ixoaf_m5,m5_full_8$unc_ixoaf_m5,m5_full_9$unc_ixoaf_m5,
    m5_full_10$unc_ixoaf_m5),
  
  c(m6_full_1$unc_ixoaf_m6,m6_full_2$unc_ixoaf_m6,m6_full_3$unc_ixoaf_m6,
    m6_full_4$unc_ixoaf_m6,m6_full_5$unc_ixoaf_m6,m6_full_6$unc_ixoaf_m6,
    m6_full_7$unc_ixoaf_m6,m6_full_8$unc_ixoaf_m6,m6_full_9$unc_ixoaf_m6,
    m6_full_10$unc_ixoaf_m6),
  
  c(m1_full_1$unc_rhisa_m1,m1_full_2$unc_rhisa_m1,m1_full_3$unc_rhisa_m1,
    m1_full_4$unc_rhisa_m1,m1_full_5$unc_rhisa_m1,m1_full_6$unc_rhisa_m1,
    m1_full_7$unc_rhisa_m1,m1_full_8$unc_rhisa_m1,m1_full_9$unc_rhisa_m1,
    m1_full_10$unc_rhisa_m1),
  
  c(m2_full_1$unc_rhisa_m2,m2_full_2$unc_rhisa_m2,m2_full_3$unc_rhisa_m2,
    m2_full_4$unc_rhisa_m2,m2_full_5$unc_rhisa_m2,m2_full_6$unc_rhisa_m2,
    m2_full_7$unc_rhisa_m2,m2_full_8$unc_rhisa_m2,m2_full_9$unc_rhisa_m2,
    m2_full_10$unc_rhisa_m2),
  
  c(m3_full_1$unc_rhisa_m3,m3_full_2$unc_rhisa_m3,m3_full_3$unc_rhisa_m3,
    m3_full_4$unc_rhisa_m3,m3_full_5$unc_rhisa_m3,m3_full_6$unc_rhisa_m3,
    m3_full_7$unc_rhisa_m3,m3_full_8$unc_rhisa_m3,m3_full_9$unc_rhisa_m3,
    m3_full_10$unc_rhisa_m3),
  
  c(m4_full_1$unc_rhisa_m4,m4_full_2$unc_rhisa_m4,m4_full_3$unc_rhisa_m4,
    m4_full_4$unc_rhisa_m4,m4_full_5$unc_rhisa_m4,m4_full_6$unc_rhisa_m4,
    m4_full_7$unc_rhisa_m4,m4_full_8$unc_rhisa_m4,m4_full_9$unc_rhisa_m4,
    m4_full_10$unc_rhisa_m4),
  
  c(m5_full_1$unc_rhisa_m5,m5_full_2$unc_rhisa_m5,m5_full_3$unc_rhisa_m5,
    m5_full_4$unc_rhisa_m5,m5_full_5$unc_rhisa_m5,m5_full_6$unc_rhisa_m5,
    m5_full_7$unc_rhisa_m5,m5_full_8$unc_rhisa_m5,m5_full_9$unc_rhisa_m5,
    m5_full_10$unc_rhisa_m5),
  
  c(m6_full_1$unc_rhisa_m6,m6_full_2$unc_rhisa_m6,m6_full_3$unc_rhisa_m6,
    m6_full_4$unc_rhisa_m6,m6_full_5$unc_rhisa_m6,m6_full_6$unc_rhisa_m6,
    m6_full_7$unc_rhisa_m6,m6_full_8$unc_rhisa_m6,m6_full_9$unc_rhisa_m6,
    m6_full_10$unc_rhisa_m6)
  
)

colnames(uncs)<-c("unc_ixoaf_m1","unc_ixoaf_m2","unc_ixoaf_m3","unc_ixoaf_m4","unc_ixoaf_m5","unc_ixoaf_m6",
                  "unc_rhisa_m1", "unc_rhisa_m2", "unc_rhisa_m3", "unc_rhisa_m4", "unc_rhisa_m5", "unc_rhisa_m6")
#calc avgs
apply(uncs,2,mean)

write.csv(uncs,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Summary/m1_m6_unc_allruns.csv")


