##m1-m6 artificial empirical accuracy

library(caret)


##calculate test accuracy for each model and run 

m1_1<-read.csv("m1_test_preds_artificial.csv")
m2_1<-read.csv("m2_test_preds_artificial.csv")
m3_1<-read.csv("m3_test_preds_artificial.csv")
m4_1<-read.csv("m4_test_preds_artificial.csv")
m5_1<-read.csv("m5_test_preds_artificial.csv")
m6_1<-read.csv("m6_test_preds_artificial.csv")

m1_2<-read.csv("m1_test_preds_artificial.csv")
m2_2<-read.csv("m2_test_preds_artificial.csv")
m3_2<-read.csv("m3_test_preds_artificial.csv")
m4_2<-read.csv("m4_test_preds_artificial.csv")
m5_2<-read.csv("m5_test_preds_artificial.csv")
m6_2<-read.csv("m6_test_preds_artificial.csv")

m1_3<-read.csv("m1_test_preds_artificial.csv")
m2_3<-read.csv("m2_test_preds_artificial.csv")
m3_3<-read.csv("m3_test_preds_artificial.csv")
m4_3<-read.csv("m4_test_preds_artificial.csv")
m5_3<-read.csv("m5_test_preds_artificial.csv")
m6_3<-read.csv("m6_test_preds_artificial.csv")

m1_4<-read.csv("m1_test_preds_artificial.csv")
m2_4<-read.csv("m2_test_preds_artificial.csv")
m3_4<-read.csv("m3_test_preds_artificial.csv")
m4_4<-read.csv("m4_test_preds_artificial.csv")
m5_4<-read.csv("m5_test_preds_artificial.csv")
m6_4<-read.csv("m6_test_preds_artificial.csv")

m1_5<-read.csv("m1_test_preds_artificial.csv")
m2_5<-read.csv("m2_test_preds_artificial.csv")
m3_5<-read.csv("m3_test_preds_artificial.csv")
m4_5<-read.csv("m4_test_preds_artificial.csv")
m5_5<-read.csv("m5_test_preds_artificial.csv")
m6_5<-read.csv("m6_test_preds_artificial.csv")

m1_6<-read.csv("m1_test_preds_artificial.csv")
m2_6<-read.csv("m2_test_preds_artificial.csv")
m3_6<-read.csv("m3_test_preds_artificial.csv")
m4_6<-read.csv("m4_test_preds_artificial.csv")
m5_6<-read.csv("m5_test_preds_artificial.csv")
m6_6<-read.csv("m6_test_preds_artificial.csv")


m1_7<-read.csv("m1_test_preds_artificial.csv")
m2_7<-read.csv("m2_test_preds_artificial.csv")
m3_7<-read.csv("m3_test_preds_artificial.csv")
m4_7<-read.csv("m4_test_preds_artificial.csv")
m5_7<-read.csv("m5_test_preds_artificial.csv")
m6_7<-read.csv("m6_test_preds_artificial.csv")

m1_8<-read.csv("m1_test_preds_artificial.csv")
m2_8<-read.csv("m2_test_preds_artificial.csv")
m3_8<-read.csv("m3_test_preds_artificial.csv")
m4_8<-read.csv("m4_test_preds_artificial.csv")
m5_8<-read.csv("m5_test_preds_artificial.csv")
m6_8<-read.csv("m6_test_preds_artificial.csv")

m1_9<-read.csv("m1_test_preds_artificial.csv")
m2_9<-read.csv("m2_test_preds_artificial.csv")
m3_9<-read.csv("m3_test_preds_artificial.csv")
m4_9<-read.csv("m4_test_preds_artificial.csv")
m5_9<-read.csv("m5_test_preds_artificial.csv")
m6_9<-read.csv("m6_test_preds_artificial.csv")

m1_10<-read.csv("m1_test_preds_artificial.csv")
m2_10<-read.csv("m2_test_preds_artificial.csv")
m3_10<-read.csv("m3_test_preds_artificial.csv")
m4_10<-read.csv("m4_test_preds_artificial.csv")
m5_10<-read.csv("m5_test_preds_artificial.csv")
m6_10<-read.csv("m6_test_preds_artificial.csv")


