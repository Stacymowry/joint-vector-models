//M3: genus independent model, vetor only

data{
    matrix[4,4] Dmat;
    int y[1530];
    int sp[1530];
    int wetland[1530];
    int forest[1530];
    int crop[1530];
    int urban[1530];
    vector[1530] prcp;
    vector[1530] ndvi;
    vector[1530] phdi;
    vector[1530] tmax;
    vector[1530] dtw;
    int g[1530];
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
}
model{
    vector[1530] p;
    sigma_e ~ exponential( 1 );
    e_bar ~ normal( 0 , 1 );
    e ~ normal( e_bar , sigma_e );
    b_10 ~ normal( 0 , 2.5);
    b_9 ~ normal( 0 , 2.5);
    b_7 ~ normal( 0 , 2.5);
    b_6 ~ normal( 0 , 2.5);
    b_5 ~ normal( 0 , 2.5);
    b_4 ~ normal( 0 , 2.5);
    b_3 ~ normal( 0 , 2.5);
    b_2 ~ normal( 0 , 2.5);
    b_1 ~ normal( 0 , 2.5);
    b_0 ~ normal( 0 , 2.5);
    for ( i in 1:1530 ) {
        p[i] = b_0[g[i]] + b_1[g[i]] * dtw[i] + b_2[g[i]] * tmax[i] + b_3[g[i]] * phdi[i] + b_4[g[i]] * ndvi[i] + b_5[g[i]] * prcp[i] + b_6[g[i]] * urban[i] + b_7[g[i]] * crop[i] + b_9[g[i]] * forest[i] + b_10[g[i]] * wetland[i] + e[sp[i]];
        p[i] = inv_logit(p[i]);
    }
    y ~ bernoulli( p );
}
generated quantities{
    vector[1530] log_lik;
    vector[1530] p;
    for ( i in 1:1530 ) {
        p[i] = b_0[g[i]] + b_1[g[i]] * dtw[i] + b_2[g[i]] * tmax[i] + b_3[g[i]] * phdi[i] + b_4[g[i]] * ndvi[i] + b_5[g[i]] * prcp[i] + b_6[g[i]] * urban[i] + b_7[g[i]] * crop[i] + b_9[g[i]] * forest[i] + b_10[g[i]] * wetland[i] + e[sp[i]];
        p[i] = inv_logit(p[i]);
    }
    for ( i in 1:1530 ) log_lik[i] = bernoulli_lpmf( y[i] | p[i] );
}

