##calculate average uncertainty over all runs 

#Read in m1-m6 full outputs x 10
m1_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/full_preds/m7_run1_full.csv")
m1_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/full_preds/m7_run2_full.csv")
m1_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/full_preds/m7_run3_full.csv")
m1_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/full_preds/m7_run4_full.csv")
m1_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/full_preds/m7_run5_full.csv")
m1_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/full_preds/m7_run6_full.csv")
m1_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/full_preds/m7_run7_full.csv")
m1_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/full_preds/m7_run8_full.csv")
m1_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/full_preds/m7_run9_full.csv")
m1_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/full_preds/m7_run10_full.csv")

m2_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/full_preds/m8_run1_full.csv")
m2_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/full_preds/m8_run2_full.csv")
m2_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/full_preds/m8_run3_full.csv")
m2_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/full_preds/m8_run4_full.csv")
m2_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/full_preds/m8_run5_full.csv")
m2_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/full_preds/m8_run6_full.csv")
m2_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/full_preds/m8_run7_full.csv")
m2_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/full_preds/m8_run8_full.csv")
m2_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/full_preds/m8_run9_full.csv")
m2_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/full_preds/m8_run10_full.csv")

m3_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/full_preds/m9_run1_full.csv")
m3_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/full_preds/m9_run2_full.csv")
m3_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/full_preds/m9_run3_full.csv")
m3_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/full_preds/m9_run4_full.csv")
m3_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/full_preds/m9_run5_full.csv")
m3_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/full_preds/m9_run6_full.csv")
m3_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/full_preds/m9_run7_full.csv")
m3_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/full_preds/m9_run8_full.csv")
m3_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/full_preds/m9_run9_full.csv")
m3_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/full_preds/m9_run10_full.csv")

m4_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/full_preds/m10_run1_full.csv")
m4_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/full_preds/m10_run2_full.csv")
m4_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/full_preds/m10_run3_full.csv")
m4_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/full_preds/m10_run4_full.csv")
m4_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/full_preds/m10_run5_full.csv")
m4_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/full_preds/m10_run6_full.csv")
m4_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/full_preds/m10_run7_full.csv")
m4_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/full_preds/m10_run8_full.csv")
m4_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/full_preds/m10_run9_full.csv")
m4_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/full_preds/m10_run10_full.csv")

m5_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/full_preds/m11_run1_full.csv")
m5_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/full_preds/m11_run2_full.csv")
m5_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/full_preds/m11_run3_full.csv")
m5_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/full_preds/m11_run4_full.csv")
m5_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/full_preds/m11_run5_full.csv")
m5_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/full_preds/m11_run6_full.csv")
m5_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/full_preds/m11_run7_full.csv")
m5_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/full_preds/m11_run8_full.csv")
m5_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/full_preds/m11_run9_full.csv")
m5_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/full_preds/m11_run10_full.csv")

m6_full_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/full_preds/m12_run1_full.csv")
m6_full_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/full_preds/m12_run2_full.csv")
m6_full_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/full_preds/m12_run3_full.csv")
m6_full_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/full_preds/m12_run4_full.csv")
m6_full_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/full_preds/m12_run5_full.csv")
m6_full_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/full_preds/m12_run6_full.csv")
m6_full_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/full_preds/m12_run7_full.csv")
m6_full_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/full_preds/m12_run8_full.csv")
m6_full_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/full_preds/m12_run9_full.csv")
m6_full_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/full_preds/m12_run10_full.csv")

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

write.csv(uncs,"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Summary/m7_m12_unc_allruns.csv")


