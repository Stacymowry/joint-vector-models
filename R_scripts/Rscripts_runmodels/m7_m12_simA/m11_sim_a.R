##Title: R script to run 10x m8 A
##Author: Stacy Mowry
## 5/15/2023

##Load libraries
library(rstan)
library(caret)
library(readxl)

## Function to normalize data
normalize<-function(value, min, max) {
  normalized = (value - min) / (max - min)
  return(normalized)
}


##Load in vector data

data_1<-read.csv("Sim_A_1.csv")
data_2<-read.csv("Sim_A_2.csv")
data_3<-read.csv("Sim_A_3.csv")
data_4<-read.csv("Sim_A_4.csv")
data_5<-read.csv("Sim_A_5.csv")
data_6<-read.csv("Sim_A_6.csv")
data_7<-read.csv("Sim_A_7.csv")
data_8<-read.csv("Sim_A_8.csv")
data_9<-read.csv("Sim_A_9.csv")
data_10<-read.csv("Sim_A_10.csv")

## Load in case data
case_ana_1<-read.csv("simulated_human_cases_ana_1.csv")
case_ehr_1<-read.csv("simulated_human_cases_ehr_1.csv")
case_lyme_1<-read.csv("simulated_human_cases_lyme_1.csv")

case_ana_2<-read.csv("simulated_human_cases_ana_2.csv")
case_ehr_2<-read.csv("simulated_human_cases_ehr_2.csv")
case_lyme_2<-read.csv("simulated_human_cases_lyme_2.csv")

case_ana_3<-read.csv("simulated_human_cases_ana_3.csv")
case_ehr_3<-read.csv("simulated_human_cases_ehr_3.csv")
case_lyme_3<-read.csv("simulated_human_cases_lyme_3.csv")

case_ana_4<-read.csv("simulated_human_cases_ana_4.csv")
case_ehr_4<-read.csv("simulated_human_cases_ehr_4.csv")
case_lyme_4<-read.csv("simulated_human_cases_lyme_4.csv")

case_ana_5<-read.csv("simulated_human_cases_ana_5.csv")
case_ehr_5<-read.csv("simulated_human_cases_ehr_5.csv")
case_lyme_5<-read.csv("simulated_human_cases_lyme_5.csv")

case_ana_6<-read.csv("simulated_human_cases_ana_6.csv")
case_ehr_6<-read.csv("simulated_human_cases_ehr_6.csv")
case_lyme_6<-read.csv("simulated_human_cases_lyme_6.csv")

case_ana_7<-read.csv("simulated_human_cases_ana_7.csv")
case_ehr_7<-read.csv("simulated_human_cases_ehr_7.csv")
case_lyme_7<-read.csv("simulated_human_cases_lyme_7.csv")

case_ana_8<-read.csv("simulated_human_cases_ana_8.csv")
case_ehr_8<-read.csv("simulated_human_cases_ehr_8.csv")
case_lyme_8<-read.csv("simulated_human_cases_lyme_8.csv")

case_ana_9<-read.csv("simulated_human_cases_ana_9.csv")
case_ehr_9<-read.csv("simulated_human_cases_ehr_9.csv")
case_lyme_9<-read.csv("simulated_human_cases_lyme_9.csv")

case_ana_10<-read.csv("simulated_human_cases_ana_10.csv")
case_ehr_10<-read.csv("simulated_human_cases_ehr_10.csv")
case_lyme_10<-read.csv("simulated_human_cases_lyme_10.csv")

#data for statewide predictions
data_s<-read.csv("fl2_grid_covars_scaled_newpoints.csv")
data_s<-data_s[order(data_s$county_id,decreasing = F),]
C_XX_ind<-table(data_s$county_id)