##create subsets of SOI for each test-train split
m1_1_ambma<-subset(m1_1,m1_1$gen_spe == "Amblyomma maculatum")
m2_1_ambma<-subset(m2_1,m2_1$gen_spe == "Amblyomma maculatum")
m3_1_ambma<-subset(m3_1,m3_1$gen_spe == "Amblyomma maculatum")
m4_1_ambma<-subset(m4_1,m4_1$gen_spe == "Amblyomma maculatum")
m5_1_ambma<-subset(m5_1,m5_1$gen_spe == "Amblyomma maculatum")
m6_1_ambma<-subset(m6_1,m6_1$gen_spe == "Amblyomma maculatum")

m1_2_ambma<-subset(m1_2,m1_2$gen_spe == "Amblyomma maculatum")
m2_2_ambma<-subset(m2_2,m2_2$gen_spe == "Amblyomma maculatum")
m3_2_ambma<-subset(m3_2,m3_2$gen_spe == "Amblyomma maculatum")
m4_2_ambma<-subset(m4_2,m4_2$gen_spe == "Amblyomma maculatum")
m5_2_ambma<-subset(m5_2,m5_2$gen_spe == "Amblyomma maculatum")
m6_2_ambma<-subset(m6_2,m6_2$gen_spe == "Amblyomma maculatum")

m1_3_ambma<-subset(m1_3,m1_3$gen_spe == "Amblyomma maculatum")
m2_3_ambma<-subset(m2_3,m2_3$gen_spe == "Amblyomma maculatum")
m3_3_ambma<-subset(m3_3,m3_3$gen_spe == "Amblyomma maculatum")
m4_3_ambma<-subset(m4_3,m4_3$gen_spe == "Amblyomma maculatum")
m5_3_ambma<-subset(m5_3,m5_3$gen_spe == "Amblyomma maculatum")
m6_3_ambma<-subset(m6_3,m6_3$gen_spe == "Amblyomma maculatum")

m1_4_ambma<-subset(m1_4,m1_4$gen_spe == "Amblyomma maculatum")
m2_4_ambma<-subset(m2_4,m2_4$gen_spe == "Amblyomma maculatum")
m3_4_ambma<-subset(m3_4,m3_4$gen_spe == "Amblyomma maculatum")
m4_4_ambma<-subset(m4_4,m4_4$gen_spe == "Amblyomma maculatum")
m5_4_ambma<-subset(m5_4,m5_4$gen_spe == "Amblyomma maculatum")
m6_4_ambma<-subset(m6_4,m6_4$gen_spe == "Amblyomma maculatum")

m1_5_ambma<-subset(m1_5,m1_5$gen_spe == "Amblyomma maculatum")
m2_5_ambma<-subset(m2_5,m2_5$gen_spe == "Amblyomma maculatum")
m3_5_ambma<-subset(m3_5,m3_5$gen_spe == "Amblyomma maculatum")
m4_5_ambma<-subset(m4_5,m4_5$gen_spe == "Amblyomma maculatum")
m5_5_ambma<-subset(m5_5,m5_5$gen_spe == "Amblyomma maculatum")
m6_5_ambma<-subset(m6_5,m6_5$gen_spe == "Amblyomma maculatum")

m1_6_ambma<-subset(m1_6,m1_6$gen_spe == "Amblyomma maculatum")
m2_6_ambma<-subset(m2_6,m2_6$gen_spe == "Amblyomma maculatum")
m3_6_ambma<-subset(m3_6,m3_6$gen_spe == "Amblyomma maculatum")
m4_6_ambma<-subset(m4_6,m4_6$gen_spe == "Amblyomma maculatum")
m5_6_ambma<-subset(m5_6,m5_6$gen_spe == "Amblyomma maculatum")
m6_6_ambma<-subset(m6_6,m6_6$gen_spe == "Amblyomma maculatum")

