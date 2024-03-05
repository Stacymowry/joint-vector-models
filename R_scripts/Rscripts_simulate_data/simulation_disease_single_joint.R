##load libraries
library(readxl)


##load functions
normalize<-function(value, min, max) {
  normalized = (value - min) / (max - min)
  return(normalized)
}


#read in true presence
fl_grid<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/true_vec_dist.csv")

#Population size
N<-read.csv("/Users/stacymowry/Desktop/Research/REDI-NET/covariates/Fl/epi/county_pops.csv",header = F)
N<-N[,2]


#normalize population size
N_new<-c()
for (i in 1:67)
{
  N_add<-normalize(N[i],min(N),max(N))
  N_new<-c(N_new,N_add)
}

N<-N_new
Npop<-N

##Distance to pathogen
#Ehrlichiosis
ehr_circ<-read_xlsx("/Users/stacymowry/Desktop/Research/REDI-NET/covariates/Fl/epi/distance_to_pathogen_fl.xlsx", sheet = 2) 

convert_circ<-function(data)
{
  data<-data.frame(data)
  data<-as.numeric(data[1:67,7])
  
  ## normalize distance to circulation
  data_new<-c()
  for (i in 1:67)
  {
    data_add<-normalize(data[i],min(data),max(data))
    data_new<-c(data_new,data_add)
  }
  
  data<-data_new
  data<-exp(-data)
  return(data)
}

d_circ_ehr<-convert_circ(ehr_circ)

#Anaplasmosis
ana_circ<-read_excel("/Users/stacymowry/Desktop/Research/REDI-NET/covariates/Fl/epi/distance_to_pathogen_fl.xlsx", sheet = 1) 

convert_circ<-function(data)
{
  data<-data.frame(data)
  data<-as.numeric(data[1:67,7])
  
  ## normalize distance to circulation
  data_new<-c()
  for (i in 1:67)
  {
    data_add<-normalize(data[i],min(data),max(data))
    data_new<-c(data_new,data_add)
  }
  
  data<-data_new
  data<-exp(-data)
  return(data)
}

d_circ_ana<-convert_circ(ana_circ)

#Anaplasmosis
lyme_circ<-read_excel("/Users/stacymowry/Desktop/Research/REDI-NET/covariates/Fl/epi/distance_to_pathogen_fl.xlsx", sheet = 3) 

convert_circ<-function(data)
{
  data<-data.frame(data)
  data<-as.numeric(data[1:67,7])
  
  ## normalize distance to circulation
  data_new<-c()
  for (i in 1:67)
  {
    data_add<-normalize(data[i],min(data),max(data))
    data_new<-c(data_new,data_add)
  }
  
  data<-data_new
  data<-exp(-data)
  return(data)
}

d_circ_lyme<-convert_circ(lyme_circ)

##Health coverage
hc<-read.csv("/Users/stacymowry/Desktop/Research/REDI-NET/covariates/Fl/epi/fl_percent_insured.csv") ## coefficient access to health care
H<-as.matrix(hc[,4:12]) ## percent insured
H<-cbind(H,hc[,12]) #assume that health care coverage in 2019 = hc coverage in 2018 (keep matrix sizes equal)
Hpop<-H


##average vector predictions over county
avg_ixosc_pres<-matrix(nrow=67,ncol=10)
avg_ambam_pres<-matrix(nrow=67,ncol=10)