C_1<-C_XX_ind[1]
C_2<-sum(C_XX_ind[1:2])
C_3<-sum(C_XX_ind[1:3])
C_4<-sum(C_XX_ind[1:4])
C_5<-sum(C_XX_ind[1:5])
C_6<-sum(C_XX_ind[1:6])
C_7<-sum(C_XX_ind[1:7])
C_8<-sum(C_XX_ind[1:8])
C_9<-sum(C_XX_ind[1:9])
C_10<-sum(C_XX_ind[1:10])
C_11<-sum(C_XX_ind[1:11])
C_12<-sum(C_XX_ind[1:12])
C_13<-sum(C_XX_ind[1:13])
C_14<-sum(C_XX_ind[1:14])
C_15<-sum(C_XX_ind[1:15])
C_16<-sum(C_XX_ind[1:16])
C_17<-sum(C_XX_ind[1:17])
C_18<-sum(C_XX_ind[1:18])
C_19<-sum(C_XX_ind[1:19])
C_20<-sum(C_XX_ind[1:20])
C_21<-sum(C_XX_ind[1:21])
C_22<-sum(C_XX_ind[1:22])
C_23<-sum(C_XX_ind[1:23])
C_24<-sum(C_XX_ind[1:24])
C_25<-sum(C_XX_ind[1:25])
C_26<-sum(C_XX_ind[1:26])
C_27<-sum(C_XX_ind[1:27])
C_28<-sum(C_XX_ind[1:28])
C_29<-sum(C_XX_ind[1:29])
C_30<-sum(C_XX_ind[1:30])
C_31<-sum(C_XX_ind[1:31])
C_32<-sum(C_XX_ind[1:32])
C_33<-sum(C_XX_ind[1:33])
C_34<-sum(C_XX_ind[1:34])
C_35<-sum(C_XX_ind[1:35])
C_36<-sum(C_XX_ind[1:36])
C_37<-sum(C_XX_ind[1:37])
C_38<-sum(C_XX_ind[1:38])
C_39<-sum(C_XX_ind[1:39])
C_40<-sum(C_XX_ind[1:40])
C_41<-sum(C_XX_ind[1:41])
C_42<-sum(C_XX_ind[1:42])
C_43<-sum(C_XX_ind[1:43])
C_44<-sum(C_XX_ind[1:44])
C_45<-sum(C_XX_ind[1:45])
C_46<-sum(C_XX_ind[1:46])
C_47<-sum(C_XX_ind[1:47])
C_48<-sum(C_XX_ind[1:48])
C_49<-sum(C_XX_ind[1:49])
C_50<-sum(C_XX_ind[1:50])
C_51<-sum(C_XX_ind[1:51])
C_52<-sum(C_XX_ind[1:52])
C_53<-sum(C_XX_ind[1:53])
C_54<-sum(C_XX_ind[1:54])
C_55<-sum(C_XX_ind[1:55])
C_56<-sum(C_XX_ind[1:56])
C_57<-sum(C_XX_ind[1:57])
C_58<-sum(C_XX_ind[1:58])
C_59<-sum(C_XX_ind[1:59])
C_60<-sum(C_XX_ind[1:60])
C_61<-sum(C_XX_ind[1:61])
C_62<-sum(C_XX_ind[1:62])
C_63<-sum(C_XX_ind[1:63])
C_64<-sum(C_XX_ind[1:64])
C_65<-sum(C_XX_ind[1:65])
C_66<-sum(C_XX_ind[1:66])
C_67<-sum(C_XX_ind[1:67])


dtw_s = data_s$dtw
tmax_s = data_s$tmax
phdi_s = data_s$PHDI_average
ndvi_s = data_s$ndvi
prcp_s = data_s$prcp
urban_s = data_s$landcover_1
data_s$urban = data_s$landcover_1
crop_s = data_s$landcover_2
data_s$crop = data_s$landcover_2
GS_s = data_s$landcover_5 + data_s$landcover_7
data_s$GS = data_s$landcover_5 + data_s$landcover_7 + data_s$landcover_8
forest_s = data_s$landcover_6 + data_s$landcover_11 + data_s$landcover_14 + data_s$landcover_15
data_s$forest = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15
wetland_s = data_s$landcover_18 
data_s$wetland = data_s$landcover_18 