m1_7_ambma<-subset(m1_7,m1_7$gen_spe == "Amblyomma maculatum")
m2_7_ambma<-subset(m2_7,m2_7$gen_spe == "Amblyomma maculatum")
m3_7_ambma<-subset(m3_7,m3_7$gen_spe == "Amblyomma maculatum")
m4_7_ambma<-subset(m4_7,m4_7$gen_spe == "Amblyomma maculatum")
m5_7_ambma<-subset(m5_7,m5_7$gen_spe == "Amblyomma maculatum")
m6_7_ambma<-subset(m6_7,m6_7$gen_spe == "Amblyomma maculatum")

m1_8_ambma<-subset(m1_8,m1_8$gen_spe == "Amblyomma maculatum")
m2_8_ambma<-subset(m2_8,m2_8$gen_spe == "Amblyomma maculatum")
m3_8_ambma<-subset(m3_8,m3_8$gen_spe == "Amblyomma maculatum")
m4_8_ambma<-subset(m4_8,m4_8$gen_spe == "Amblyomma maculatum")
m5_8_ambma<-subset(m5_8,m5_8$gen_spe == "Amblyomma maculatum")
m6_8_ambma<-subset(m6_8,m6_8$gen_spe == "Amblyomma maculatum")

m1_9_ambma<-subset(m1_9,m1_9$gen_spe == "Amblyomma maculatum")
m2_9_ambma<-subset(m2_9,m2_9$gen_spe == "Amblyomma maculatum")
m3_9_ambma<-subset(m3_9,m3_9$gen_spe == "Amblyomma maculatum")
m4_9_ambma<-subset(m4_9,m4_9$gen_spe == "Amblyomma maculatum")
m5_9_ambma<-subset(m5_9,m5_9$gen_spe == "Amblyomma maculatum")
m6_9_ambma<-subset(m6_9,m6_9$gen_spe == "Amblyomma maculatum")

m1_10_ambma<-subset(m1_10,m1_10$gen_spe == "Amblyomma maculatum")
m2_10_ambma<-subset(m2_10,m2_10$gen_spe == "Amblyomma maculatum")
m3_10_ambma<-subset(m3_10,m3_10$gen_spe == "Amblyomma maculatum")
m4_10_ambma<-subset(m4_10,m4_10$gen_spe == "Amblyomma maculatum")
m5_10_ambma<-subset(m5_10,m5_10$gen_spe == "Amblyomma maculatum")
m6_10_ambma<-subset(m6_10,m6_10$gen_spe == "Amblyomma maculatum")


##check train data size
train<-read.csv("train_10.csv")
train<-subset(train,train$gen_spe == "Amblyomma maculatum")
nrow(train)

##calculate accuracy m1 ambma
acc_ambma_m1<-vector(length=10)

