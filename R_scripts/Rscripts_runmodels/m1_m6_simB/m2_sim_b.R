##Title: Run 10 simulations (sim C) of M2 on CRC
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
sim_c_1<-read.csv("Sim_C_1.csv")
sim_c_2<-read.csv("Sim_C_2.csv")
sim_c_3<-read.csv("Sim_C_3.csv")
sim_c_4<-read.csv("Sim_C_4.csv")
sim_c_5<-read.csv("Sim_C_5.csv")
sim_c_6<-read.csv("Sim_C_6.csv")
sim_c_7<-read.csv("Sim_C_7.csv")
sim_c_8<-read.csv("Sim_C_8.csv")
sim_c_9<-read.csv("Sim_C_9.csv")
sim_c_10<-read.csv("Sim_C_10.csv")


##1
data<-sim_c_1

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


model_file = "m2_sim_c.stan"

#fit <- stan(file = model_file, data = dat,
 #           iter = 5000, chains = 4, cores = 4)

#out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
 #                              "b_4", "b_5", "b_6", "b_7",
  #                             "b_9","b_10", "sigma_0", "sigma_1",
   #                            "sigma_2", "sigma_3", "sigma_4", 
    #                           "sigma_5", "sigma_6", "sigma_7",
     #                          "sigma_9","sigma_10","b_0_bar",
      #                         "b_1_bar","b_2_bar", "b_3_bar",
       #                        "b_4_bar", "b_5_bar", "b_6_bar", 
        #                       "b_7_bar","b_9_bar","b_10_bar"))



#model_summary <- summary(fit, 
 #                        pars = c("b_0","b_1","b_2" ,"b_3",
  #                                "b_4", "b_5", "b_6", "b_7",
   #                               "b_9","b_10", "sigma_0", "sigma_1",
    #                              "sigma_2", "sigma_3", "sigma_4", 
     #                             "sigma_5", "sigma_6", "sigma_7",
      #                            "sigma_9","sigma_10","b_0_bar",
       #                           "b_1_bar","b_2_bar", "b_3_bar",
        #                          "b_4_bar", "b_5_bar", "b_6_bar", 
         #                         "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
#print(model_summary)


#out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m2c_1.csv")

#write.csv(out_2,"yhat_m2c_1.csv")

##2
data<-sim_c_2

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


model_file = "m2_sim_c.stan"

#fit <- stan(file = model_file, data = dat,
 #           iter = 5000, chains = 4, cores = 4)

#out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
 #                              "b_4", "b_5", "b_6", "b_7",
  #                             "b_9","b_10", "sigma_0", "sigma_1",
   #                            "sigma_2", "sigma_3", "sigma_4", 
    #                           "sigma_5", "sigma_6", "sigma_7",
     #                          "sigma_9","sigma_10","b_0_bar",
      #                         "b_1_bar","b_2_bar", "b_3_bar",
       #                        "b_4_bar", "b_5_bar", "b_6_bar", 
        #                       "b_7_bar","b_9_bar","b_10_bar"))



#model_summary <- summary(fit, 
 #                        pars = c("b_0","b_1","b_2" ,"b_3",
  #                                "b_4", "b_5", "b_6", "b_7",
   #                               "b_9","b_10", "sigma_0", "sigma_1",
    #                              "sigma_2", "sigma_3", "sigma_4", 
     #                             "sigma_5", "sigma_6", "sigma_7",
      #                            "sigma_9","sigma_10","b_0_bar",
       #                           "b_1_bar","b_2_bar", "b_3_bar",
        #                          "b_4_bar", "b_5_bar", "b_6_bar", 
         #                         "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
#print(model_summary)


#out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m2c_2.csv")

#write.csv(out_2,"yhat_m2c_2.csv")

##3
data<-sim_c_3

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


model_file = "m2_sim_c.stan"

#fit <- stan(file = model_file, data = dat,
 #           iter = 5000, chains = 4, cores = 4)

#out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
 #                              "b_4", "b_5", "b_6", "b_7",
  #                             "b_9","b_10", "sigma_0", "sigma_1",
   #                            "sigma_2", "sigma_3", "sigma_4", 
    #                           "sigma_5", "sigma_6", "sigma_7",
     #                          "sigma_9","sigma_10","b_0_bar",
      #                         "b_1_bar","b_2_bar", "b_3_bar",
       #                        "b_4_bar", "b_5_bar", "b_6_bar", 
        #                       "b_7_bar","b_9_bar","b_10_bar"))



#model_summary <- summary(fit, 
 #                        pars = c("b_0","b_1","b_2" ,"b_3",
  #                                "b_4", "b_5", "b_6", "b_7",
   #                               "b_9","b_10", "sigma_0", "sigma_1",
    #                              "sigma_2", "sigma_3", "sigma_4", 
     #                             "sigma_5", "sigma_6", "sigma_7",
      #                            "sigma_9","sigma_10","b_0_bar",
       #                           "b_1_bar","b_2_bar", "b_3_bar",
        #                          "b_4_bar", "b_5_bar", "b_6_bar", 
         #                         "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
