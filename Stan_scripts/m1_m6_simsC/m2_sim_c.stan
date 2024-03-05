
// Shared species model, vector only

data{
    matrix[4,4] Dmat;
    int g[1530];
    int y[1530];
    int wetland[1530];
    int forest[1530];
    int crop[1530];
    int urban[1530];
    vector[1530] prcp;
    vector[1530] ndvi;
    vector[1530] phdi;
    vector[1530] tmax;
    vector[1530] dtw;
    int sp[1530];
}
parameters{
    vector[4] b_0;
    vector[4] b_1;
    vector[4] b_2;
    vector[4] b_3;
    vector[4] b_4;
    vector[4] b_5;
    vector[4] b_6;
    vector[4] b_7;
    vector[4] b_9;
    vector[4] b_10;
    real b_0_bar;
    real b_1_bar;
    real b_2_bar;
    real b_3_bar;
    real b_4_bar;
    real b_5_bar;
    real b_6_bar;
    real b_7_bar;
    real b_9_bar;
    real b_10_bar;
    real<lower=0> sigma_0;
    real<lower=0> sigma_1;
    real<lower=0> sigma_2;
    real<lower=0> sigma_3;
    real<lower=0> sigma_4;
    real<lower=0> sigma_5;
    real<lower=0> sigma_6;
    real<lower=0> sigma_7;
    real<lower=0> sigma_9;
    real<lower=0> sigma_10;
}
model{
    vector[1530] p;
    sigma_10 ~ exponential( 1 );
    sigma_9 ~ exponential( 1 );
    sigma_7 ~ exponential( 1 );
    sigma_6 ~ exponential( 1 );
    sigma_5 ~ exponential( 1 );
    sigma_4 ~ exponential( 1 );
    sigma_3 ~ exponential( 1 );
    sigma_2 ~ exponential( 1 );
    sigma_1 ~ exponential( 1 );
    sigma_0 ~ exponential( 1 );
    b_10_bar ~ normal( 0 , 2.5);
    b_9_bar ~ normal( 0 , 2.5);
    b_7_bar ~ normal( 0 , 2.5);
    b_6_bar ~ normal( 0 , 2.5);
    b_5_bar ~ normal( 0 , 2.5);
    b_4_bar ~ normal( 0 , 2.5);
    b_3_bar ~ normal( 0 , 2.5);
    b_2_bar ~ normal( 0 , 2.5);
    b_1_bar ~ normal( 0 , 2.5);
    b_0_bar ~ normal( 0 , 2.5);
    b_10 ~ normal( b_10_bar , sigma_10 );
    b_9 ~ normal( b_9_bar , sigma_9 );
    b_7 ~ normal( b_7_bar , sigma_7 );
    b_6 ~ normal( b_6_bar , sigma_6 );
    b_5 ~ normal( b_5_bar , sigma_5 );
    b_4 ~ normal( b_4_bar , sigma_4 );
    b_3 ~ normal( b_3_bar , sigma_3 );
    b_2 ~ normal( b_2_bar , sigma_2 );
    b_1 ~ normal( b_1_bar , sigma_1 );
    b_0 ~ normal( b_0_bar , sigma_0 );
    for ( i in 1:1530 ) {
        p[i] = b_0[sp[i]] + b_1[sp[i]] * dtw[i] + b_2[sp[i]] * tmax[i] + b_3[sp[i]] * phdi[i] + b_4[sp[i]] * ndvi[i] + b_5[sp[i]] * prcp[i] + b_6[sp[i]] * urban[i] + b_7[sp[i]] * crop[i] + b_9[sp[i]] * forest[i] + b_10[sp[i]] * wetland[i];
        p[i] = inv_logit(p[i]);
    }
    y ~ bernoulli( p );
}
generated quantities{
    vector[1530] log_lik;
    vector[1530] p;
    for ( i in 1:1530 ) {
        p[i] = b_0[sp[i]] + b_1[sp[i]] * dtw[i] + b_2[sp[i]] * tmax[i] + b_3[sp[i]] * phdi[i] + b_4[sp[i]] * ndvi[i] + b_5[sp[i]] * prcp[i] + b_6[sp[i]] * urban[i] + b_7[sp[i]] * crop[i] + b_9[sp[i]] * forest[i] + b_10[sp[i]] * wetland[i];
        p[i] = inv_logit(p[i]);
    }
    for ( i in 1:1530 ) log_lik[i] = bernoulli_lpmf( y[i] | p[i] );
}
