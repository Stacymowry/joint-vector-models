library(ggplot2)

m1_a<-read.csv("m1path_sim_a_shared.mcmc.csv")
m2_a<-read.csv("m2path_sim_a_shared.mcmc.csv")
m3_a<-read.csv("m2bpath_sim_a_shared.mcmc.csv")
m4_a<-read.csv("m3path_sim_a_shared.mcmc.csv")
m5_a<-read.csv("m4path_sim_a_shared.mcmc.csv")
m6_a<-read.csv("m5path_sim_a_shared.mcmc.csv")

m1_c<-read.csv("m1path_sim_c_shared.mcmc.csv")
m2_c<-read.csv("m2path_sim_c_shared.mcmc.csv")
m3_c<-read.csv("m2bpath_sim_c_shared.mcmc.csv")
m4_c<-read.csv("m3path_sim_c_shared.mcmc.csv")
m5_c<-read.csv("m4path_sim_c_shared.mcmc.csv")
m6_c<-read.csv("m5path_sim_c_shared.mcmc.csv")

m1_d<-read.csv("m1path_sim_d_shared.mcmc.csv")
m2_d<-read.csv("m2path_sim_d_shared.mcmc.csv")
m3_d<-read.csv("m2bpath_sim_d_shared.mcmc.csv")
m4_d<-read.csv("m3path_sim_d_shared.mcmc.csv")
m5_d<-read.csv("m4path_sim_d_shared.mcmc.csv")
m6_d<-read.csv("m5path_sim_d_shared.mcmc.csv")

test<-cbind(m1_a$b_2_d.3,rep(1,nrow(m1_a)))
test2<-cbind(m1_c$b_2_d.3,rep(2,nrow(m1_c)))
test3<-cbind(m1_d$b_2_d.3,rep(3,nrow(m1_d)))
test4<-cbind(m2_a$b_2_d.3,rep(4,nrow(m2_a)))
test5<-cbind(m2_c$b_2_d.3,rep(5,nrow(m2_c)))
test6<-cbind(m2_d$b_2_d.3,rep(6,nrow(m2_d)))
test7<-cbind(m3_a$b_2_d.3,rep(7,nrow(m3_a)))
test8<-cbind(m3_c$b_2_d.3,rep(8,nrow(m3_c)))
test9<-cbind(m3_d$b_2_d.3,rep(9,nrow(m3_d)))
test10<-cbind(m4_a$b_2_d.3,rep(10,nrow(m4_a)))
test11<-cbind(m4_c$b_2_d.3,rep(11,nrow(m4_c)))
test12<-cbind(m4_d$b_2_d.3,rep(12,nrow(m4_d)))
test13<-cbind(m5_a$b_2_d.3,rep(13,nrow(m5_a)))
test14<-cbind(m5_c$b_2_d.3,rep(14,nrow(m5_c)))
test15<-cbind(m5_d$b_2_d.3.,rep(15,nrow(m5_d)))
test16<-cbind(m6_a$b_2_d.3,rep(16,nrow(m6_a)))
test17<-cbind(m6_c$b_2_d.3,rep(17,nrow(m6_c)))
test18<-cbind(m6_d$b_2_d.3,rep(18,nrow(m6_d)))

test<-rbind(test2,test3,test4,test5,test6,test7,
            test8,test9,test10,test11,test12,test13,
            test14,  test16, test17, test18)

colnames(test)=c("b_2_d.3","model")
test<-data.frame(test)
test$model<-as.factor(test$model)

# Basic violin plot
p <- ggplot(test, aes(x=model, y=b_2_d.3)) + 
  geom_violin()+ geom_hline(yintercept=2.7, linetype="dashed", color = "red")
p