#print(model_summary)


#out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m2c_3.csv")

#write.csv(out_2,"yhat_m2c_3.csv")


##4
data<-sim_c_4

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


model_file = "m2_sim_c.stan"

#fit <- stan(file = model_file, data = dat,
 #           iter = 5000, chains = 4, cores = 4)

#out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
 #                              "b_4", "b_5", "b_6", "b_7",
  #                             "b_9","b_10", "sigma_0", "sigma_1",
   #                            "sigma_2", "sigma_3", "sigma_4", 
    #                           "sigma_5", "sigma_6", "sigma_7",
     #                          "sigma_9","sigma_10","b_0_bar",
      #                         "b_1_bar","b_2_bar", "b_3_bar",
       #                        "b_4_bar", "b_5_bar", "b_6_bar", 
        #                       "b_7_bar","b_9_bar","b_10_bar"))



#model_summary <- summary(fit, 
 #                        pars = c("b_0","b_1","b_2" ,"b_3",
  #                                "b_4", "b_5", "b_6", "b_7",
   #                               "b_9","b_10", "sigma_0", "sigma_1",
    #                              "sigma_2", "sigma_3", "sigma_4", 
     #                             "sigma_5", "sigma_6", "sigma_7",
      #                            "sigma_9","sigma_10","b_0_bar",
       #                           "b_1_bar","b_2_bar", "b_3_bar",
        #                          "b_4_bar", "b_5_bar", "b_6_bar", 
         #                         "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
#print(model_summary)


#out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m2c_4.csv")

#write.csv(out_2,"yhat_m2c_4.csv")

##5
data<-sim_c_5

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


model_file = "m2_sim_c.stan"

#fit <- stan(file = model_file, data = dat,
 #           iter = 5000, chains = 4, cores = 4)

#out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
 #                              "b_4", "b_5", "b_6", "b_7",
  #                             "b_9","b_10", "sigma_0", "sigma_1",
   #                            "sigma_2", "sigma_3", "sigma_4", 
    #                           "sigma_5", "sigma_6", "sigma_7",
     #                          "sigma_9","sigma_10","b_0_bar",
      #                         "b_1_bar","b_2_bar", "b_3_bar",
       #                        "b_4_bar", "b_5_bar", "b_6_bar", 
        #                       "b_7_bar","b_9_bar","b_10_bar"))



#model_summary <- summary(fit, 
 #                        pars = c("b_0","b_1","b_2" ,"b_3",
  #                                "b_4", "b_5", "b_6", "b_7",
   #                               "b_9","b_10", "sigma_0", "sigma_1",
    #                              "sigma_2", "sigma_3", "sigma_4", 
     #                             "sigma_5", "sigma_6", "sigma_7",
      #                            "sigma_9","sigma_10","b_0_bar",
       #                           "b_1_bar","b_2_bar", "b_3_bar",
        #                          "b_4_bar", "b_5_bar", "b_6_bar", 
         #                         "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
#print(model_summary)


#out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m2c_5.csv")

#write.csv(out_2,"yhat_m2c_5.csv")

##6
data<-sim_c_6

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


model_file = "m2_sim_c.stan"

#fit <- stan(file = model_file, data = dat,
 #           iter = 5000, chains = 4, cores = 4)

#out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
 #                              "b_4", "b_5", "b_6", "b_7",
  #                             "b_9","b_10", "sigma_0", "sigma_1",
   #                            "sigma_2", "sigma_3", "sigma_4", 
    #                           "sigma_5", "sigma_6", "sigma_7",
     #                          "sigma_9","sigma_10","b_0_bar",
      #                         "b_1_bar","b_2_bar", "b_3_bar",
       #                        "b_4_bar", "b_5_bar", "b_6_bar", 
        #                       "b_7_bar","b_9_bar","b_10_bar"))



#model_summary <- summary(fit, 
 #                        pars = c("b_0","b_1","b_2" ,"b_3",
  #                                "b_4", "b_5", "b_6", "b_7",
   #                               "b_9","b_10", "sigma_0", "sigma_1",
    #                              "sigma_2", "sigma_3", "sigma_4", 
     #                             "sigma_5", "sigma_6", "sigma_7",
      #                            "sigma_9","sigma_10","b_0_bar",
       #                           "b_1_bar","b_2_bar", "b_3_bar",
        #                          "b_4_bar", "b_5_bar", "b_6_bar", 
         #                         "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
#print(model_summary)


#out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m2c_6.csv")

#write.csv(out_2,"yhat_m2c_6.csv")

##7
data<-sim_c_7

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


model_file = "m2_sim_c.stan"

#fit <- stan(file = model_file, data = dat,
 #           iter = 5000, chains = 4, cores = 4)

