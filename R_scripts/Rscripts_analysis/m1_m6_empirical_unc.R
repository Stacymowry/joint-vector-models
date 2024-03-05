##calculate average uncertainty over all runs 

#Read in m1-m6 full outputs x 10
m1_full_1<-read.csv("m1_preds_artificial.csv")
m1_full_2<-read.csv("m1_preds_artificial.csv")
m1_full_3<-read.csv("m1_preds_artificial.csv")
m1_full_4<-read.csv("m1_preds_artificial.csv")
m1_full_5<-read.csv("m1_preds_artificial.csv")
m1_full_6<-read.csv("m1_preds_artificial.csv")
m1_full_7<-read.csv("m1_preds_artificial.csv")
m1_full_8<-read.csv("m1_preds_artificial.csv")
m1_full_9<-read.csv("m1_preds_artificial.csv")
m1_full_10<-read.csv("m1_preds_artificial.csv")

m2_full_1<-read.csv("m2_preds_artificial.csv")
m2_full_2<-read.csv("m2_preds_artificial.csv")
m2_full_3<-read.csv("m2_preds_artificial.csv")
m2_full_4<-read.csv("m2_preds_artificial.csv")
m2_full_5<-read.csv("m2_preds_artificial.csv")
m2_full_6<-read.csv("m2_preds_artificial.csv")
m2_full_7<-read.csv("m2_preds_artificial.csv")
m2_full_8<-read.csv("m2_preds_artificial.csv")
m2_full_9<-read.csv("m2_preds_artificial.csv")
m2_full_10<-read.csv("m2_preds_artificial.csv")

m3_full_1<-read.csv("m3_preds_artificial.csv")
m3_full_2<-read.csv("m3_preds_artificial.csv")
m3_full_3<-read.csv("m3_preds_artificial.csv")
m3_full_4<-read.csv("m3_preds_artificial.csv")
m3_full_5<-read.csv("m3_preds_artificial.csv")
m3_full_6<-read.csv("m3_preds_artificial.csv")
m3_full_7<-read.csv("m3_preds_artificial.csv")
m3_full_8<-read.csv("m3_preds_artificial.csv")
m3_full_9<-read.csv("m3_preds_artificial.csv")
m3_full_10<-read.csv("m3_preds_artificial.csv")

m4_full_1<-read.csv("m4_preds_artificial.csv")
m4_full_2<-read.csv("m4_preds_artificial.csv")
m4_full_3<-read.csv("m4_preds_artificial.csv")
m4_full_4<-read.csv("m4_preds_artificial.csv")
m4_full_5<-read.csv("m4_preds_artificial.csv")
m4_full_6<-read.csv("m4_preds_artificial.csv")
m4_full_7<-read.csv("m4_preds_artificial.csv")
m4_full_8<-read.csv("m4_preds_artificial.csv")
m4_full_9<-read.csv("m4_preds_artificial.csv")
m4_full_10<-read.csv("m4_preds_artificial.csv")

m5_full_1<-read.csv("m5_preds_artificial.csv")
m5_full_2<-read.csv("m5_preds_artificial.csv")
m5_full_3<-read.csv("m5_preds_artificial.csv")
m5_full_4<-read.csv("m5_preds_artificial.csv")
m5_full_5<-read.csv("m5_preds_artificial.csv")
m5_full_6<-read.csv("m5_preds_artificial.csv")
m5_full_7<-read.csv("m5_preds_artificial.csv")
m5_full_8<-read.csv("m5_preds_artificial.csv")
m5_full_9<-read.csv("m5_preds_artificial.csv")
m5_full_10<-read.csv("m5_preds_artificial.csv")

m6_full_1<-read.csv("m6_preds_artificial.csv")
m6_full_2<-read.csv("m6_preds_artificial.csv")
m6_full_3<-read.csv("m6_preds_artificial.csv")
m6_full_4<-read.csv("m6_preds_artificial.csv")
m6_full_5<-read.csv("m6_preds_artificial.csv")
m6_full_6<-read.csv("m6_preds_artificial.csv")
m6_full_7<-read.csv("m6_preds_artificial.csv")
m6_full_8<-read.csv("m6_preds_artificial.csv")
m6_full_9<-read.csv("m6_preds_artificial.csv")
m6_full_10<-read.csv("m6_preds_artificial.csv")

##bind together ambma and rhisa unc from each mod x sim
uncs<-cbind(
  c(m1_full_1$unc_ambma_m1,m1_full_2$unc_ambma_m1,m1_full_3$unc_ambma_m1,
    m1_full_4$unc_ambma_m1,m1_full_5$unc_ambma_m1,m1_full_6$unc_ambma_m1,
    m1_full_7$unc_ambma_m1,m1_full_8$unc_ambma_m1,m1_full_9$unc_ambma_m1,
    m1_full_10$unc_ambma_m1),
  
  c(m2_full_1$unc_ambma_m2,m2_full_2$unc_ambma_m2,m2_full_3$unc_ambma_m2,
    m2_full_4$unc_ambma_m2,m2_full_5$unc_ambma_m2,m2_full_6$unc_ambma_m2,
    m2_full_7$unc_ambma_m2,m2_full_8$unc_ambma_m2,m2_full_9$unc_ambma_m2,
    m2_full_10$unc_ambma_m2),
  
  c(m3_full_1$unc_ambma_m3,m3_full_2$unc_ambma_m3,m3_full_3$unc_ambma_m3,
    m3_full_4$unc_ambma_m3,m3_full_5$unc_ambma_m3,m3_full_6$unc_ambma_m3,
    m3_full_7$unc_ambma_m3,m3_full_8$unc_ambma_m3,m3_full_9$unc_ambma_m3,
    m3_full_10$unc_ambma_m3),
  
  c(m4_full_1$unc_ambma_m4,m4_full_2$unc_ambma_m4,m4_full_3$unc_ambma_m4,
    m4_full_4$unc_ambma_m4,m4_full_5$unc_ambma_m4,m4_full_6$unc_ambma_m4,
    m4_full_7$unc_ambma_m4,m4_full_8$unc_ambma_m4,m4_full_9$unc_ambma_m4,
    m4_full_10$unc_ambma_m4),
  
  c(m5_full_1$unc_ambma_m5,m5_full_2$unc_ambma_m5,m5_full_3$unc_ambma_m5,
    m5_full_4$unc_ambma_m5,m5_full_5$unc_ambma_m5,m5_full_6$unc_ambma_m5,
    m5_full_7$unc_ambma_m5,m5_full_8$unc_ambma_m5,m5_full_9$unc_ambma_m5,
    m5_full_10$unc_ambma_m5),
  
  c(m6_full_1$unc_ambma_m6,m6_full_2$unc_ambma_m6,m6_full_3$unc_ambma_m6,
    m6_full_4$unc_ambma_m6,m6_full_5$unc_ambma_m6,m6_full_6$unc_ambma_m6,
    m6_full_7$unc_ambma_m6,m6_full_8$unc_ambma_m6,m6_full_9$unc_ambma_m6,
    m6_full_10$unc_ambma_m6)
  
)

colnames(uncs)<-c("unc_ambma_m1","unc_ambma_m2","unc_ambma_m3","unc_ambma_m4","unc_ambma_m5","unc_ambma_m6")
#calc avgs
apply(uncs,2,mean)

write.csv(uncs,"m1_m6_unc_allruns.csv")



