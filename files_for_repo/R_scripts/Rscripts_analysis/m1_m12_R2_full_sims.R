##load libraries 
library(raster)
library(caret)


##calculate r^2 for each 
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


write.csv(r2_full,"/Users/stacymowry/Desktop/full_r2_m1_m6.csv")