#1
sum_ixosc_pres_1 <- aggregate(ixosc_1 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_1<-table(fl_grid$county_id)
avg_ixosc_pres[,1]<-sum_ixosc_pres_1[,2]/count_ixosc_pres_1

sum_ambam_pres_1 <- aggregate(ambam_1 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_1<-table(fl_grid$county_id)
avg_ambam_pres[,1]<-sum_ambam_pres_1[,2]/count_ambam_pres_1

#2
sum_ixosc_pres_2 <- aggregate(ixosc_2 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_2<-table(fl_grid$county_id)
avg_ixosc_pres[,2]<-sum_ixosc_pres_2[,2]/count_ixosc_pres_2

sum_ambam_pres_2 <- aggregate(ambam_2 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_2<-table(fl_grid$county_id)
avg_ambam_pres[,2]<-sum_ambam_pres_2[,2]/count_ambam_pres_2

#3
sum_ixosc_pres_3 <- aggregate(ixosc_3 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_3<-table(fl_grid$county_id)
avg_ixosc_pres[,3]<-sum_ixosc_pres_3[,2]/count_ixosc_pres_3

sum_ambam_pres_3 <- aggregate(ambam_3 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_3<-table(fl_grid$county_id)
avg_ambam_pres[,3]<-sum_ambam_pres_3[,2]/count_ambam_pres_3

#4
sum_ixosc_pres_4 <- aggregate(ixosc_4 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_4<-table(fl_grid$county_id)
avg_ixosc_pres[,4]<-sum_ixosc_pres_4[,2]/count_ixosc_pres_4

sum_ambam_pres_4 <- aggregate(ambam_4 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_4<-table(fl_grid$county_id)
avg_ambam_pres[,4]<-sum_ambam_pres_4[,2]/count_ambam_pres_4

#5
sum_ixosc_pres_5 <- aggregate(ixosc_5 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_5<-table(fl_grid$county_id)
avg_ixosc_pres[,5]<-sum_ixosc_pres_5[,2]/count_ixosc_pres_5

sum_ambam_pres_5 <- aggregate(ambam_5 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_5<-table(fl_grid$county_id)
avg_ambam_pres[,5]<-sum_ambam_pres_5[,2]/count_ambam_pres_5

#6
sum_ixosc_pres_6 <- aggregate(ixosc_6 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_6<-table(fl_grid$county_id)
avg_ixosc_pres[,6]<-sum_ixosc_pres_6[,2]/count_ixosc_pres_6

sum_ambam_pres_6 <- aggregate(ambam_6 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_6<-table(fl_grid$county_id)
avg_ambam_pres[,6]<-sum_ambam_pres_6[,2]/count_ambam_pres_6

#7
sum_ixosc_pres_7 <- aggregate(ixosc_7 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_7<-table(fl_grid$county_id)
avg_ixosc_pres[,7]<-sum_ixosc_pres_7[,2]/count_ixosc_pres_7

sum_ambam_pres_7 <- aggregate(ambam_7 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_7<-table(fl_grid$county_id)
avg_ambam_pres[,7]<-sum_ambam_pres_7[,2]/count_ambam_pres_7

#8
sum_ixosc_pres_8 <- aggregate(ixosc_8 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_8<-table(fl_grid$county_id)
avg_ixosc_pres[,8]<-sum_ixosc_pres_8[,2]/count_ixosc_pres_8

sum_ambam_pres_8 <- aggregate(ambam_8 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_8<-table(fl_grid$county_id)
avg_ambam_pres[,8]<-sum_ambam_pres_8[,2]/count_ambam_pres_8

#9
sum_ixosc_pres_9 <- aggregate(ixosc_9 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_9<-table(fl_grid$county_id)
avg_ixosc_pres[,9]<-sum_ixosc_pres_9[,2]/count_ixosc_pres_9

sum_ambam_pres_9 <- aggregate(ambam_9 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_9<-table(fl_grid$county_id)
avg_ambam_pres[,9]<-sum_ambam_pres_9[,2]/count_ambam_pres_9

#10
sum_ixosc_pres_10 <- aggregate(ixosc_10 ~ county_id, data = fl_grid, FUN=sum) 
count_ixosc_pres_10<-table(fl_grid$county_id)
avg_ixosc_pres[,10]<-sum_ixosc_pres_10[,2]/count_ixosc_pres_10

sum_ambam_pres_10 <- aggregate(ambam_10 ~ county_id, data = fl_grid, FUN=sum) 
count_ambam_pres_10<-table(fl_grid$county_id)
avg_ambam_pres[,10]<-sum_ambam_pres_10[,2]/count_ambam_pres_10


##Simulate pathogen presence anaplasmosis
set.seed(85)
phi.0.ana<-rnorm(10,-2,.5)

set.seed(171)
phi.1.ana<-rnorm(10,2,.5)

P.ana<-matrix(nrow=67,ncol=10)

for (i in 1:10){
P.ana[,i]<-exp(phi.0.ana[i] + phi.1.ana[i] * d_circ_ana)/(1+exp(phi.0.ana[i] + phi.1.ana[i] * d_circ_ana))
}

##Simulate pathogen presence ehrilichiosis
set.seed(189)
phi.0.ehr<-rnorm(10,-2,.5)

set.seed(6849)
phi.1.ehr<-rnorm(10,2,.5)

P.ehr<-matrix(nrow=67,ncol=10)

for (i in 1:10){
P.ehr[,i]<-exp(phi.0.ehr[i] + phi.1.ehr[i] * d_circ_ehr)/(1+exp(phi.0.ehr[i] + phi.1.ehr[i] * d_circ_ehr))
}

##Simulate pathogen presence lyme
set.seed(712)
phi.0.lyme<-rnorm(10,-1.5,1)

set.seed(909)
phi.1.lyme<-rnorm(10,3.4,1)

P.lyme<-matrix(nrow=67,ncol=10)

for (i in 1:10)
{
P.lyme[,i]<-exp(phi.0.lyme[i] + phi.1.lyme[i] * d_circ_lyme)/(1+exp(phi.0.lyme[i] + phi.1.lyme[i] * d_circ_lyme))
}

##Simulate true human disease presence ehr
set.seed(769)
alpha.hc.ehr<-rnorm(10,-2.9,1)

set.seed(119)
beta1.hc.ehr<-rnorm(10,2,1)

set.seed(80)
beta2.hc.ehr<-rnorm(10,2,1)

set.seed(2000)
beta3.hc.ehr<-rnorm(10,2.1,1)

lambda.ehr<-matrix(nrow=67,ncol=10)

for (i in 1:10){
lambda.ehr[,i]<-(exp(alpha.hc.ehr[i] + beta1.hc.ehr[i] * avg_ixosc_pres[,i] + beta2.hc.ehr[i] * avg_ambam_pres[,i] + beta3.hc.ehr[i] * P.ehr[,i] )/
               (1 + exp(alpha.hc.ehr[i] + beta1.hc.ehr[i] * avg_ixosc_pres[,i] + beta2.hc.ehr[i] * avg_ambam_pres[,i] + beta3.hc.ehr[i] * P.ehr[,i])))
}

lambda.mat.ehr<-array(numeric(),c(67,10,10))

for (i in 1:10)
{
lambda.mat.ehr[,,i]<-cbind(lambda.ehr[,i],lambda.ehr[,i],lambda.ehr[,i], lambda.ehr[,i], lambda.ehr[,i], lambda.ehr[,i], lambda.ehr[,i], lambda.ehr[,i], lambda.ehr[,i], lambda.ehr[,i])
}

##Simulate true human disease presence ana

set.seed(816)
alpha.hc.ana<-rnorm(10,-2.95,1)

set.seed(79)
beta1.hc.ana<-rnorm(10,2.5,1)

set.seed(301)
beta3.hc.ana<-rnorm(10,3.5,1)

lambda.ana<-matrix(nrow=67,ncol=10)

for (i in 1:10){
lambda.ana[,i]<-(exp(alpha.hc.ana[i] + beta1.hc.ana[i] * avg_ixosc_pres[,i] + beta3.hc.ana[i] * P.ana[,i])/
  (1 + exp(alpha.hc.ana[i] + beta1.hc.ana[i] * avg_ixosc_pres[,i] + beta3.hc.ana[i] * P.ana[,i])))
}

lambda.mat.ana<-array(numeric(),c(67,10,10))

for (i in 1:10){
lambda.mat.ana[,,i]<-cbind(lambda.ana[,i],lambda.ana[,i],lambda.ana[,i],
                      lambda.ana[,i], lambda.ana[,i], lambda.ana[,i], 
                      lambda.ana[,i], lambda.ana[,i], lambda.ana[,i], lambda.ana[,i])}

##Simulate true human disease presence lyme

set.seed(9001)
alpha.hc.lyme<-rnorm(10,-3,1)

set.seed(4305)
beta1.hc.lyme<-rnorm(10,2.5,1)

set.seed(903)
beta3.hc.lyme<-rnorm(10,2.5,1)

lambda.lyme<-matrix(nrow=67,ncol=10)

for (i in 1:10)
{
lambda.lyme[,i]<-(exp(alpha.hc.lyme[i] + beta1.hc.lyme[i] * avg_ixosc_pres[,i] + beta3.hc.lyme[i] * P.lyme[,i] )/
               (1 + exp(alpha.hc.lyme[i] + beta1.hc.lyme[i] * avg_ixosc_pres[,i] + beta3.hc.lyme[i] * P.lyme[,i] )))
}

lambda.mat.lyme<-array(numeric(),c(67,10,10))

for (i in 1:10){
lambda.mat.lyme[,,i]<-cbind(lambda.lyme[,i],lambda.lyme[,i],lambda.lyme[,i],
                            lambda.lyme[,i], lambda.lyme[,i], lambda.lyme[,i],
                            lambda.lyme[,i], lambda.lyme[,i], lambda.lyme[,i], 
                            lambda.lyme[,i])
}


##Simulate probability of reporting
set.seed(1111)
alpha.r.ana<-rnorm(10,0.10,1)

set.seed(2701)
beta.r.ana<-rnorm(10,-3,1)

set.seed(60)
beta.r.1.ana<-rnorm(10,2,1)

p.ana<-array(numeric(),c(67,10,10))

for (i in 1:10){
p.ana[,,i]<-(exp(alpha.r.ana[i] +  beta.r.ana[i] * H + beta.r.1.ana[i]*N)/(1+exp(alpha.r.ana[i] +  beta.r.ana[i] * H + beta.r.1.ana[i]*N)))
}

set.seed(14)
alpha.r.ehr<-rnorm(10,0.12,1)

set.seed(9)
beta.r.ehr<-rnorm(10,-3.1,1)

set.seed(23)
beta.r.1.ehr<-rnorm(10,1.8,1)

p.ehr<-array(numeric(),c(67,10,10))

for (i in 1:10){
p.ehr[,,i]<-(exp(alpha.r.ehr[i] +  beta.r.ehr[i] * H + beta.r.1.ehr[i]*N)/(1+exp(alpha.r.ehr[i] +  beta.r.ehr[i] * H + beta.r.1.ehr[i]*N)))
}

set.seed(117)
alpha.r.lyme<-rnorm(10,0.15,1)

set.seed(801)
beta.r.lyme<-rnorm(10,-4.1,1)

set.seed(9846)
beta.r.1.lyme<-rnorm(10,2,1)

p.lyme<-array(numeric(),c(67,10,10))
p.lyme[,,i]<-(exp(alpha.r.lyme[i] +  beta.r.lyme[i] * H + beta.r.1.lyme[i]*N)/(1+exp(alpha.r.lyme[i] +  beta.r.lyme[i] * H + beta.r.1.lyme[i]*N)))


##simulate reported cases
y.ana<-array(numeric(),c(67,10,10))

for (i in 1:10){
  for (c in 1:67){
    for (t in 1:10){
  {
y.ana[c,t,i]<-rbinom(1,1,p.ana[c,t,i]*lambda.mat.ana[c,t,i])
  }
                    }
                  }
                }

y.ehr<-array(numeric(),c(67,10,10))
for (i in 1:10){
  for (c in 1:67){
    for (t in 1:10){
      y.ehr[c,t,i]<-rbinom(1,1,p.ehr[c,t,i]*lambda.mat.ehr[c,t,i])
                  }
                }
              }

y.lyme<-array(numeric(),c(67,10,10))

for (i in 1:10)
{
  for (c in 1:67)
  {
    for (t in 1:10)
    {
      y.lyme[c,t,i]<-rbinom(1,1,p.ana[c,t,i]*lambda.mat.lyme[c,t,i])
    }
  }
}

 
write.csv(y.ana[,,1],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_1.csv")
write.csv(y.ana[,,2],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_2.csv")
write.csv(y.ana[,,3],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_3.csv")
write.csv(y.ana[,,4],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_4.csv")
write.csv(y.ana[,,5],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_5.csv")
write.csv(y.ana[,,6],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_6.csv")
write.csv(y.ana[,,7],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_7.csv")
write.csv(y.ana[,,8],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_8.csv")
write.csv(y.ana[,,9],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_9.csv")
write.csv(y.ana[,,10],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/new_sims/simulated_human_cases_ana_10.csv")

write.csv(y.ehr[,,1],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_1.csv")
write.csv(y.ehr[,,2],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_2.csv")
write.csv(y.ehr[,,3],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_3.csv")
write.csv(y.ehr[,,4],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_4.csv")
write.csv(y.ehr[,,5],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_5.csv")
write.csv(y.ehr[,,6],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_6.csv")
write.csv(y.ehr[,,7],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_7.csv")
write.csv(y.ehr[,,8],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_8.csv")
write.csv(y.ehr[,,9],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_9.csv")
write.csv(y.ehr[,,10],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_ehr_10.csv")

write.csv(y.lyme[,,1],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_1.csv")
write.csv(y.lyme[,,2],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_2.csv")
write.csv(y.lyme[,,3],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_3.csv")
write.csv(y.lyme[,,4],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_4.csv")
write.csv(y.lyme[,,5],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_5.csv")
write.csv(y.lyme[,,6],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_6.csv")
write.csv(y.lyme[,,7],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_7.csv")
write.csv(y.lyme[,,8],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_8.csv")
write.csv(y.lyme[,,9],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_9.csv")
write.csv(y.lyme[,,10],"/Users/stacymowry/Desktop/Research/Dissertation/aim1/Single_joint_ticks/simulated_data/simulated_human_cases_lyme_10.csv")



## plot sampling locations

plot_usmap(include = c("FL")) +
  labs(title = "Unbiased large") +
  theme(panel.background = element_rect(color = "blue")) +
  
  
  ggplot(data = world) +
  geom_sf() +
geom_point(data = ambma_samples_small, aes(x = x, y = y), size = 0.75, 
           shape = 10, fill = "darkred") +
coord_sf(xlim = c(-88, -78), ylim = c(24.5, 32), expand = FALSE)


#plot pres/abs for each simulation
#simulation a
sim_a<-read.csv("/Users/stacymowry/Desktop/Research/Dissertation/Manuscripts/Fl_tick_model/Single_joint_ticks/simulated_data/theoretical_sim/Simulation_C.csv")
sim_a_ambam<-subset(sim_a,species ==1)
sim_a_ambma<-subset(sim_a,species ==2)
sim_a_derva<-subset(sim_a,species ==3)
sim_a_ixosc<-subset(sim_a,species ==4)

##sim a ambam
ggplot(data = world) +
  geom_sf() +
  geom_point(data = sim_a_ambma, aes(x = x, y = y, color = factor(pred_samp)), size = 0.75) + 
  coord_sf(xlim = c(-88, -78), ylim = c(24.5, 32), expand = FALSE)

##visualize true distribution

##Create maps
data_s<-fl_grid

outline<-read.csv("/Users/stacymowry/Desktop/Research/REDI-NET/data_outputs/grids/Fl/gridsp.csv")

ouline_r<- rasterFromXYZ(outline[, c('x1', 'x2', 'out')])
ambam_r <- rasterFromXYZ(data_plot[, c('x', 'y', 'ambam_pres')])
ambma_r <- rasterFromXYZ(data_s[, c('x', 'y', 'ambma_pres')])
derva_r <- rasterFromXYZ(data_s[, c('x', 'y', 'derva_pres')])
ixosc_r <- rasterFromXYZ(data_s[, c('x', 'y', 'ixosc_pres')])


cuts_base=c(1) #set breaks
pal_base<- colorRampPalette(c("grey","grey"))

cuts=c(seq(0,0.8,.05)) #set breaks
pal <- colorRampPalette(c("pink","green"))

plot(ouline_r, col = "grey", legend = NULL)
plot(ixosc_r, add=TRUE)


