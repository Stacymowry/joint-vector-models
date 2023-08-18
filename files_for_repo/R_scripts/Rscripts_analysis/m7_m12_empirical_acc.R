
##calculate test accuracy for each model and run 

m7_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/test_preds/m7_run1_test.csv")
m8_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/test_preds/m8_run1_test.csv")
m9_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/test_preds/m9_run1_test.csv")
m10_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/test_preds/m10_run1_test.csv")
m11_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/test_preds/m11_run1_test.csv")
m12_1<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_1/m7_m12/test_preds/m12_run1_test.csv")

m7_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/test_preds/m7_run2_test.csv")
m8_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/test_preds/m8_run2_test.csv")
m9_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/test_preds/m9_run2_test.csv")
m10_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/test_preds/m10_run2_test.csv")
m11_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/test_preds/m11_run2_test.csv")
m12_2<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_2/m7_m12/test_preds/m12_run2_test.csv")

m7_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/test_preds/m7_run3_test.csv")
m8_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/test_preds/m8_run3_test.csv")
m9_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/test_preds/m9_run3_test.csv")
m10_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/test_preds/m10_run3_test.csv")
m11_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/test_preds/m11_run3_test.csv")
m12_3<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_3/m7_m12/test_preds/m12_run3_test.csv")

m7_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/test_preds/m7_run4_test.csv")
m8_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/test_preds/m8_run4_test.csv")
m9_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/test_preds/m9_run4_test.csv")
m10_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/test_preds/m10_run4_test.csv")
m11_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/test_preds/m11_run4_test.csv")
m12_4<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_4/m7_m12/test_preds/m12_run4_test.csv")

m7_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/test_preds/m7_run5_test.csv")
m8_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/test_preds/m8_run5_test.csv")
m9_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/test_preds/m9_run5_test.csv")
m10_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/test_preds/m10_run5_test.csv")
m11_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/test_preds/m11_run5_test.csv")
m12_5<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_5/m7_m12/test_preds/m12_run5_test.csv")

m7_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/test_preds/m7_run6_test.csv")
m8_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/test_preds/m8_run6_test.csv")
m9_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/test_preds/m9_run6_test.csv")
m10_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/test_preds/m10_run6_test.csv")
m11_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/test_preds/m11_run6_test.csv")
m12_6<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_6/m7_m12/test_preds/m12_run6_test.csv")

m7_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/test_preds/m7_run7_test.csv")
m8_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/test_preds/m8_run7_test.csv")
m9_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/test_preds/m9_run7_test.csv")
m10_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/test_preds/m10_run7_test.csv")
m11_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/test_preds/m11_run7_test.csv")
m12_7<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_7/m7_m12/test_preds/m12_run7_test.csv")

m7_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/test_preds/m7_run8_test.csv")
m8_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/test_preds/m8_run8_test.csv")
m9_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/test_preds/m9_run8_test.csv")
m10_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/test_preds/m10_run8_test.csv")
m11_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/test_preds/m11_run8_test.csv")
m12_8<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_8/m7_m12/test_preds/m12_run8_test.csv")

m7_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/test_preds/m7_run9_test.csv")
m8_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/test_preds/m8_run9_test.csv")
m9_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/test_preds/m9_run9_test.csv")
m10_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/test_preds/m10_run9_test.csv")
m11_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/test_preds/m11_run9_test.csv")
m12_9<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_9/m7_m12/test_preds/m12_run9_test.csv")

m7_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/test_preds/m7_run10_test.csv")
m8_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/test_preds/m8_run10_test.csv")
m9_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/test_preds/m9_run10_test.csv")
m10_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/test_preds/m10_run10_test.csv")
m11_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/test_preds/m11_run10_test.csv")
m12_10<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/model_outputs/new_priors/Empirical/Run_10/m7_m12/test_preds/m12_run10_test.csv")