acc_ambma_m1[1]<-confusionMatrix(as.factor(round(m1_1_ambma$pred_ambma_m1,0)), as.factor(m1_1_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[2]<-confusionMatrix(as.factor(round(m1_2_ambma$pred_ambma_m1,0)), as.factor(m1_2_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[3]<-confusionMatrix(as.factor(round(m1_3_ambma$pred_ambma_m1,0)), as.factor(m1_3_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[4]<-confusionMatrix(as.factor(round(m1_4_ambma$pred_ambma_m1,0)), as.factor(m1_4_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[5]<-confusionMatrix(as.factor(round(m1_5_ambma$pred_ambma_m1,0)), as.factor(m1_5_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[6]<-confusionMatrix(as.factor(round(m1_6_ambma$pred_ambma_m1,0)), as.factor(m1_6_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[7]<-confusionMatrix(as.factor(round(m1_7_ambma$pred_ambma_m1,0)), as.factor(m1_7_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[8]<-confusionMatrix(as.factor(round(m1_8_ambma$pred_ambma_m1,0)), as.factor(m1_8_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[9]<-confusionMatrix(as.factor(round(m1_9_ambma$pred_ambma_m1,0)), as.factor(m1_9_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m1[10]<-confusionMatrix(as.factor(round(m1_10_ambma$pred_ambma_m1,0)), as.factor(m1_10_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

mean(acc_ambma_m1)
var(acc_ambma_m1)
##calculate accuracy m2 ambma
acc_ambma_m2<-vector(length=10)

acc_ambma_m2[1]<-confusionMatrix(as.factor(round(m2_1_ambma$pred_ambma_m2,0)), as.factor(m2_1_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[2]<-confusionMatrix(as.factor(round(m2_2_ambma$pred_ambma_m2,0)), as.factor(m2_2_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[3]<-confusionMatrix(as.factor(round(m2_3_ambma$pred_ambma_m2,0)), as.factor(m2_3_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[4]<-confusionMatrix(as.factor(round(m2_4_ambma$pred_ambma_m2,0)), as.factor(m2_4_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[5]<-confusionMatrix(as.factor(round(m2_5_ambma$pred_ambma_m2,0)), as.factor(m2_5_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[6]<-confusionMatrix(as.factor(round(m2_6_ambma$pred_ambma_m2,0)), as.factor(m2_6_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[7]<-confusionMatrix(as.factor(round(m2_7_ambma$pred_ambma_m2,0)), as.factor(m2_7_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[8]<-confusionMatrix(as.factor(round(m2_8_ambma$pred_ambma_m2,0)), as.factor(m2_8_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[9]<-confusionMatrix(as.factor(round(m2_9_ambma$pred_ambma_m2,0)), as.factor(m2_9_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m2[10]<-confusionMatrix(as.factor(round(m2_10_ambma$pred_ambma_m2,0)), as.factor(m2_10_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

mean(acc_ambma_m2)
var(acc_ambma_m2)

##calculate accuracy m3 ambma
acc_ambma_m3<-vector(length=10)

acc_ambma_m3[1]<-confusionMatrix(as.factor(round(m3_1_ambma$pred_ambma_m3,0)), as.factor(m3_1_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[2]<-confusionMatrix(as.factor(round(m3_2_ambma$pred_ambma_m3,0)), as.factor(m3_2_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[3]<-confusionMatrix(as.factor(round(m3_3_ambma$pred_ambma_m3,0)), as.factor(m3_3_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[4]<-confusionMatrix(as.factor(round(m3_4_ambma$pred_ambma_m3,0)), as.factor(m3_4_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[5]<-confusionMatrix(as.factor(round(m3_5_ambma$pred_ambma_m3,0)), as.factor(m3_5_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[6]<-confusionMatrix(as.factor(round(m3_6_ambma$pred_ambma_m3,0)), as.factor(m3_6_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[7]<-confusionMatrix(as.factor(round(m3_7_ambma$pred_ambma_m3,0)), as.factor(m3_7_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[8]<-confusionMatrix(as.factor(round(m3_8_ambma$pred_ambma_m3,0)), as.factor(m3_8_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[9]<-confusionMatrix(as.factor(round(m3_9_ambma$pred_ambma_m3,0)), as.factor(m3_9_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m3[10]<-confusionMatrix(as.factor(round(m3_10_ambma$pred_ambma_m3,0)), as.factor(m3_10_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

mean(acc_ambma_m3)
var(acc_ambma_m3)

##calculate accuracy m4 ambma
acc_ambma_m4<-vector(length=10)

acc_ambma_m4[1]<-confusionMatrix(as.factor(round(m4_1_ambma$pred_ambma_m4,0)), as.factor(m4_1_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[2]<-confusionMatrix(as.factor(round(m4_2_ambma$pred_ambma_m4,0)), as.factor(m4_2_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[3]<-confusionMatrix(as.factor(round(m4_3_ambma$pred_ambma_m4,0)), as.factor(m4_3_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[4]<-confusionMatrix(as.factor(round(m4_4_ambma$pred_ambma_m4,0)), as.factor(m4_4_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[5]<-confusionMatrix(as.factor(round(m4_5_ambma$pred_ambma_m4,0)), as.factor(m4_5_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[6]<-confusionMatrix(as.factor(round(m4_6_ambma$pred_ambma_m4,0)), as.factor(m4_6_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[7]<-confusionMatrix(as.factor(round(m4_7_ambma$pred_ambma_m4,0)), as.factor(m4_7_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[8]<-confusionMatrix(as.factor(round(m4_8_ambma$pred_ambma_m4,0)), as.factor(m4_8_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[9]<-confusionMatrix(as.factor(round(m4_9_ambma$pred_ambma_m4,0)), as.factor(m4_9_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m4[10]<-confusionMatrix(as.factor(round(m4_10_ambma$pred_ambma_m4,0)), as.factor(m4_10_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

mean(acc_ambma_m4)
var(acc_ambma_m4)

##calculate accuracy m5 ambma
acc_ambma_m5<-vector(length=10)

acc_ambma_m5[1]<-confusionMatrix(as.factor(round(m5_1_ambma$pred_ambma_m5,0)), as.factor(m5_1_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[2]<-confusionMatrix(as.factor(round(m5_2_ambma$pred_ambma_m5,0)), as.factor(m5_2_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[3]<-confusionMatrix(as.factor(round(m5_3_ambma$pred_ambma_m5,0)), as.factor(m5_3_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[4]<-confusionMatrix(as.factor(round(m5_4_ambma$pred_ambma_m5,0)), as.factor(m5_4_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[5]<-confusionMatrix(as.factor(round(m5_5_ambma$pred_ambma_m5,0)), as.factor(m5_5_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[6]<-confusionMatrix(as.factor(round(m5_6_ambma$pred_ambma_m5,0)), as.factor(m5_6_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[7]<-confusionMatrix(as.factor(round(m5_7_ambma$pred_ambma_m5,0)), as.factor(m5_7_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[8]<-confusionMatrix(as.factor(round(m5_8_ambma$pred_ambma_m5,0)), as.factor(m5_8_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[9]<-confusionMatrix(as.factor(round(m5_9_ambma$pred_ambma_m5,0)), as.factor(m5_9_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m5[10]<-confusionMatrix(as.factor(round(m5_10_ambma$pred_ambma_m5,0)), as.factor(m5_10_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

mean(acc_ambma_m5)
var(acc_ambma_m5)

##calculate accuracy m6 ambma
acc_ambma_m6<-vector(length=10)

acc_ambma_m6[1]<-confusionMatrix(as.factor(round(m6_1_ambma$pred_ambma_m6,0)), as.factor(m6_1_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[2]<-confusionMatrix(as.factor(round(m6_2_ambma$pred_ambma_m6,0)), as.factor(m6_2_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[3]<-confusionMatrix(as.factor(round(m6_3_ambma$pred_ambma_m6,0)), as.factor(m6_3_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[4]<-confusionMatrix(as.factor(round(m6_4_ambma$pred_ambma_m6,0)), as.factor(m6_4_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[5]<-confusionMatrix(as.factor(round(m6_5_ambma$pred_ambma_m6,0)), as.factor(m6_5_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[6]<-confusionMatrix(as.factor(round(m6_6_ambma$pred_ambma_m6,0)), as.factor(m6_6_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[7]<-confusionMatrix(as.factor(round(m6_7_ambma$pred_ambma_m6,0)), as.factor(m6_7_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[8]<-confusionMatrix(as.factor(round(m6_8_ambma$pred_ambma_m6,0)), as.factor(m6_8_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[9]<-confusionMatrix(as.factor(round(m6_9_ambma$pred_ambma_m6,0)), as.factor(m6_9_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]
acc_ambma_m6[10]<-confusionMatrix(as.factor(round(m6_10_ambma$pred_ambma_m6,0)), as.factor(m6_10_ambma$presence), positive = NULL, dnn = c("Prediction", "Reference"))[3]$overall[1]

mean(acc_ambma_m6)
var(acc_ambma_m6)


results<-cbind(acc_ambma_m1,acc_ambma_m2,acc_ambma_m3,acc_ambma_m4,acc_ambma_m5,acc_ambma_m6)
write.csv(results,"acc_results.csv")
