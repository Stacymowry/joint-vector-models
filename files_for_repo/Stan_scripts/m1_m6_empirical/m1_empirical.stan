// Independent species model pathogen

data{
    matrix[6,6] Dmat;
    int y[1492];
    int wetland[1492];
    int forest[1492];
    int crop[1492];
    int urban[1492];
    vector[1492] prcp;
    vector[1492] ndvi;
    vector[1492] phdi;
    vector[1492] tmax;
    vector[1492] dtw;
    int sp[1492];
}
parameters{
    vector[6] b_0;
    vector[6] b_1;
    vector[6] b_2;
    vector[6] b_3;
    vector[6] b_4;
    vector[6] b_5;
    vector[6] b_6;
    vector[6] b_7;
    vector[6] b_9;
    vector[6] b_10;
}
model{
    vector[1492] p;
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
    for ( i in 1:1492 ) {
        p[i] = b_0[sp[i]] + b_1[sp[i]] * dtw[i] + b_2[sp[i]] * tmax[i] + b_3[sp[i]] * phdi[i] + b_4[sp[i]] * ndvi[i] + b_5[sp[i]] * prcp[i] + b_6[sp[i]] * urban[i] + b_7[sp[i]] * crop[i] + b_9[sp[i]] * forest[i] + b_10[sp[i]] * wetland[i];
        p[i] = inv_logit(p[i]);
    }
    y ~ bernoulli( p );
}
generated quantities{
    vector[1492] log_lik;
    vector[1492] p;
    for ( i in 1:1492 ) {
        p[i] = b_0[sp[i]] + b_1[sp[i]] * dtw[i] + b_2[sp[i]] * tmax[i] + b_3[sp[i]] * phdi[i] + b_4[sp[i]] * ndvi[i] + b_5[sp[i]] * prcp[i] + b_6[sp[i]] * urban[i] + b_7[sp[i]] * crop[i] + b_9[sp[i]] * forest[i] + b_10[sp[i]] * wetland[i];
        p[i] = inv_logit(p[i]);
    }
    for ( i in 1:1492 ) log_lik[i] = bernoulli_lpmf( y[i] | p[i] );
}

