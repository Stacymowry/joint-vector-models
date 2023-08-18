//M5: Family independent, pathogen disease 

data{
  int C_1;
    int C_2;
    int C_3;
    int C_4;
    int C_5;
    int C_6;
    int C_7;
    int C_8;
    int C_9;
    int C_10;
    int C_11;
    int C_12;
    int C_13;
    int C_14;
    int C_15;
    int C_16;
    int C_17;
    int C_18;
    int C_19;
    int C_20;
    int C_21;
    int C_22;
    int C_23;
    int C_24;
    int C_25;
    int C_26;
    int C_27;
    int C_28;
    int C_29;
    int C_30;
    int C_31;
    int C_32;
    int C_33;
    int C_34;
    int C_35;
    int C_36;
    int C_37;
    int C_38;
    int C_39;
    int C_40;
    int C_41;
    int C_42;
    int C_43;
    int C_44;
    int C_45;
    int C_46;
    int C_47;
    int C_48;
    int C_49;
    int C_50;
    int C_51;
    int C_52;
    int C_53;
    int C_54;
    int C_55;
    int C_56;
    int C_57;
    int C_58;
    int C_59;
    int C_60;
    int C_61;
    int C_62;
    int C_63;
    int C_64;
    int C_65;
    int C_66;
    int C_67;
    
    //vector model
    matrix[4,4] Dmat;
    int g[1530];
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
    
      // add full grid data 
    int wetland_s [5097];
    int forest_s [5097];
    int crop_s [5097];
    int urban_s [5097];
    vector[5097] prcp_s;
    vector[5097] ndvi_s;
    vector[5097] phdi_s;
    vector[5097] tmax_s;
    vector[5097] dtw_s;
    
    //pathogen model
    vector[201] d_circ;
    int pat[201];
    
    //human disease model
    vector[201] N;
    
    //reporting model
   matrix[201,8] H;
    int o[201,8];
}
parameters{
  //vector model
    real b_0;
    real b_1;
    real b_2;
    real b_3;
    real b_4;
    real b_5;
    real b_6;
    real b_7;
    real b_9;
    real b_10;
    vector[4] e;
    real e_bar;
    real<lower=0> sigma_e;
    
      //pathogen model
    vector[3] b_0_p;
    vector[3] b_1_p;
    
    // disease model
    real b_0_d;
    vector[3] b_1_d;
    vector[3] b_2_d;
    real b_4_d;
    
    //reporting model 
    vector[3] b_0_r;
    vector[3] b_1_r;
    vector[3] b_2_r;
}
model{
    vector[1530] p;
     matrix[5097,4] x;
     matrix[201,4] V;
     vector[201] P;
     real D[201];
     real V_p[67, 5097, 4];
     real N_p[67, 5097, 4];
     real pr[201,10];
    sigma_e ~ exponential( 1 );
    e_bar ~ normal( 0 , 1 );
    e ~ normal( e_bar , sigma_e );
    b_10 ~ normal( 0 , 2.5 );
    b_9 ~ normal( 0 , 2.5 );
    b_7 ~ normal( 0 , 2.5 );
    b_6 ~ normal( 0 , 2.5 );
    b_5 ~ normal( 0 , 2.5 );
    b_4 ~ normal( 0 , 2.5 );
    b_3 ~ normal( 0 , 2.5 );
    b_2 ~ normal( 0 , 2.5 );
    b_1 ~ normal( 0 , 2.5 );
    b_0 ~ normal( 0 , 2.5 );
    b_0_p ~ normal(0 , 2.5);                                      
    b_1_p ~ normal(0, 1);
    b_0_d ~ normal(0, 1);
    b_1_d ~ normal(0.2, 1);
    b_2_d ~ normal(0.2, 1);
    b_4_d ~ normal(0.2, 1);
    b_0_r ~ normal(-0.5, 1);
    b_1_r ~ normal(0, 1);
    b_2_r ~ normal(0.2,1);

    //estimate betas in vector model
    for ( i in 1:1530 ) {
        p[i] = b_0 + b_1 * dtw[i] + b_2 * tmax[i] + b_3 * phdi[i] 
        + b_4 * ndvi[i] + b_5 * prcp[i] + b_6 * urban[i] + b_7 * crop[i] 
        + b_9 * forest[i] + b_10 * wetland[i] + e[sp[i]];
        
        p[i] = inv_logit(p[i]);
    }
    y ~ bernoulli( p );
    
    //make a prediction for each species over the whole state
    for (n in 1:5097)
    {
      for (j in 1:4)
      {
        x[n,j] = b_0 + b_1 * dtw_s[n] + b_2 * tmax_s[n] 
        + b_3 * phdi_s[n] + b_4 * ndvi_s[n] + b_5 * prcp_s[n]
        + b_6 * urban_s[n] + b_7 * crop_s[n] + b_9 * forest_s[n]
        + b_10 * wetland_s[n] + e[j];
                
        x[n,j] = inv_logit(x[n,j]);
      }
    }
    
    //calculate average vector presence for each county 
      //county 1
      for (j in 1:4)
      {
        for (n in 1:C_1)
        {
          V_p[1,n,j] = x[n,j]; 
          N_p[1,n,j] = 1;
        }
        V[1,j] = sum(V_p[1,1:C_1,j]) /  sum(N_p[1,1:C_1,j]);
        V[1+67,j] = sum(V_p[1,1:C_1,j]) /  sum(N_p[1,1:C_1,j]);
         V[1+2*67,j] = sum(V_p[1,1:C_1,j]) /  sum(N_p[1,1:C_1,j]);
      }
      // county 2 
      for (j in 1:4)
      {
        for (n in (C_1+1):C_2)
        {
          V_p[2,n,j] = x[n,j]; 
          N_p[2,n,j] = 1;
        }
        V[2,j] = sum(V_p[2,(C_1+1):C_2,j]) /  sum(N_p[2,(C_1+1):C_2,j]);
        V[2+67,j] = sum(V_p[2,(C_1+1):C_2,j]) /  sum(N_p[2,(C_1+1):C_2,j]);
        V[2+(2*67),j] = sum(V_p[2,(C_1+1):C_2,j]) /  sum(N_p[2,(C_1+1):C_2,j]);
      }
    // county 3 
      for (j in 1:4)
      {
        for (n in (C_2+1):C_3)
        {
          V_p[3,n,j] = x[n,j]; 
          N_p[3,n,j] = 1;
        }
        V[3,j] = sum(V_p[3,(C_2+1):C_3,j]) /  sum(N_p[3,(C_2+1):C_3,j]);
        V[3+67,j] = sum(V_p[3,(C_2+1):C_3,j]) /  sum(N_p[3,(C_2+1):C_3,j]);
        V[3+(2*67),j] = sum(V_p[3,(C_2+1):C_3,j]) /  sum(N_p[3,(C_2+1):C_3,j]);
      }
      // county 4 
      for (j in 1:4)
      {
        for (n in (C_3+1):C_4)
        {
          V_p[4,n,j] = x[n,j]; 
          N_p[4,n,j] = 1;
        }
        V[4,j] = sum(V_p[4,(C_3+1):C_4,j]) /  sum(N_p[4,(C_3+1):C_4,j]);
        V[4+67,j] = sum(V_p[4,(C_3+1):C_4,j]) /  sum(N_p[4,(C_3+1):C_4,j]);
        V[4+(2*67),j] = sum(V_p[4,(C_3+1):C_4,j]) /  sum(N_p[4,(C_3+1):C_4,j]);
      }
      // county 5 
      for (j in 1:4)
      {
        for (n in (C_4+1):C_5)
        {
          V_p[5,n,j] = x[n,j]; 
          N_p[5,n,j] = 1;
        }
        V[5,j] = sum(V_p[5,(C_4+1):C_5,j]) /  sum(N_p[5,(C_4+1):C_5,j]);
        V[5+67,j] = sum(V_p[5,(C_4+1):C_5,j]) /  sum(N_p[5,(C_4+1):C_5,j]);
        V[5+(2*67),j] = sum(V_p[5,(C_4+1):C_5,j]) /  sum(N_p[5,(C_4+1):C_5,j]);
      }
      // county 6 
      for (j in 1:4)
      {
        for (n in (C_5+1):C_6)
        {
          V_p[6,n,j] = x[n,j]; 
          N_p[6,n,j] = 1;
        }
        V[6,j] = sum(V_p[6,(C_5+1):C_6,j]) /  sum(N_p[6,(C_5+1):C_6,j]);
        V[6+67,j] = sum(V_p[6,(C_5+1):C_6,j]) /  sum(N_p[6,(C_5+1):C_6,j]);
        V[6+(2*67),j] = sum(V_p[6,(C_5+1):C_6,j]) /  sum(N_p[6,(C_5+1):C_6,j]);
      }
       // county 7 
      for (j in 1:4)
      {
        for (n in (C_6+1):C_7)
        {
          V_p[7,n,j] = x[n,j]; 
          N_p[7,n,j] = 1;
        }
        V[7,j] = sum(V_p[7,(C_6+1):C_7,j]) /  sum(N_p[7,(C_6+1):C_7,j]);
        V[7+67,j] = sum(V_p[7,(C_6+1):C_7,j]) /  sum(N_p[7,(C_6+1):C_7,j]);
        V[7+(2*67),j] = sum(V_p[7,(C_6+1):C_7,j]) /  sum(N_p[7,(C_6+1):C_7,j]);
      }
       // county 8 
      for (j in 1:4)
      {
        for (n in (C_7+1):C_8)
        {
          V_p[8,n,j] = x[n,j]; 
          N_p[8,n,j] = 1;
        }
        V[8,j] = sum(V_p[8,(C_7+1):C_8,j]) /  sum(N_p[8,(C_7+1):C_8,j]);
        V[8+67,j] = sum(V_p[8,(C_7+1):C_8,j]) /  sum(N_p[8,(C_7+1):C_8,j]);
        V[8+(2*67),j] = sum(V_p[8,(C_7+1):C_8,j]) /  sum(N_p[8,(C_7+1):C_8,j]);
      }
        // county 9 
      for (j in 1:4)
      {
        for (n in (C_8+1):C_9)
        {
          V_p[9,n,j] = x[n,j]; 
          N_p[9,n,j] = 1;
        }
        V[9,j] = sum(V_p[9,(C_8+1):C_9,j]) /  sum(N_p[9,(C_8+1):C_9,j]);
        V[9+67,j] = sum(V_p[9,(C_8+1):C_9,j]) /  sum(N_p[9,(C_8+1):C_9,j]);
        V[9+(2*67),j] = sum(V_p[9,(C_8+1):C_9,j]) /  sum(N_p[9,(C_8+1):C_9,j]);
      }
      // county 10 
      for (j in 1:4)
      {
        for (n in (C_9+1):C_10)
        {
          V_p[10,n,j] = x[n,j]; 
          N_p[10,n,j] = 1;
        }
        V[10,j] = sum(V_p[10,(C_9+1):C_10,j]) /  sum(N_p[10,(C_9+1):C_10,j]);
        V[10+67,j] = sum(V_p[10,(C_9+1):C_10,j]) /  sum(N_p[10,(C_9+1):C_10,j]);
        V[10+(2*67),j] = sum(V_p[10,(C_9+1):C_10,j]) /  sum(N_p[10,(C_9+1):C_10,j]);
      }
        // county 11
      for (j in 1:4)
      {
        for (n in (C_10+1):C_11)
        {
          V_p[11,n,j] = x[n,j]; 
          N_p[11,n,j] = 1;
        }
        V[11,j] = sum(V_p[11,(C_10+1):C_11,j]) /  sum(N_p[11,(C_10+1):C_11,j]);
        V[11+67,j] = sum(V_p[11,(C_10+1):C_11,j]) /  sum(N_p[11,(C_10+1):C_11,j]);
        V[11+(2*67),j] = sum(V_p[11,(C_10+1):C_11,j]) /  sum(N_p[11,(C_10+1):C_11,j]);
      }
      // county 12
      for (j in 1:4)
      {
        for (n in (C_11+1):C_12)
        {
          V_p[12,n,j] = x[n,j]; 
          N_p[12,n,j] = 1;
        }
        V[12,j] = sum(V_p[12,(C_11+1):C_12,j]) /  sum(N_p[12,(C_11+1):C_12,j]);
        V[12+67,j] = sum(V_p[12,(C_11+1):C_12,j]) /  sum(N_p[12,(C_11+1):C_12,j]);
        V[12+(2*67),j] = sum(V_p[12,(C_11+1):C_12,j]) /  sum(N_p[12,(C_11+1):C_12,j]);
      }
      // county 13
      for (j in 1:4)
      {
        for (n in (C_12+1):C_13)
        {
          V_p[13,n,j] = x[n,j]; 
          N_p[13,n,j] = 1;
        }
        V[13,j] = sum(V_p[13,(C_12+1):C_13,j]) /  sum(N_p[13,(C_12+1):C_13,j]);
        V[13+67,j] = sum(V_p[13,(C_12+1):C_13,j]) /  sum(N_p[13,(C_12+1):C_13,j]);
        V[13+(2*67),j] = sum(V_p[13,(C_12+1):C_13,j]) /  sum(N_p[13,(C_12+1):C_13,j]);
      }
      // county 14
      for (j in 1:4)
      {
        for (n in (C_13+1):C_14)
        {
          V_p[14,n,j] = x[n,j]; 
          N_p[14,n,j] = 1;
        }
        V[14,j] = sum(V_p[14,(C_13+1):C_14,j]) /  sum(N_p[14,(C_13+1):C_14,j]);
        V[14+67,j] = sum(V_p[14,(C_13+1):C_14,j]) /  sum(N_p[14,(C_13+1):C_14,j]);
        V[14+(2*67),j] = sum(V_p[14,(C_13+1):C_14,j]) /  sum(N_p[14,(C_13+1):C_14,j]);
      }
      // county 15
      for (j in 1:4)
      {
        for (n in (C_14+1):C_15)
        {
          V_p[15,n,j] = x[n,j]; 
          N_p[15,n,j] = 1;
        }
        V[15,j] = sum(V_p[15,(C_14+1):C_15,j]) /  sum(N_p[15,(C_14+1):C_15,j]);
        V[15+67,j] = sum(V_p[15,(C_14+1):C_15,j]) /  sum(N_p[15,(C_14+1):C_15,j]);
        V[15+(2*67),j] = sum(V_p[15,(C_14+1):C_15,j]) /  sum(N_p[15,(C_14+1):C_15,j]);
      }
      // county 16
      for (j in 1:4)
      {
        for (n in (C_15+1):C_16)
        {
          V_p[16,n,j] = x[n,j]; 
          N_p[16,n,j] = 1;
        }
        V[16,j] = sum(V_p[16,(C_15+1):C_16,j]) /  sum(N_p[16,(C_15+1):C_16,j]);
        V[16+67,j] = sum(V_p[16,(C_15+1):C_16,j]) /  sum(N_p[16,(C_15+1):C_16,j]);
        V[16+(2*67),j] = sum(V_p[16,(C_15+1):C_16,j]) /  sum(N_p[16,(C_15+1):C_16,j]);
      }
      // county 17
      for (j in 1:4)
      {
        for (n in (C_16+1):C_17)
        {
          V_p[17,n,j] = x[n,j]; 
          N_p[17,n,j] = 1;
        }
        V[17,j] = sum(V_p[17,(C_16+1):C_17,j]) /  sum(N_p[17,(C_16+1):C_17,j]);
        V[17+67,j] = sum(V_p[17,(C_16+1):C_17,j]) /  sum(N_p[17,(C_16+1):C_17,j]);
        V[17+(2*67),j] = sum(V_p[17,(C_16+1):C_17,j]) /  sum(N_p[17,(C_16+1):C_17,j]);
      }
      // county 18
      for (j in 1:4)
      {
        for (n in (C_17+1):C_18)
        {
          V_p[18,n,j] = x[n,j]; 
          N_p[18,n,j] = 1;
        }
        V[18,j] = sum(V_p[18,(C_17+1):C_18,j]) /  sum(N_p[18,(C_17+1):C_18,j]);
        V[18+67,j] = sum(V_p[18,(C_17+1):C_18,j]) /  sum(N_p[18,(C_17+1):C_18,j]);
        V[18+(2*67),j] = sum(V_p[18,(C_17+1):C_18,j]) /  sum(N_p[18,(C_17+1):C_18,j]);
      }
      // county 19
      for (j in 1:4)
      {
        for (n in (C_18+1):C_19)
        {
          V_p[19,n,j] = x[n,j]; 
          N_p[19,n,j] = 1;
        }
        V[19,j] = sum(V_p[19,(C_18+1):C_19,j]) /  sum(N_p[19,(C_18+1):C_19,j]);
        V[19+67,j] = sum(V_p[19,(C_18+1):C_19,j]) /  sum(N_p[19,(C_18+1):C_19,j]);
        V[19+(2*67),j] = sum(V_p[19,(C_18+1):C_19,j]) /  sum(N_p[19,(C_18+1):C_19,j]);
      }
      // county 20
      for (j in 1:4)
      {
        for (n in (C_19+1):C_20)
        {
          V_p[20,n,j] = x[n,j]; 
          N_p[20,n,j] = 1;
        }
        V[20,j] = sum(V_p[20,(C_19+1):C_20,j]) /  sum(N_p[20,(C_19+1):C_20,j]);
        V[20+67,j] = sum(V_p[20,(C_19+1):C_20,j]) /  sum(N_p[20,(C_19+1):C_20,j]);
        V[20+(2*67),j] = sum(V_p[20,(C_19+1):C_20,j]) /  sum(N_p[20,(C_19+1):C_20,j]);
      }
       // county 21
      for (j in 1:4)
      {
        for (n in (C_20+1):C_21)
        {
          V_p[21,n,j] = x[n,j]; 
          N_p[21,n,j] = 1;
        }
        V[21,j] = sum(V_p[21,(C_20+1):C_21,j]) /  sum(N_p[21,(C_20+1):C_21,j]);
        V[21+67,j] = sum(V_p[21,(C_20+1):C_21,j]) /  sum(N_p[21,(C_20+1):C_21,j]);
        V[21+(2*67),j] = sum(V_p[21,(C_20+1):C_21,j]) /  sum(N_p[21,(C_20+1):C_21,j]);
      }
      // county 22
      for (j in 1:4)
      {
        for (n in (C_21+1):C_22)
        {
          V_p[22,n,j] = x[n,j]; 
          N_p[22,n,j] = 1;
        }
        V[22,j] = sum(V_p[22,(C_21+1):C_22,j]) /  sum(N_p[22,(C_21+1):C_22,j]);
        V[22+67,j] = sum(V_p[22,(C_21+1):C_22,j]) /  sum(N_p[22,(C_21+1):C_22,j]);
        V[22+(2*67),j] = sum(V_p[22,(C_21+1):C_22,j]) /  sum(N_p[22,(C_21+1):C_22,j]);
      }
      // county 23
      for (j in 1:4)
      {
        for (n in (C_22+1):C_23)
        {
          V_p[23,n,j] = x[n,j]; 
          N_p[23,n,j] = 1;
        }
        V[23,j] = sum(V_p[23,(C_22+1):C_23,j]) /  sum(N_p[23,(C_22+1):C_23,j]);
        V[23+67,j] = sum(V_p[23,(C_22+1):C_23,j]) /  sum(N_p[23,(C_22+1):C_23,j]);
        V[23+(2*67),j] = sum(V_p[23,(C_22+1):C_23,j]) /  sum(N_p[23,(C_22+1):C_23,j]);
      }
       // county 24
      for (j in 1:4)
      {
        for (n in (C_23+1):C_24)
        {
          V_p[24,n,j] = x[n,j]; 
          N_p[24,n,j] = 1;
        }
        V[24,j] = sum(V_p[24,(C_23+1):C_24,j]) /  sum(N_p[24,(C_23+1):C_24,j]);
        V[24+67,j] = sum(V_p[24,(C_23+1):C_24,j]) /  sum(N_p[24,(C_23+1):C_24,j]);
        V[24+(2*67),j] = sum(V_p[24,(C_23+1):C_24,j]) /  sum(N_p[24,(C_23+1):C_24,j]);
      }
      // county 25
      for (j in 1:4)
      {
        for (n in (C_24+1):C_25)
        {
          V_p[25,n,j] = x[n,j]; 
          N_p[25,n,j] = 1;
        }
        V[25,j] = sum(V_p[25,(C_24+1):C_25,j]) /  sum(N_p[25,(C_24+1):C_25,j]);
        V[25+67,j] = sum(V_p[25,(C_24+1):C_25,j]) /  sum(N_p[25,(C_24+1):C_25,j]);
        V[25+(2*67),j] = sum(V_p[25,(C_24+1):C_25,j]) /  sum(N_p[25,(C_24+1):C_25,j]);
      }
      // county 26
      for (j in 1:4)
      {
        for (n in (C_25+1):C_26)
        {
          V_p[26,n,j] = x[n,j]; 
          N_p[26,n,j] = 1;
        }
        V[26,j] = sum(V_p[26,(C_25+1):C_26,j]) /  sum(N_p[26,(C_25+1):C_26,j]);
        V[26+67,j] = sum(V_p[26,(C_25+1):C_26,j]) /  sum(N_p[26,(C_25+1):C_26,j]);
        V[26 + (2*67),j] = sum(V_p[26,(C_25+1):C_26,j]) /  sum(N_p[26,(C_25+1):C_26,j]);
      }
      // county 27
      for (j in 1:4)
      {
        for (n in (C_26+1):C_27)
        {
          V_p[27,n,j] = x[n,j]; 
          N_p[27,n,j] = 1;
        }
        V[27,j] = sum(V_p[27,(C_26+1):C_27,j]) /  sum(N_p[27,(C_26+1):C_27,j]);
        V[27+67,j] = sum(V_p[27,(C_26+1):C_27,j]) /  sum(N_p[27,(C_26+1):C_27,j]);
        V[27+(2*67),j] = sum(V_p[27,(C_26+1):C_27,j]) /  sum(N_p[27,(C_26+1):C_27,j]);
      }
      // county 28
      for (j in 1:4)
      {
        for (n in (C_27+1):C_28)
        {
          V_p[28,n,j] = x[n,j]; 
          N_p[28,n,j] = 1;
        }
        V[28,j] = sum(V_p[28,(C_27+1):C_28,j]) /  sum(N_p[28,(C_27+1):C_28,j]);
        V[28+67,j] = sum(V_p[28,(C_27+1):C_28,j]) /  sum(N_p[28,(C_27+1):C_28,j]);
        V[28+(2*67),j] = sum(V_p[28,(C_27+1):C_28,j]) /  sum(N_p[28,(C_27+1):C_28,j]);
      }
      // county 29
      for (j in 1:4)
      {
        for (n in (C_28+1):C_29)
        {
          V_p[29,n,j] = x[n,j]; 
          N_p[29,n,j] = 1;
        }
        V[29,j] = sum(V_p[29,(C_28+1):C_29,j]) /  sum(N_p[29,(C_28+1):C_29,j]);
        V[29+67,j] = sum(V_p[29,(C_28+1):C_29,j]) /  sum(N_p[29,(C_28+1):C_29,j]);
        V[29+(2*67),j] = sum(V_p[29,(C_28+1):C_29,j]) /  sum(N_p[29,(C_28+1):C_29,j]);
      }
      // county 30
      for (j in 1:4)
      {
        for (n in (C_29+1):C_30)
        {
          V_p[30,n,j] = x[n,j]; 
          N_p[30,n,j] = 1;
        }
        V[30,j] = sum(V_p[30,(C_29+1):C_30,j]) /  sum(N_p[30,(C_29+1):C_30,j]);
        V[30+67,j] = sum(V_p[30,(C_29+1):C_30,j]) /  sum(N_p[30,(C_29+1):C_30,j]);
        V[30+(2*67),j] = sum(V_p[30,(C_29+1):C_30,j]) /  sum(N_p[30,(C_29+1):C_30,j]);
      }
       // county 31
      for (j in 1:4)
      {
        for (n in (C_30+1):C_31)
        {
          V_p[31,n,j] = x[n,j]; 
          N_p[31,n,j] = 1;
        }
        V[31,j] = sum(V_p[31,(C_30+1):C_31,j]) /  sum(N_p[31,(C_30+1):C_31,j]);
        V[31+67,j] = sum(V_p[31,(C_30+1):C_31,j]) /  sum(N_p[31,(C_30+1):C_31,j]);
        V[31+(2*67),j] = sum(V_p[31,(C_30+1):C_31,j]) /  sum(N_p[31,(C_30+1):C_31,j]);
      }
       // county 32
      for (j in 1:4)
      {
        for (n in (C_31+1):C_32)
        {
          V_p[32,n,j] = x[n,j]; 
          N_p[32,n,j] = 1;
        }
        V[32,j] = sum(V_p[32,(C_31+1):C_32,j]) /  sum(N_p[32,(C_31+1):C_32,j]);
        V[32+67,j] = sum(V_p[32,(C_31+1):C_32,j]) /  sum(N_p[32,(C_31+1):C_32,j]);
        V[32+(2*67),j] = sum(V_p[32,(C_31+1):C_32,j]) /  sum(N_p[32,(C_31+1):C_32,j]);
      }
       // county 33
      for (j in 1:4)
      {
        for (n in (C_32+1):C_33)
        {
          V_p[33,n,j] = x[n,j]; 
          N_p[33,n,j] = 1;
        }
        V[33,j] = sum(V_p[33,(C_32+1):C_33,j]) /  sum(N_p[33,(C_32+1):C_33,j]);
        V[33+67,j] = sum(V_p[33,(C_32+1):C_33,j]) /  sum(N_p[33,(C_32+1):C_33,j]);
        V[33+(2*67),j] = sum(V_p[33,(C_32+1):C_33,j]) /  sum(N_p[33,(C_32+1):C_33,j]);
      }
      // county 34
      for (j in 1:4)
      {
        for (n in (C_33+1):C_34)
        {
          V_p[34,n,j] = x[n,j]; 
          N_p[34,n,j] = 1;
        }
        V[34,j] = sum(V_p[34,(C_33+1):C_34,j]) /  sum(N_p[34,(C_33+1):C_34,j]);
        V[34+67,j] = sum(V_p[34,(C_33+1):C_34,j]) /  sum(N_p[34,(C_33+1):C_34,j]);
        V[34+(2*67),j] = sum(V_p[34,(C_33+1):C_34,j]) /  sum(N_p[34,(C_33+1):C_34,j]);
      }
       // county 35
      for (j in 1:4)
      {
        for (n in (C_34+1):C_35)
        {
          V_p[35,n,j] = x[n,j]; 
          N_p[35,n,j] = 1;
        }
        V[35,j] = sum(V_p[35,(C_34+1):C_35,j]) /  sum(N_p[35,(C_34+1):C_35,j]);
        V[35+67,j] = sum(V_p[35,(C_34+1):C_35,j]) /  sum(N_p[35,(C_34+1):C_35,j]);
        V[35+(2*67),j] = sum(V_p[35,(C_34+1):C_35,j]) /  sum(N_p[35,(C_34+1):C_35,j]);
      }
       // county 36
      for (j in 1:4)
      {
        for (n in (C_35+1):C_36)
        {
          V_p[36,n,j] = x[n,j]; 
          N_p[36,n,j] = 1;
        }
        V[36,j] = sum(V_p[36,(C_35+1):C_36,j]) /  sum(N_p[36,(C_35+1):C_36,j]);
        V[36+67,j] = sum(V_p[36,(C_35+1):C_36,j]) /  sum(N_p[36,(C_35+1):C_36,j]);
        V[36+(2*67),j] = sum(V_p[36,(C_35+1):C_36,j]) /  sum(N_p[36,(C_35+1):C_36,j]);
      }
      // county 37
      for (j in 1:4)
      {
        for (n in (C_36+1):C_37)
        {
          V_p[37,n,j] = x[n,j]; 
          N_p[37,n,j] = 1;
        }
        V[37,j] = sum(V_p[37,(C_36+1):C_37,j]) /  sum(N_p[37,(C_36+1):C_37,j]);
        V[37+67,j] = sum(V_p[37,(C_36+1):C_37,j]) /  sum(N_p[37,(C_36+1):C_37,j]);
        V[37 +(2*67),j] = sum(V_p[37,(C_36+1):C_37,j]) /  sum(N_p[37,(C_36+1):C_37,j]);
      }
      // county 38
      for (j in 1:4)
      {
        for (n in (C_37+1):C_38)
        {
          V_p[38,n,j] = x[n,j]; 
          N_p[38,n,j] = 1;
        }
        V[38,j] = sum(V_p[38,(C_37+1):C_38,j]) /  sum(N_p[38,(C_37+1):C_38,j]);
        V[38+67,j] = sum(V_p[38,(C_37+1):C_38,j]) /  sum(N_p[38,(C_37+1):C_38,j]);
        V[38+(2*67),j] = sum(V_p[38,(C_37+1):C_38,j]) /  sum(N_p[38,(C_37+1):C_38,j]);
      }
      // county 39
      for (j in 1:4)
      {
        for (n in (C_39+1):C_40)
        {
          V_p[39,n,j] = x[n,j]; 
          N_p[39,n,j] = 1;
        }
        V[39,j] = sum(V_p[39,(C_39+1):C_40,j]) /  sum(N_p[39,(C_39+1):C_40,j]);
        V[39+67,j] = sum(V_p[39,(C_39+1):C_40,j]) /  sum(N_p[39,(C_39+1):C_40,j]);
        V[39+(2*67),j] = sum(V_p[39,(C_39+1):C_40,j]) /  sum(N_p[39,(C_39+1):C_40,j]);
      }
       // county 40
      for (j in 1:4)
      {
        for (n in (C_40+1):C_41)
        {
          V_p[40,n,j] = x[n,j]; 
          N_p[40,n,j] = 1;
        }
        V[40,j] = sum(V_p[40,(C_40+1):C_41,j]) /  sum(N_p[40,(C_40+1):C_41,j]);
        V[40+67,j] = sum(V_p[40,(C_40+1):C_41,j]) /  sum(N_p[40,(C_40+1):C_41,j]);
        V[40+(2*67),j] = sum(V_p[40,(C_40+1):C_41,j]) /  sum(N_p[40,(C_40+1):C_41,j]);
      }
       // county 41
      for (j in 1:4)
      {
        for (n in (C_40+1):C_41)
        {
          V_p[41,n,j] = x[n,j]; 
          N_p[41,n,j] = 1;
        }
        V[41,j] = sum(V_p[41,(C_40+1):C_41,j]) /  sum(N_p[41,(C_40+1):C_41,j]);
        V[41+67,j] = sum(V_p[41,(C_40+1):C_41,j]) /  sum(N_p[41,(C_40+1):C_41,j]);
        V[41+(2*67),j] = sum(V_p[41,(C_40+1):C_41,j]) /  sum(N_p[41,(C_40+1):C_41,j]);
      }
         // county 42
      for (j in 1:4)
      {
        for (n in (C_41+1):C_42)
        {
          V_p[42,n,j] = x[n,j]; 
          N_p[42,n,j] = 1;
        }
        V[42,j] = sum(V_p[42,(C_41+1):C_42,j]) /  sum(N_p[42,(C_41+1):C_42,j]);
        V[42+67,j] = sum(V_p[42,(C_41+1):C_42,j]) /  sum(N_p[42,(C_41+1):C_42,j]);
        V[42+(2*67),j] = sum(V_p[42,(C_41+1):C_42,j]) /  sum(N_p[42,(C_41+1):C_42,j]);
      }
        // county 43
      for (j in 1:4)
      {
        for (n in (C_42+1):C_43)
        {
          V_p[43,n,j] = x[n,j]; 
          N_p[43,n,j] = 1;
        }
        V[43,j] = sum(V_p[43,(C_42+1):C_43,j]) /  sum(N_p[43,(C_42+1):C_43,j]);
        V[43+67,j] = sum(V_p[43,(C_42+1):C_43,j]) /  sum(N_p[43,(C_42+1):C_43,j]);
        V[43+(2*67),j] = sum(V_p[43,(C_42+1):C_43,j]) /  sum(N_p[43,(C_42+1):C_43,j]);
      }
        // county 44
      for (j in 1:4)
      {
        for (n in (C_43+1):C_44)
        {
          V_p[44,n,j] = x[n,j]; 
          N_p[44,n,j] = 1;
        }
        V[44,j] = sum(V_p[44,(C_43+1):C_44,j]) /  sum(N_p[44,(C_43+1):C_44,j]);
        V[44+67,j] = sum(V_p[44,(C_43+1):C_44,j]) /  sum(N_p[44,(C_43+1):C_44,j]);
        V[44+(2*67),j] = sum(V_p[44,(C_43+1):C_44,j]) /  sum(N_p[44,(C_43+1):C_44,j]);
      }
      // county 45
      for (j in 1:4)
      {
        for (n in (C_44+1):C_45)
        {
          V_p[45,n,j] = x[n,j]; 
          N_p[45,n,j] = 1;
        }
        V[45,j] = sum(V_p[45,(C_44+1):C_45,j]) /  sum(N_p[45,(C_44+1):C_45,j]);
        V[45+67,j] = sum(V_p[45,(C_44+1):C_45,j]) /  sum(N_p[45,(C_44+1):C_45,j]);
        V[45+(2*67),j] = sum(V_p[45,(C_44+1):C_45,j]) /  sum(N_p[45,(C_44+1):C_45,j]);
      }
        // county 46
      for (j in 1:4)
      {
        for (n in (C_45+1):C_46)
        {
          V_p[46,n,j] = x[n,j]; 
          N_p[46,n,j] = 1;
        }
        V[46,j] = sum(V_p[46,(C_45+1):C_46,j]) /  sum(N_p[46,(C_45+1):C_46,j]);
        V[46+67,j] = sum(V_p[46,(C_45+1):C_46,j]) /  sum(N_p[46,(C_45+1):C_46,j]);
        V[46+(2*67),j] = sum(V_p[46,(C_45+1):C_46,j]) /  sum(N_p[46,(C_45+1):C_46,j]);
      }
        // county 47
      for (j in 1:4)
      {
        for (n in (C_46+1):C_47)
        {
          V_p[47,n,j] = x[n,j]; 
          N_p[47,n,j] = 1;
        }
        V[47,j] = sum(V_p[47,(C_46+1):C_47,j]) /  sum(N_p[47,(C_46+1):C_47,j]);
        V[47+67,j] = sum(V_p[47,(C_46+1):C_47,j]) /  sum(N_p[47,(C_46+1):C_47,j]);
        V[47+(2*67),j] = sum(V_p[47,(C_46+1):C_47,j]) /  sum(N_p[47,(C_46+1):C_47,j]);
      }
       // county 48
      for (j in 1:4)
      {
        for (n in (C_47+1):C_48)
        {
          V_p[48,n,j] = x[n,j]; 
          N_p[48,n,j] = 1;
        }
        V[48,j] = sum(V_p[48,(C_47+1):C_48,j]) /  sum(N_p[48,(C_47+1):C_48,j]);
        V[48+67,j] = sum(V_p[48,(C_47+1):C_48,j]) /  sum(N_p[48,(C_47+1):C_48,j]);
        V[48+(2*67),j] = sum(V_p[48,(C_47+1):C_48,j]) /  sum(N_p[48,(C_47+1):C_48,j]);
      }
       // county 49
      for (j in 1:4)
      {
        for (n in (C_48+1):C_49)
        {
          V_p[49,n,j] = x[n,j]; 
          N_p[49,n,j] = 1;
        }
        V[49,j] = sum(V_p[49,(C_48+1):C_49,j]) /  sum(N_p[49,(C_48+1):C_49,j]);
        V[49+67,j] = sum(V_p[49,(C_48+1):C_49,j]) /  sum(N_p[49,(C_48+1):C_49,j]);
         V[49+(2*67),j] = sum(V_p[49,(C_48+1):C_49,j]) /  sum(N_p[49,(C_48+1):C_49,j]);
      }
       // county 50
      for (j in 1:4)
      {
        for (n in (C_49+1):C_50)
        {
          V_p[50,n,j] = x[n,j]; 
          N_p[50,n,j] = 1;
        }
        V[50,j] = sum(V_p[50,(C_49+1):C_50,j]) /  sum(N_p[50,(C_49+1):C_50,j]);
        V[50+67,j] = sum(V_p[50,(C_49+1):C_50,j]) /  sum(N_p[50,(C_49+1):C_50,j]);
        V[50+(2*67),j] = sum(V_p[50,(C_49+1):C_50,j]) /  sum(N_p[50,(C_49+1):C_50,j]);
      }
       // county 51
      for (j in 1:4)
      {
        for (n in (C_50+1):C_51)
        {
          V_p[51,n,j] = x[n,j]; 
          N_p[51,n,j] = 1;
        }
        V[51,j] = sum(V_p[51,(C_50+1):C_51,j]) /  sum(N_p[51,(C_50+1):C_51,j]);
        V[51+67,j] = sum(V_p[51,(C_50+1):C_51,j]) /  sum(N_p[51,(C_50+1):C_51,j]);
        V[51+(2*67),j] = sum(V_p[51,(C_50+1):C_51,j]) /  sum(N_p[51,(C_50+1):C_51,j]);
      }
       // county 52
      for (j in 1:4)
      {
        for (n in (C_51+1):C_52)
        {
          V_p[52,n,j] = x[n,j]; 
          N_p[52,n,j] = 1;
        }
        V[52,j] = sum(V_p[52,(C_51+1):C_52,j]) /  sum(N_p[52,(C_51+1):C_52,j]);
        V[52+67,j] = sum(V_p[52,(C_51+1):C_52,j]) /  sum(N_p[52,(C_51+1):C_52,j]);
        V[52+(2*67),j] = sum(V_p[52,(C_51+1):C_52,j]) /  sum(N_p[52,(C_51+1):C_52,j]);
      }
       // county 53
      for (j in 1:4)
      {
        for (n in (C_52+1):C_53)
        {
          V_p[53,n,j] = x[n,j]; 
          N_p[53,n,j] = 1;
        }
        V[53,j] = sum(V_p[53,(C_52+1):C_53,j]) /  sum(N_p[53,(C_52+1):C_53,j]);
        V[53+67,j] = sum(V_p[53,(C_52+1):C_53,j]) /  sum(N_p[53,(C_52+1):C_53,j]);
        V[53+(2*67),j] = sum(V_p[53,(C_52+1):C_53,j]) /  sum(N_p[53,(C_52+1):C_53,j]);
      }
       // county 54
      for (j in 1:4)
      {
        for (n in (C_53+1):C_54)
        {
          V_p[54,n,j] = x[n,j]; 
          N_p[54,n,j] = 1;
        }
        V[54,j] = sum(V_p[54,(C_53+1):C_54,j]) /  sum(N_p[54,(C_53+1):C_54,j]);
        V[54+67,j] = sum(V_p[54,(C_53+1):C_54,j]) /  sum(N_p[54,(C_53+1):C_54,j]);
        V[54+(2*67),j] = sum(V_p[54,(C_53+1):C_54,j]) /  sum(N_p[54,(C_53+1):C_54,j]);
      }
       // county 55
      for (j in 1:4)
      {
        for (n in (C_54+1):C_55)
        {
          V_p[55,n,j] = x[n,j]; 
          N_p[55,n,j] = 1;
        }
        V[55,j] = sum(V_p[55,(C_54+1):C_55,j]) /  sum(N_p[55,(C_54+1):C_55,j]);
        V[55+67,j] = sum(V_p[55,(C_54+1):C_55,j]) /  sum(N_p[55,(C_54+1):C_55,j]);
        V[55+(2*67),j] = sum(V_p[55,(C_54+1):C_55,j]) /  sum(N_p[55,(C_54+1):C_55,j]);
      }
       // county 56
      for (j in 1:4)
      {
        for (n in (C_55+1):C_56)
        {
          V_p[56,n,j] = x[n,j]; 
          N_p[56,n,j] = 1;
        }
        V[56,j] = sum(V_p[56,(C_55+1):C_56,j]) /  sum(N_p[56,(C_55+1):C_56,j]);
        V[56+67,j] = sum(V_p[56,(C_55+1):C_56,j]) /  sum(N_p[56,(C_55+1):C_56,j]);
        V[56+(2*67),j] = sum(V_p[56,(C_55+1):C_56,j]) /  sum(N_p[56,(C_55+1):C_56,j]);
      }
       // county 57
      for (j in 1:4)
      {
        for (n in (C_56+1):C_57)
        {
          V_p[57,n,j] = x[n,j]; 
          N_p[57,n,j] = 1;
        }
        V[57,j] = sum(V_p[57,(C_56+1):C_57,j]) /  sum(N_p[57,(C_56+1):C_57,j]);
        V[57+67,j] = sum(V_p[57,(C_56+1):C_57,j]) /  sum(N_p[57,(C_56+1):C_57,j]);
        V[57+(2*67),j] = sum(V_p[57,(C_56+1):C_57,j]) /  sum(N_p[57,(C_56+1):C_57,j]);
      }
       // county 58
      for (j in 1:4)
      {
        for (n in (C_57+1):C_58)
        {
          V_p[58,n,j] = x[n,j]; 
          N_p[58,n,j] = 1;
        }
        V[58,j] = sum(V_p[58,(C_57+1):C_58,j]) /  sum(N_p[58,(C_57+1):C_58,j]);
        V[58+67,j] = sum(V_p[58,(C_57+1):C_58,j]) /  sum(N_p[58,(C_57+1):C_58,j]);
        V[58+(2*67),j] = sum(V_p[58,(C_57+1):C_58,j]) /  sum(N_p[58,(C_57+1):C_58,j]);
      }
       // county 59
      for (j in 1:4)
      {
        for (n in (C_58+1):C_59)
        {
          V_p[59,n,j] = x[n,j]; 
          N_p[59,n,j] = 1;
        }
        V[59,j] = sum(V_p[59,(C_58+1):C_59,j]) /  sum(N_p[59,(C_58+1):C_59,j]);
        V[59+67,j] = sum(V_p[59,(C_58+1):C_59,j]) /  sum(N_p[59,(C_58+1):C_59,j]);
        V[59+(2*67),j] = sum(V_p[59,(C_58+1):C_59,j]) /  sum(N_p[59,(C_58+1):C_59,j]);
      }
       // county 60
      for (j in 1:4)
      {
        for (n in (C_59+1):C_60)
        {
          V_p[60,n,j] = x[n,j]; 
          N_p[60,n,j] = 1;
        }
        V[60,j] = sum(V_p[60,(C_59+1):C_60,j]) /  sum(N_p[60,(C_59+1):C_60,j]);
        V[60+67,j] = sum(V_p[60,(C_59+1):C_60,j]) /  sum(N_p[60,(C_59+1):C_60,j]);
        V[60+(2*67),j] = sum(V_p[60,(C_59+1):C_60,j]) /  sum(N_p[60,(C_59+1):C_60,j]);
      }
      // county 61
      for (j in 1:4)
      {
        for (n in (C_60+1):C_61)
        {
          V_p[61,n,j] = x[n,j]; 
          N_p[61,n,j] = 1;
        }
        V[61,j] = sum(V_p[61,(C_60+1):C_61,j]) /  sum(N_p[61,(C_60+1):C_61,j]);
        V[61+67,j] = sum(V_p[61,(C_60+1):C_61,j]) /  sum(N_p[61,(C_60+1):C_61,j]);
        V[61+(2*67),j] = sum(V_p[61,(C_60+1):C_61,j]) /  sum(N_p[61,(C_60+1):C_61,j]);
      }
       // county 62
      for (j in 1:4)
      {
        for (n in (C_61+1):C_62)
        {
          V_p[62,n,j] = x[n,j]; 
          N_p[62,n,j] = 1;
        }
        V[62,j] = sum(V_p[62,(C_61+1):C_62,j]) /  sum(N_p[62,(C_61+1):C_62,j]);
        V[62+67,j] = sum(V_p[62,(C_61+1):C_62,j]) /  sum(N_p[62,(C_61+1):C_62,j]);
        V[62+(2*67),j] = sum(V_p[62,(C_61+1):C_62,j]) /  sum(N_p[62,(C_61+1):C_62,j]);
      }
          // county 63
      for (j in 1:4)
      {
        for (n in (C_62+1):C_63)
        {
          V_p[63,n,j] = x[n,j]; 
          N_p[63,n,j] = 1;
        }
        V[63,j] = sum(V_p[63,(C_62+1):C_63,j]) /  sum(N_p[63,(C_62+1):C_63,j]);
        V[63+67,j] = sum(V_p[63,(C_62+1):C_63,j]) /  sum(N_p[63,(C_62+1):C_63,j]);
        V[63+(2*67),j] = sum(V_p[63,(C_62+1):C_63,j]) /  sum(N_p[63,(C_62+1):C_63,j]);
      }
             // county 64
      for (j in 1:4)
      {
        for (n in (C_63+1):C_64)
        {
          V_p[64,n,j] = x[n,j]; 
          N_p[64,n,j] = 1;
        }
        V[64,j] = sum(V_p[64,(C_63+1):C_64,j]) /  sum(N_p[64,(C_63+1):C_64,j]);
        V[64+67,j] = sum(V_p[64,(C_63+1):C_64,j]) /  sum(N_p[64,(C_63+1):C_64,j]);
        V[64+(2*67),j] = sum(V_p[64,(C_63+1):C_64,j]) /  sum(N_p[64,(C_63+1):C_64,j]);
      }
             // county 65
      for (j in 1:4)
      {
        for (n in (C_64+1):C_65)
        {
          V_p[65,n,j] = x[n,j]; 
          N_p[65,n,j] = 1;
        }
        V[65,j] = sum(V_p[65,(C_64+1):C_65,j]) /  sum(N_p[65,(C_64+1):C_65,j]);
        V[65+67,j] = sum(V_p[65,(C_64+1):C_65,j]) /  sum(N_p[65,(C_64+1):C_65,j]);
        V[65+(2*67),j] = sum(V_p[65,(C_64+1):C_65,j]) /  sum(N_p[65,(C_64+1):C_65,j]);
      }
             // county 66
      for (j in 1:4)
      {
        for (n in (C_65+1):C_66)
        {
          V_p[66,n,j] = x[n,j]; 
          N_p[66,n,j] = 1;
        }
        V[66,j] = sum(V_p[66,(C_65+1):C_66,j]) /  sum(N_p[66,(C_65+1):C_66,j]);
        V[66+67,j] = sum(V_p[66,(C_65+1):C_66,j]) /  sum(N_p[66,(C_65+1):C_66,j]);
        V[66+(2*67),j] = sum(V_p[66,(C_65+1):C_66,j]) /  sum(N_p[66,(C_65+1):C_66,j]);
      }
             // county 67
      for (j in 1:4)
      {
        for (n in (C_66+1):C_67)
        {
          V_p[67,n,j] = x[n,j]; 
          N_p[67,n,j] = 1;
        }
        V[67,j] = sum(V_p[67,(C_66+1):C_67,j]) /  sum(N_p[67,(C_66+1):C_67,j]);
        V[67+67,j] = sum(V_p[67,(C_66+1):C_67,j]) /  sum(N_p[67,(C_66+1):C_67,j]);
        V[67+(2*67),j] = sum(V_p[67,(C_66+1):C_67,j]) /  sum(N_p[67,(C_66+1):C_67,j]);
      }
    
      
//Pathogen model
      for (pc in 1:201)
      {
        P[pc] = b_0_p[pat[pc]] + b_1_p[pat[pc]] * d_circ[pc];
        P[pc] = inv_logit(P[pc]);
      }
      //Human disease model
      for (d1 in 1:67)
      {
        D[d1] = b_0_d + b_1_d[pat[d1]] * V[d1,4] + b_2_d[pat[d1]] * P[d1]
                ;
                
        D[d1] = inv_logit(D[d1]);
        
        //reporting model
        for (t in 1:8)
        {
          pr[d1,t] = b_0_r[pat[d1]] + b_1_r[pat[d1]] * H[d1,t] + b_2_r[pat[d1]] * N[d1] ;
          pr[d1,t] = inv_logit(pr[d1,t]);
          
          o[d1,t] ~ bernoulli(D[d1] * pr[d1,t]);
        }
        
      }
         for (d2 in 68:135)
      {
        D[d2] = b_0_d + b_1_d[pat[d2]] * V[d2,4] + b_2_d[pat[d2]] * P[d2]
                + b_4_d * V[d2,1];
                
        D[d2] = inv_logit(D[d2]);
        
         //reporting model
        for (t in 1:8)
        {
          pr[d2,t] = b_0_r[pat[d2]] + b_1_r[pat[d2]] * H[d2,t] + b_2_r[pat[d2]] * N[d2] ;
          pr[d2,t] = inv_logit(pr[d2,t]);
          
          o[d2,t] ~ bernoulli(D[d2] * pr[d2,t]);
        }
        
        
      }
      for (d3 in 136:201)
      {
        D[d3] = b_0_d + b_1_d[pat[d3]] * V[d3,4] + b_2_d[pat[d3]] * P[d3]
                 ;
                
        D[d3] = inv_logit(D[d3]);
        
         //reporting model
        for (t in 1:8)
        {
          pr[d3,t] = b_0_r[pat[d3]] + b_1_r[pat[d3]] * H[d3,t] + b_2_r[pat[d3]] * N[d3] ;
          pr[d3,t] = inv_logit(pr[d3,t]);
          
          o[d3,t] ~ bernoulli(D[d3] * pr[d3,t]);
        }
      }
}
generated quantities{
    vector[1530] log_lik;
    vector[1530] p;
    for ( i in 1:1530 ) {
        p[i] = b_0 + b_1 * dtw[i] + b_2 * tmax[i] + b_3 * phdi[i] + b_4 * ndvi[i] + b_5 * prcp[i] + b_6 * urban[i] + b_7 * crop[i] + b_9 * forest[i] + b_10 * wetland[i] + e[sp[i]];
        p[i] = inv_logit(p[i]);
    }
    for ( i in 1:1530 ) log_lik[i] = bernoulli_lpmf( y[i] | p[i] );
}
