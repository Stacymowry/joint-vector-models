##Title: Run 10 simulations (sim A) of M3 on CRC
##Author: Stacy Mowry
## 5/10/2023

##Load libraries
library(rstan)
library(caret)
library(readxl)


## Function to normalize data
normalize<-function(value, min, max) {
  normalized = (value - min) / (max - min)
  return(normalized)
}

##load in 10 simulated datasets
sim_a_1<-read.csv("Sim_A_1.csv")
sim_a_2<-read.csv("Sim_A_2.csv")
sim_a_3<-read.csv("Sim_A_3.csv")
sim_a_4<-read.csv("Sim_A_4.csv")
sim_a_5<-read.csv("Sim_A_5.csv")
sim_a_6<-read.csv("Sim_A_6.csv")
sim_a_7<-read.csv("Sim_A_7.csv")
sim_a_8<-read.csv("Sim_A_8.csv")
sim_a_9<-read.csv("Sim_A_9.csv")
sim_a_10<-read.csv("Sim_A_10.csv")


##1
data<-sim_a_1

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m3a_1.csv")

write.csv(out_2,"yhat_m3a_1.csv")

##2
data<-sim_a_2

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m3a_2.csv")

write.csv(out_2,"yhat_m3a_2.csv")

##3
data<-sim_a_3

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                              "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m3a_3.csv")

write.csv(out_2,"yhat_m3a_3.csv")

##4
data<-sim_a_4

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m3a_4.csv")

write.csv(out_2,"yhat_m3a_4.csv")

##5
data<-sim_a_5

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m3a_5.csv")

write.csv(out_2,"yhat_m3a_5.csv")

##6
data<-sim_a_6

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m3a_6.csv")

write.csv(out_2,"yhat_m3a_6.csv")

##7
data<-sim_a_7

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m3a_7.csv")

write.csv(out_2,"yhat_m3a_7.csv")

##8
data<-sim_a_8

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m3a_8.csv")

write.csv(out_2,"yhat_m3a_8.csv")

##9
data<-sim_a_9

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m3a_9.csv")

write.csv(out_2,"yhat_m3a_9.csv")

##10
data<-sim_a_10

#put data into a list
dat <- list(
  y = data$obs,
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
  gen = c(1,1,2,3,3,4)
)


#Create phylogenetic distance matrix

mat.data <- c(0.01,0.01,0.174, 0.348,
              0.01,0.01,0.174, 0.348,
              0.174, 0.174, 0.01, 0.356,
              0.348,0.348, 0.356, 0.01)

Dmat <- matrix(mat.data,nrow=4,ncol=4,byrow=TRUE)

#append matrix to data
dat$Dmat<-Dmat

##pull model from stan file


model_file = "m3_sim_a.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "etasq_b_0", "etasq_b_1",
                               "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                               "etasq_b_5", "etasq_b_6", "etasq_b_7",
                               "etasq_b_9","etasq_b_10","rhosq_b_0",
                               "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                               "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                               "rhosq_b_7", "rhosq_b_9","rhosq_b_10"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "etasq_b_0", "etasq_b_1",
                                  "etasq_b_2", "etasq_b_3", "etasq_b_4", 
                                  "etasq_b_5", "etasq_b_6", "etasq_b_7",
                                  "etasq_b_9","etasq_b_10","rhosq_b_0",
                                  "rhosq_b_1","rhosq_b_2", "rhosq_b_3",
                                  "rhosq_b_4", "rhosq_b_5", "rhosq_b_6",
                                  "rhosq_b_7", "rhosq_b_9","rhosq_b_10"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m3a_10.csv")

write.csv(out_2,"yhat_m3a_10.csv")



