##Load in covariates
##Pathogen data
ana_circ<-read_xlsx("distance_to_pathogen_fl.xlsx", sheet = 1) 
ehr_circ<-read_xlsx("distance_to_pathogen_fl.xlsx", sheet = 2) 
lyme_circ<-read_xlsx("distance_to_pathogen_fl.xlsx", sheet = 3) 

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
d_circ_ehr<-convert_circ(ehr_circ)
d_circ_lyme<-convert_circ(lyme_circ)

d_circ<-c(d_circ_ana,d_circ_ehr,d_circ_lyme)

##Socoieconomic data
hc<-read.csv("fl_percent_insured.csv") ## coefficient access to health care
H<-as.matrix(hc[,4:12]) ## percent insured
H<-cbind(H,hc[,12]) #assume that health care coverage in 2019 = hc coverage in 2018 (keep matrix sizes equal)
H<-rbind(H,H,H)
H<-H[,3:10]

##Population size
N<-read.csv("county_pops.csv",header = F)
N<-N[,2]

#normalize population size
N_new<-c()
for (i in 1:67)
{
  N_add<-normalize(N[i],min(N),max(N))
  N_new<-c(N_new,N_add)
}

N<-N_new
N<-c(N,N,N)

##RUN 1
data<-data_1

case_ana<-case_ana_1
case_ehr<-case_ehr_1
case_lyme<-case_lyme_1


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file
model_file = "m5path_sim_a_shared.stan"

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_1.csv")

write.csv(out_2,"yhat_m5path_a_1.csv")

##RUN 2
data<-data_2

case_ana<-case_ana_2
case_ehr<-case_ehr_2
case_lyme<-case_lyme_2


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_2.csv")

write.csv(out_2,"yhat_m5path_a_2.csv")

##RUN 3
data<-data_3

case_ana<-case_ana_3
case_ehr<-case_ehr_3
case_lyme<-case_lyme_3


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_3.csv")

write.csv(out_2,"yhat_m5path_a_3.csv")

##RUN 4
data<-data_4

case_ana<-case_ana_4
case_ehr<-case_ehr_4
case_lyme<-case_lyme_4


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_4.csv")

write.csv(out_2,"yhat_m5path_a_4.csv")

##RUN 5
data<-data_5

case_ana<-case_ana_5
case_ehr<-case_ehr_5
case_lyme<-case_lyme_5


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_5.csv")

write.csv(out_2,"yhat_m5path_a_5.csv")

##RUN 6
data<-data_6

case_ana<-case_ana_6
case_ehr<-case_ehr_6
case_lyme<-case_lyme_6


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_6.csv")

write.csv(out_2,"yhat_m5path_a_6.csv")

##RUN 7
data<-data_7

case_ana<-case_ana_7
case_ehr<-case_ehr_7
case_lyme<-case_lyme_7


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_7.csv")

write.csv(out_2,"yhat_m5path_a_7.csv")

##RUN 8
data<-data_8

case_ana<-case_ana_8
case_ehr<-case_ehr_8
case_lyme<-case_lyme_8


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_8.csv")

write.csv(out_2,"yhat_m5path_a_8.csv")

##RUN 9
data<-data_9

case_ana<-case_ana_9
case_ehr<-case_ehr_9
case_lyme<-case_lyme_9


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_9.csv")

write.csv(out_2,"yhat_m5path_a_9.csv")

##RUN 10
data<-data_10

case_ana<-case_ana_10
case_ehr<-case_ehr_10
case_lyme<-case_lyme_10


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,4:11]
case_ehr<-case_ehr[,4:11]
case_lyme<-case_lyme[,4:11]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]


