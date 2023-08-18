
##calculate test accuracy for each model and run 

m1_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/test_preds/m1_run1_test.csv")
m2_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/test_preds/m2_run1_test.csv")
m3_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/test_preds/m3_run1_test.csv")
m4_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/test_preds/m4_run1_test.csv")
m5_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/test_preds/m5_run1_test.csv")
m6_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m1_m6/test_preds/m6_run1_test.csv")

m1_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/test_preds/m1_run2_test.csv")
m2_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/test_preds/m2_run2_test.csv")
m3_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/test_preds/m3_run2_test.csv")
m4_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/test_preds/m4_run2_test.csv")
m5_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/test_preds/m5_run2_test.csv")
m6_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m1_m6/test_preds/m6_run2_test.csv")

m1_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/test_preds/m1_run3_test.csv")
m2_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/test_preds/m2_run3_test.csv")
m3_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/test_preds/m3_run3_test.csv")
m4_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/test_preds/m4_run3_test.csv")
m5_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/test_preds/m5_run3_test.csv")
m6_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m1_m6/test_preds/m6_run3_test.csv")

m1_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/test_preds/m1_run4_test.csv")
m2_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/test_preds/m2_run4_test.csv")
m3_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/test_preds/m3_run4_test.csv")
m4_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/test_preds/m4_run4_test.csv")
m5_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/test_preds/m5_run4_test.csv")
m6_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m1_m6/test_preds/m6_run4_test.csv")

m1_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/test_preds/m1_run5_test.csv")
m2_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/test_preds/m2_run5_test.csv")
m3_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/test_preds/m3_run5_test.csv")
m4_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/test_preds/m4_run5_test.csv")
m5_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/test_preds/m5_run5_test.csv")
m6_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m1_m6/test_preds/m6_run5_test.csv")

m1_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/test_preds/m1_run6_test.csv")
m2_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/test_preds/m2_run6_test.csv")
m3_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/test_preds/m3_run6_test.csv")
m4_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/test_preds/m4_run6_test.csv")
m5_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/test_preds/m5_run6_test.csv")
m6_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m1_m6/test_preds/m6_run6_test.csv")

m1_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/test_preds/m1_run7_test.csv")
m2_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/test_preds/m2_run7_test.csv")
m3_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/test_preds/m3_run7_test.csv")
m4_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/test_preds/m4_run7_test.csv")
m5_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/test_preds/m5_run7_test.csv")
m6_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m1_m6/test_preds/m6_run7_test.csv")

m1_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/test_preds/m1_run8_test.csv")
m2_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/test_preds/m2_run8_test.csv")
m3_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/test_preds/m3_run8_test.csv")
m4_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/test_preds/m4_run8_test.csv")
m5_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/test_preds/m5_run8_test.csv")
m6_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m1_m6/test_preds/m6_run8_test.csv")

m1_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/test_preds/m1_run9_test.csv")
m2_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/test_preds/m2_run9_test.csv")
m3_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/test_preds/m3_run9_test.csv")
m4_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/test_preds/m4_run9_test.csv")
m5_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/test_preds/m5_run9_test.csv")
m6_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m1_m6/test_preds/m6_run9_test.csv")

m1_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/test_preds/m1_run10_test.csv")
m2_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/test_preds/m2_run10_test.csv")
m3_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/test_preds/m3_run10_test.csv")
m4_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/test_preds/m4_run10_test.csv")
m5_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/test_preds/m5_run10_test.csv")
m6_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m1_m6/test_preds/m6_run10_test.csv")


m1_10_ambam<-subset(m1_10,m1_10$gen_spe == "Amblyomma americanum")
m1_10_ambma<-subset(m1_10,m1_10$gen_spe == "Amblyomma maculatum")
m1_10_derva<-subset(m1_10,m1_10$gen_spe == "Dermacentor variabilis")
m1_10_ixoaf<-subset(m1_10,m1_10$gen_spe == "Ixodes affinis")
m1_10_ixosc<-subset(m1_10,m1_10$gen_spe == "Ixodes scapularis")
m1_10_rhisa<-subset(m1_10,m1_10$gen_spe == "Rhipicephalus sanguineus")

m2_10_ambam<-subset(m2_10,m2_10$gen_spe == "Amblyomma americanum")
m2_10_ambma<-subset(m2_10,m2_10$gen_spe == "Amblyomma maculatum")
m2_10_derva<-subset(m2_10,m2_10$gen_spe == "Dermacentor variabilis")
m2_10_ixoaf<-subset(m2_10,m2_10$gen_spe == "Ixodes affinis")
m2_10_ixosc<-subset(m2_10,m2_10$gen_spe == "Ixodes scapularis")
m2_10_rhisa<-subset(m2_10,m2_10$gen_spe == "Rhipicephalus sanguineus")


m3_10_ambam<-subset(m3_10,m3_10$gen_spe == "Amblyomma americanum")
m3_10_ambma<-subset(m3_10,m3_10$gen_spe == "Amblyomma maculatum")
m3_10_derva<-subset(m3_10,m3_10$gen_spe == "Dermacentor variabilis")
m3_10_ixoaf<-subset(m3_10,m3_10$gen_spe == "Ixodes affinis")
m3_10_ixosc<-subset(m3_10,m3_10$gen_spe == "Ixodes scapularis")
m3_10_rhisa<-subset(m3_10,m3_10$gen_spe == "Rhipicephalus sanguineus")

m4_10_ambam<-subset(m4_10,m4_10$gen_spe == "Amblyomma americanum")
m4_10_ambma<-subset(m4_10,m4_10$gen_spe == "Amblyomma maculatum")
m4_10_derva<-subset(m4_10,m4_10$gen_spe == "Dermacentor variabilis")
m4_10_ixoaf<-subset(m4_10,m4_10$gen_spe == "Ixodes affinis")
m4_10_ixosc<-subset(m4_10,m4_10$gen_spe == "Ixodes scapularis")
m4_10_rhisa<-subset(m4_10,m4_10$gen_spe == "Rhipicephalus sanguineus")

m5_10_ambam<-subset(m5_10,m5_10$gen_spe == "Amblyomma americanum")
m5_10_ambma<-subset(m5_10,m5_10$gen_spe == "Amblyomma maculatum")
m5_10_derva<-subset(m5_10,m5_10$gen_spe == "Dermacentor variabilis")
m5_10_ixoaf<-subset(m5_10,m5_10$gen_spe == "Ixodes affinis")
m5_10_ixosc<-subset(m5_10,m5_10$gen_spe == "Ixodes scapularis")
m5_10_rhisa<-subset(m5_10,m5_10$gen_spe == "Rhipicephalus sanguineus")

m6_10_ambam<-subset(m6_10,m6_10$gen_spe == "Amblyomma americanum")
m6_10_ambma<-subset(m6_10,m6_10$gen_spe == "Amblyomma maculatum")
m6_10_derva<-subset(m6_10,m6_10$gen_spe == "Dermacentor variabilis")
m6_10_ixoaf<-subset(m6_10,m6_10$gen_spe == "Ixodes affinis")
m6_10_ixosc<-subset(m6_10,m6_10$gen_spe == "Ixodes scapularis")
m6_10_rhisa<-subset(m6_10,m6_10$gen_spe == "Rhipicephalus sanguineus")



confusionMatrix(as.factor(round(m6_10_rhisa$pred_rhisa_m6,0)), as.factor(m6_10_rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

