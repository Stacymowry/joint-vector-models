//Shared species w/ phylogenetic info, vector only

functions{

    matrix cov_GPL1(matrix x, real sq_alpha, real sq_rho, real delta) {
        int N = dims(x)[1];
        matrix[N, N] K;
        for (i in 1:(N-1)) {
          K[i, i] = sq_alpha + delta;
          for (j in (i + 1):N) {
            K[i, j] = sq_alpha * exp(-sq_rho * x[i,j] );
            K[j, i] = K[i, j];
          }
        }
        K[N, N] = sq_alpha + delta;
        return K;
    }
}
data{
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
    matrix[4,4] Dmat;
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
    real<lower=0> etasq_b_0;
    real<lower=0> rhosq_b_0;
    real<lower=0> etasq_b_1;
    real<lower=0> rhosq_b_1;
    real<lower=0> etasq_b_2;
    real<lower=0> rhosq_b_2;
    real<lower=0> etasq_b_3;
    real<lower=0> rhosq_b_3;
    real<lower=0> etasq_b_4;
    real<lower=0> rhosq_b_4;
    real<lower=0> etasq_b_5;
    real<lower=0> rhosq_b_5;
    real<lower=0> etasq_b_6;
    real<lower=0> rhosq_b_6;
    real<lower=0> etasq_b_7;
    real<lower=0> rhosq_b_7;
    real<lower=0> etasq_b_9;
    real<lower=0> rhosq_b_9;
    real<lower=0> etasq_b_10;
    real<lower=0> rhosq_b_10;
}
model{
    vector[1530] p;
    matrix[4,4] SIGMA_b_0;
    matrix[4,4] SIGMA_b_1;
    matrix[4,4] SIGMA_b_2;
    matrix[4,4] SIGMA_b_3;
    matrix[4,4] SIGMA_b_4;
    matrix[4,4] SIGMA_b_5;
    matrix[4,4] SIGMA_b_6;
    matrix[4,4] SIGMA_b_7;
    matrix[4,4] SIGMA_b_9;
    matrix[4,4] SIGMA_b_10;
    rhosq_b_10 ~ exponential( 1 );
    etasq_b_10 ~ exponential( 1 );
    rhosq_b_9 ~ exponential( 1 );
    etasq_b_9 ~ exponential( 1 );
    rhosq_b_7 ~ exponential( 1 );
    etasq_b_7 ~ exponential( 1 );
    rhosq_b_6 ~ exponential( 1 );
    etasq_b_6 ~ exponential( 1 );
    rhosq_b_5 ~ exponential( 1 );
    etasq_b_5 ~ exponential( 1 );
    rhosq_b_4 ~ exponential( 1 );
    etasq_b_4 ~ exponential( 1 );
    rhosq_b_3 ~ exponential( 1 );
    etasq_b_3 ~ exponential( 1 );
    rhosq_b_2 ~ exponential( 1 );
    etasq_b_2 ~ exponential( 1 );
    rhosq_b_1 ~ exponential( 1 );
    etasq_b_1 ~ exponential( 1 );
    rhosq_b_0 ~ exponential( 1 );
    etasq_b_0 ~ exponential( 1 );
    SIGMA_b_10 = cov_GPL1(Dmat, etasq_b_10, rhosq_b_10, 0.01);
    SIGMA_b_9 = cov_GPL1(Dmat, etasq_b_9, rhosq_b_9, 0.01);
    SIGMA_b_7 = cov_GPL1(Dmat, etasq_b_7, rhosq_b_7, 0.01);
    SIGMA_b_6 = cov_GPL1(Dmat, etasq_b_6, rhosq_b_6, 0.01);
    SIGMA_b_5 = cov_GPL1(Dmat, etasq_b_5, rhosq_b_5, 0.01);
    SIGMA_b_4 = cov_GPL1(Dmat, etasq_b_4, rhosq_b_4, 0.01);
    SIGMA_b_3 = cov_GPL1(Dmat, etasq_b_3, rhosq_b_3, 0.01);
    SIGMA_b_2 = cov_GPL1(Dmat, etasq_b_2, rhosq_b_2, 0.01);
    SIGMA_b_1 = cov_GPL1(Dmat, etasq_b_1, rhosq_b_1, 0.01);
    SIGMA_b_0 = cov_GPL1(Dmat, etasq_b_0, rhosq_b_0, 0.01);
    b_10 ~ multi_normal( rep_vector(0,4) , SIGMA_b_10 );
    b_9 ~ multi_normal( rep_vector(0,4) , SIGMA_b_9 );
    b_7 ~ multi_normal( rep_vector(0,4) , SIGMA_b_7 );
    b_6 ~ multi_normal( rep_vector(0,4) , SIGMA_b_6 );
    b_5 ~ multi_normal( rep_vector(0,4) , SIGMA_b_5 );
    b_4 ~ multi_normal( rep_vector(0,4) , SIGMA_b_4 );
    b_3 ~ multi_normal( rep_vector(0,4) , SIGMA_b_3 );
    b_2 ~ multi_normal( rep_vector(0,4) , SIGMA_b_2 );
    b_1 ~ multi_normal( rep_vector(0,4) , SIGMA_b_1 );
    b_0 ~ multi_normal( rep_vector(0,4) , SIGMA_b_0 );
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
    for ( i in 1:530 ) log_lik[i] = bernoulli_lpmf( y[i] | p[i] );
}


