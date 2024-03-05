//M4: Genus pooled, vector only 

data{
    matrix[4,4] Dmat;
    int y[2000];
    int sp[2000];
    int wetland[2000];
    int forest[2000];
    int crop[2000];
    int urban[2000];
    vector[2000] prcp;
    vector[2000] ndvi;
    vector[2000] phdi;
    vector[2000] tmax;
    vector[2000] dtw;
    int g[2000];
}
parameters{
    vector[3] b_0;
    vector[3] b_1;
    vector[3] b_2;
    vector[3] b_3;
    vector[3] b_4;
    vector[3] b_5;
    vector[3] b_6;
    vector[3] b_7;
    vector[3] b_9;
    vector[3] b_10;
    vector[4] e;
    real e_bar;
    real<lower=0> sigma_e;
    real b_0_bar;
    real<lower=0> sigma_b_0;
    real b_1_bar;
    real<lower=0> sigma_b_1;
    real b_2_bar;
    real<lower=0> sigma_b_2;
    real b_3_bar;
    real<lower=0> sigma_b_3;
    real b_4_bar;
    real<lower=0> sigma_b_4;
    real b_5_bar;
    real<lower=0> sigma_b_5;
    real b_6_bar;
    real<lower=0> sigma_b_6;
    real b_7_bar;
    real<lower=0> sigma_b_7;
    real b_9_bar;
    real<lower=0> sigma_b_9;
    real b_10_bar;
    real<lower=0> sigma_b_10;
}
model{
    vector[2000] p;
    sigma_b_10 ~ exponential( 1 );
    b_10_bar ~ normal( 0 , 2.5);
    sigma_b_9 ~ exponential( 1 );
    b_9_bar ~ normal( 0 , 2.5);
    sigma_b_7 ~ exponential( 1 );
    b_7_bar ~ normal( 0 , 2.5);
    sigma_b_6 ~ exponential( 1 );
    b_6_bar ~ normal( 0 , 2.5);
    sigma_b_5 ~ exponential( 1 );
    b_5_bar ~ normal( 0 , 1 );
    sigma_b_4 ~ exponential( 1 );
    b_4_bar ~ normal( 0 , 2.5);
    sigma_b_3 ~ exponential( 1 );
    b_3_bar ~ normal( 0 , 2.5);
    sigma_b_2 ~ exponential( 1 );
    b_2_bar ~ normal( 0 , 2.5);
    sigma_b_1 ~ exponential( 1 );
    b_1_bar ~ normal( 0 , 2.5);
    sigma_b_0 ~ exponential( 1 );
    b_0_bar ~ normal( 0 , 2.5);
    sigma_e ~ exponential( 1 );
    e_bar ~ normal( 0 , 1);
    e ~ normal( e_bar , sigma_e );
    b_10 ~ normal( b_10_bar , sigma_b_10 );
    b_9 ~ normal( b_9_bar , sigma_b_9 );
    b_7 ~ normal( b_7_bar , sigma_b_7 );
    b_6 ~ normal( b_6_bar , sigma_b_6 );
    b_5 ~ normal( b_5_bar , sigma_b_5 );
    b_4 ~ normal( b_4_bar , sigma_b_4 );
    b_3 ~ normal( b_3_bar , sigma_b_3 );
    b_2 ~ normal( b_2_bar , sigma_b_2 );
    b_1 ~ normal( b_1_bar , sigma_b_1 );
    b_0 ~ normal( b_0_bar , sigma_b_0 );
    for ( i in 1:2000 ) {
        p[i] = b_0[g[i]] + b_1[g[i]] * dtw[i] + b_2[g[i]] * tmax[i] + b_3[g[i]] * phdi[i] + b_4[g[i]] * ndvi[i] + b_5[g[i]] * prcp[i] + b_6[g[i]] * urban[i] + b_7[g[i]] * crop[i] + b_9[g[i]] * forest[i] + b_10[g[i]] * wetland[i] + +e[sp[i]];
        p[i] = inv_logit(p[i]);
    }
    y ~ bernoulli( p );
}
generated quantities{
    vector[2000] log_lik;
    vector[2000] p;
    for ( i in 1:2000 ) {
        p[i] = b_0[g[i]] + b_1[g[i]] * dtw[i] + b_2[g[i]] * tmax[i] + b_3[g[i]] * phdi[i] + b_4[g[i]] * ndvi[i] + b_5[g[i]] * prcp[i] + b_6[g[i]] * urban[i] + b_7[g[i]] * crop[i] + b_9[g[i]] * forest[i] + b_10[g[i]] * wetland[i] + +e[sp[i]];
        p[i] = inv_logit(p[i]);
    }
    for ( i in 1:2000 ) log_lik[i] = bernoulli_lpmf( y[i] | p[i] );
}