#put data into a list
dat <- list(
  o = o,
  y = data$obs,
  sp = data$sp,
  g = data$genus,
  dtw = data$dtw,
  tmax = data$tmax,
  phdi = data$PHDI_average,
  ndvi = data$ndvi,
  prcp = data$prcp,
  urban = data$landcover_1,
  crop = data$landcover_2,
  forest = data$landcover_6 + data$landcover_14 + data$landcover_15,
  wetland = data$landcover_18,
  dtw_s = data_s$dtw,
  tmax_s = data_s$tmax,
  phdi_s = data_s$PHDI_average,
  ndvi_s = data_s$ndvi,
  prcp_s = data_s$prcp,
  urban_s = data_s$landcover_1,
  crop_s = data_s$landcover_2,
  forest_s = data_s$landcover_6 + data_s$landcover_14 + data_s$landcover_15,
  wetland_s = data_s$landcover_18,
  C_1 = C_1,
  C_2 = C_2,
  C_3 = C_3,
  C_4 = C_4,
  C_5 = C_5,
  C_6 = C_6,
  C_7 = C_7,
  C_8 = C_8,
  C_9 = C_9,
  C_10 = C_10,
  C_11 = C_11,
  C_12 = C_12,
  C_13 = C_13,
  C_14 = C_14,
  C_15 = C_15,
  C_16 = C_16,
  C_17 = C_17,
  C_18 = C_18,
  C_19 = C_19,
  C_20 = C_20,
  C_21 = C_21,
  C_22 = C_22,
  C_23 = C_23,
  C_24 = C_24,
  C_25 = C_25,
  C_26 = C_26,
  C_27 = C_27,
  C_28 = C_28,
  C_29 = C_29,
  C_30 = C_30,
  C_31 = C_31,
  C_32 = C_32,
  C_33 = C_33,
  C_34 = C_34,
  C_35 = C_35,
  C_36 = C_36,
  C_37 = C_37,
  C_38 = C_38,
  C_39 = C_39,
  C_40 = C_40,
  C_41 = C_41,
  C_42 = C_42,
  C_43 = C_43,
  C_44 = C_44,
  C_45 = C_45,
  C_46 = C_46,
  C_47 = C_47,
  C_48 = C_48,
  C_49 = C_49,
  C_50 = C_50,
  C_51 = C_51,
  C_52 = C_52,
  C_53 = C_53,
  C_54 = C_54,
  C_55 = C_55,
  C_56 = C_56,
  C_57 = C_57,
  C_58 = C_58,
  C_59 = C_59,
  C_60 = C_60,
  C_61 = C_61,
  C_62 = C_62,
  C_63 = C_63,
  C_64 = C_64,
  C_65 = C_65,
  C_66 = C_66,
  C_67 = C_67,
  N = N,
  H = H,
  gen = c(1,1,2,3),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

mat.data.2<-c(0.1,0.1, 0.348,
              0.1, 0.1, 0.348,
              0.348, 0.348, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)
Dmat.b<-matrix(mat.data.2,nrow=3,ncol=3,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat
dat$Dmat_b<-Dmat.b

##pull model from stan file

fit <- stan(file = model_file, data = dat,
            iter = 7000, chains =4, cores = 4)

out_1<-extract(fit,  pars = c("b_0","b_1","b_2" ,"b_3",
                              "b_4", "b_5", "b_6", "b_7",
                              "b_9","b_10", "e","e_bar","sigma_b_0",
                              "sigma_b_1", "sigma_b_2", "sigma_b_3",
                              "sigma_b_4", "sigma_b_5", "sigma_b_6",
                              "sigma_b_7", "sigma_b_9", "sigma_b_10",
                              "b_0_p", "b_1_p",
                              "b_0_d","b_1_d","b_2_d","b_4_d",
                              "b_0_r","b_1_r","b_2_r"))


model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "e","e_bar","sigma_b_0",
                                  "sigma_b_1", "sigma_b_2", "sigma_b_3",
                                  "sigma_b_4", "sigma_b_5", "sigma_b_6",
                                  "sigma_b_7", "sigma_b_9", "sigma_b_10",
                                  "b_0_p", "b_1_p",
                                  "b_0_d","b_1_d","b_2_d","b_4_d",
                                  "b_0_r","b_1_r","b_2_r"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m5path_a_10.csv")

write.csv(out_2,"yhat_m5path_a_10.csv")