m7_10_ambam<-subset(m7_10,m7_10$gen_spe == "Amblyomma americanum")
m7_10_ambma<-subset(m7_10,m7_10$gen_spe == "Amblyomma maculatum")
m7_10_derva<-subset(m7_10,m7_10$gen_spe == "Dermacentor variabilis")
m7_10_ixoaf<-subset(m7_10,m7_10$gen_spe == "Ixodes affinis")
m7_10_ixosc<-subset(m7_10,m7_10$gen_spe == "Ixodes scapularis")
m7_10_rhisa<-subset(m7_10,m7_10$gen_spe == "Rhipicephalus sanguineus")

m8_10_ambam<-subset(m8_10,m8_10$gen_spe == "Amblyomma americanum")
m8_10_ambma<-subset(m8_10,m8_10$gen_spe == "Amblyomma maculatum")
m8_10_derva<-subset(m8_10,m8_10$gen_spe == "Dermacentor variabilis")
m8_10_ixoaf<-subset(m8_10,m8_10$gen_spe == "Ixodes affinis")
m8_10_ixosc<-subset(m8_10,m8_10$gen_spe == "Ixodes scapularis")
m8_10_rhisa<-subset(m8_10,m8_10$gen_spe == "Rhipicephalus sanguineus")


m9_10_ambam<-subset(m8_10,m8_10$gen_spe == "Amblyomma americanum")
m9_10_ambma<-subset(m8_10,m8_10$gen_spe == "Amblyomma maculatum")
m9_10_derva<-subset(m8_10,m8_10$gen_spe == "Dermacentor variabilis")
m9_10_ixoaf<-subset(m8_10,m8_10$gen_spe == "Ixodes affinis")
m9_10_ixosc<-subset(m8_10,m8_10$gen_spe == "Ixodes scapularis")
m9_10_rhisa<-subset(m8_10,m8_10$gen_spe == "Rhipicephalus sanguineus")

m10_10_ambam<-subset(m9_10,m9_10$gen_spe == "Amblyomma americanum")
m10_10_ambma<-subset(m9_10,m9_10$gen_spe == "Amblyomma maculatum")
m10_10_derva<-subset(m9_10,m9_10$gen_spe == "Dermacentor variabilis")
m10_10_ixoaf<-subset(m9_10,m9_10$gen_spe == "Ixodes affinis")
m10_10_ixosc<-subset(m9_10,m9_10$gen_spe == "Ixodes scapularis")
m10_10_rhisa<-subset(m9_10,m9_10$gen_spe == "Rhipicephalus sanguineus")

m11_10_ambam<-subset(m10_10,m10_10$gen_spe == "Amblyomma americanum")
m11_10_ambma<-subset(m10_10,m10_10$gen_spe == "Amblyomma maculatum")
m11_10_derva<-subset(m10_10,m10_10$gen_spe == "Dermacentor variabilis")
m11_10_ixoaf<-subset(m10_10,m10_10$gen_spe == "Ixodes affinis")
m11_10_ixosc<-subset(m10_10,m10_10$gen_spe == "Ixodes scapularis")
m11_10_rhisa<-subset(m10_10,m10_10$gen_spe == "Rhipicephalus sanguineus")

m12_10_ambam<-subset(m11_10,m11_10$gen_spe == "Amblyomma americanum")
m12_10_ambma<-subset(m11_10,m11_10$gen_spe == "Amblyomma maculatum")
m12_10_derva<-subset(m11_10,m11_10$gen_spe == "Dermacentor variabilis")
m12_10_ixoaf<-subset(m11_10,m11_10$gen_spe == "Ixodes affinis")
m12_10_ixosc<-subset(m11_10,m11_10$gen_spe == "Ixodes scapularis")
m12_10_rhisa<-subset(m11_10,m11_10$gen_spe == "Rhipicephalus sanguineus")



confusionMatrix(as.factor(round(m11_10_rhisa$pred_rhisa_m11,0)), as.factor(m11_10_rhisa$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

