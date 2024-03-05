##Title: R script to run Stan models -- Revised empirical analysis (artificial sparse)
##Author: Stacy Mowry
## 02/09/2023

##Load libraries
library(rstan)
library(caret)
library(readxl)
library(rethinking)

## Function to normalize data
normalize<-function(value, min, max) {
  normalized = (value - min) / (max - min)
  return(normalized)
}



#data for statewide predictions
data_s<-read.csv("fl2_grid_scaled.csv")
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

## Load in case data
case_ana<-read_xlsx("FL_case_data.xlsx",
                    sheet = 6, col_names = FALSE) ##matrix of case data
case_ehr<-read_xlsx("FL_case_data.xlsx", 
                    sheet = 7, col_names = FALSE) ##matrix of case data
case_lyme<-read_xlsx("FL_case_data.xlsx",
                     sheet = 8, col_names = FALSE) ##matrix of case data


count_ana<-read_xlsx("FL_case_data.xlsx",
                     sheet = 1, col_names = FALSE) ##matrix of case data
count_ehr<-read_xlsx("FL_case_data.xlsx", 
                     sheet = 2, col_names = FALSE) ##matrix of case data
count_lyme<-read_xlsx("FL_case_data.xlsx",
                      sheet = 3, col_names = FALSE) ##matrix of case data

##convert count data to a matrix
count_ana<-as.matrix(count_ana)
count_ehr<-as.matrix(count_ehr)
count_lyme<-as.matrix(count_lyme)


##convert case data to a matrix
case_ana<-as.matrix(case_ana)
case_ehr<-as.matrix(case_ehr)
case_lyme<-as.matrix(case_lyme)

case_ana<-case_ana[,3:10]
case_lyme<-case_lyme[,3:10]
o<-rbind(case_ana,case_ehr,case_lyme)

## Set dimensions 
R<-dim(o)[1]
T<-dim(o)[2]

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


##indicate which split
data<-read.csv("train_1.csv")

#put data into a list
dat <- list(
  o = o,
  y = data$presence,
  sp = data$species,
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
  gen = c(1,1,2,3,3,4),
  sp_s<-c(rep(1,5097),rep(2,5097),rep(3,5097),rep(4,5097),
          rep(5,5097),rep(6,5097)),
  gen_s<-c(rep(1,5097),rep(1,5097),rep(2,5097),rep(3,5097),
           rep(3,5097),rep(4,5097)),
  d_circ = d_circ,
  pat = c(rep(1,67),rep(2,67),rep(3,67))
)

#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01, 0.174,0.348,0.348,0.2,
              0.01,0.01, 0.174,0.348,0.348,0.2,
              0.174,0.174,0.01,0.356,0.356,0.116,
              0.348,0.348,0.356,0.01,0.01,0.382,
              0.348,0.348,0.356,0.01,0.01,0.382,
              0.2,0.2,0.116,0.382,0.382,0.01)

Dmat <- matrix(mat.data,nrow=6,ncol=6,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file

##run 4 chains, each 1000 iterations
fit = stan(file ="1_m1.stan",
           data = dat,iter=5000,chains=4,cores=4)


##look at model fit 
print(fit)

## extract samples
params = rstan::extract(fit)

##save samples to csv
write.csv(params,"m1.csv")

##run 4 chains, each 1000 iterations
fit = stan(file ="1_m2.stan",
           data = dat,iter=5000,chains=4,cores=4)


##look at model fit 
print(fit)

## extract samples
params = rstan::extract(fit)

##save samples to csv
write.csv(params,"m2.csv")

##run 4 chains, each 1000 iterations
fit = stan(file ="1_m3.stan",
           data = dat,iter=5000,chains=4,cores=4)


##look at model fit 
print(fit)

## extract samples
params = rstan::extract(fit)

##save samples to csv
write.csv(params,"m3.csv")

##run 4 chains, each 1000 iterations
fit = stan(file ="1_m4.stan",
           data = dat,iter=5000,chains=4,cores=4)


##look at model fit 
print(fit)

## extract samples
params = rstan::extract(fit)

##save samples to csv
write.csv(params,"m4.csv")

##run 4 chains, each 1000 iterations
fit = stan(file ="/Users/stacymowry/Desktop/Research/Dissertation/aim1_tick_dist/Single_joint_ticks/Stancode_1_12/Revisions/m1_m6_artificial/1_m5.stan",
           data = dat,iter=5000,chains=4,cores=4)


##look at model fit 
print(fit)

## extract samples
params = rstan::extract(fit)

##save samples to csv
write.csv(params,"m5.csv")

##run 4 chains, each 1000 iterations
fit1 = stan(file ="1_m6.stan",
            data = dat,iter=5000,chains=4,cores=4)


##look at model fit 
print(fit1)

## extract samples
params = rstan::extract(fit1)

##save samples to csv
write.csv(params,"m6.csv")