#out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
 #                              "b_4", "b_5", "b_6", "b_7",
  #                             "b_9","b_10", "sigma_0", "sigma_1",
   #                            "sigma_2", "sigma_3", "sigma_4", 
    #                           "sigma_5", "sigma_6", "sigma_7",
     #                          "sigma_9","sigma_10","b_0_bar",
      #                         "b_1_bar","b_2_bar", "b_3_bar",
       #                        "b_4_bar", "b_5_bar", "b_6_bar", 
        #                       "b_7_bar","b_9_bar","b_10_bar"))



#model_summary <- summary(fit, 
 #                        pars = c("b_0","b_1","b_2" ,"b_3",
  #                                "b_4", "b_5", "b_6", "b_7",
   #                               "b_9","b_10", "sigma_0", "sigma_1",
    #                              "sigma_2", "sigma_3", "sigma_4", 
     #                             "sigma_5", "sigma_6", "sigma_7",
      #                            "sigma_9","sigma_10","b_0_bar",
       #                           "b_1_bar","b_2_bar", "b_3_bar",
        #                          "b_4_bar", "b_5_bar", "b_6_bar", 
         #                         "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
#print(model_summary)


#out_2<-extract(fit, pars = "p")

#write.csv(out_1,"mcmc_samples_m2c_7.csv")

#write.csv(out_2,"yhat_m2c_7.csv")

##8
data<-sim_c_8 

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


model_file = "m2_sim_c.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "sigma_0", "sigma_1",
                               "sigma_2", "sigma_3", "sigma_4", 
                               "sigma_5", "sigma_6", "sigma_7",
                               "sigma_9","sigma_10","b_0_bar",
                               "b_1_bar","b_2_bar", "b_3_bar",
                               "b_4_bar", "b_5_bar", "b_6_bar", 
                               "b_7_bar","b_9_bar","b_10_bar"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "sigma_0", "sigma_1",
                                  "sigma_2", "sigma_3", "sigma_4", 
                                  "sigma_5", "sigma_6", "sigma_7",
                                  "sigma_9","sigma_10","b_0_bar",
                                  "b_1_bar","b_2_bar", "b_3_bar",
                                  "b_4_bar", "b_5_bar", "b_6_bar", 
                                  "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m2c_8.csv")

write.csv(out_2,"yhat_m2c_8.csv")

##9
data<-sim_c_9

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


model_file = "m2_sim_c.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "sigma_0", "sigma_1",
                               "sigma_2", "sigma_3", "sigma_4", 
                               "sigma_5", "sigma_6", "sigma_7",
                               "sigma_9","sigma_10","b_0_bar",
                               "b_1_bar","b_2_bar", "b_3_bar",
                               "b_4_bar", "b_5_bar", "b_6_bar", 
                               "b_7_bar","b_9_bar","b_10_bar"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "sigma_0", "sigma_1",
                                  "sigma_2", "sigma_3", "sigma_4", 
                                  "sigma_5", "sigma_6", "sigma_7",
                                  "sigma_9","sigma_10","b_0_bar",
                                  "b_1_bar","b_2_bar", "b_3_bar",
                                  "b_4_bar", "b_5_bar", "b_6_bar", 
                                  "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m2c_9.csv")

write.csv(out_2,"yhat_m2c_9.csv")

##10
data<-sim_c_10

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


model_file = "m2_sim_c.stan"

fit <- stan(file = model_file, data = dat,
            iter = 5000, chains = 4, cores = 4)

out_1<-extract(fit,  pars =  c("b_0","b_1","b_2" ,"b_3",
                               "b_4", "b_5", "b_6", "b_7",
                               "b_9","b_10", "sigma_0", "sigma_1",
                               "sigma_2", "sigma_3", "sigma_4", 
                               "sigma_5", "sigma_6", "sigma_7",
                               "sigma_9","sigma_10","b_0_bar",
                               "b_1_bar","b_2_bar", "b_3_bar",
                               "b_4_bar", "b_5_bar", "b_6_bar", 
                               "b_7_bar","b_9_bar","b_10_bar"))



model_summary <- summary(fit, 
                         pars = c("b_0","b_1","b_2" ,"b_3",
                                  "b_4", "b_5", "b_6", "b_7",
                                  "b_9","b_10", "sigma_0", "sigma_1",
                                  "sigma_2", "sigma_3", "sigma_4", 
                                  "sigma_5", "sigma_6", "sigma_7",
                                  "sigma_9","sigma_10","b_0_bar",
                                  "b_1_bar","b_2_bar", "b_3_bar",
                                  "b_4_bar", "b_5_bar", "b_6_bar", 
                                  "b_7_bar","b_9_bar","b_10_bar"), probs = c(0.1, 0.9))$summary
print(model_summary)


out_2<-extract(fit, pars = "p")

write.csv(out_1,"mcmc_samples_m2c_10.csv")

write.csv(out_2,"yhat_m2c_10.csv")
