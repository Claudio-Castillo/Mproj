#V3.30.13.00-trans;_2019_03_09;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: ss3.dat // om.ctl
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none, only when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern
# begin and end years of blocks
 0 0
#
# controls for all timevary parameters
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: null;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  21-24 keep last dev for rest of years
#
#
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
2 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
4  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
0 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 1.8 0.2 0.1 0.8 0 -3 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 80 20 30.8 0.2 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 25 250 132 120.1 0.2 0 -5 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 2 0.2 0.25 0.8 0 -2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 -0.01 0.5 0.1 0.1 0.8 0 -3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.5 0.1 0.1 0.8 0 -5 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 3 6.8e-06 6.8e-06 0 0 -1 0 0 0 0 0 0 0 # Wtlen_1_Fem
 2.5 3.5 3.101 3.101 0.2 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 10 50 38.18 0 0 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -2 2 -0.276 0 0 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 3 1 0 0 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 -3 4 0 0 0 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
# Hermaphroditism
#  Recruitment Distribution
 -4 4 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_timing_1
#  Cohort growth dev base
 -4 4 1 0 0 0 -4 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
            10            20          18.7          10.3            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.65           0.7          0.05             0         -4          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.4           0.8           0.8             0         -5          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0         -4          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1 # first year of main recr_devs; early devs can preceed this era
100 # last year of main recr_devs; forecast devs start in following year
-2 #_recdev phase
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 100 #_last_yr_fullbias_adj_in_MPD
 100 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
101 #_read_recdevs
1  0.159783066
2  0.274932995
3 -0.229796455
4 -1.530635182
5  0.062626172
6 -0.903383025
7 -0.591306781
8 -0.174123215
9  0.069387296
10  0.258061105
11 -0.445272477
12 -0.896289028
13 -0.301577733
14 -0.313053170
15 -1.195362516
16 -0.586555963
17 -0.517922414
18 -0.222195025
19 -0.112606347
20 -0.289113614
21  0.307009177
22  0.267887870
23  0.238623123
24  0.467736775
25  0.212358322
26 -0.557884534
27  0.087440660
28  0.293575532
29 -0.021796113
30 -0.148257380
31 -0.411681921
32  0.417963419
33  0.098824654
34 -0.522226020
35 -0.489597294
36  0.018586754
37 -0.602288803
38 -0.093313459
39 -0.158709257
40 -0.329095986
41 -0.757929759
42 -0.501351772
43  0.105853216
44  0.029172538
45 -0.003543503
46 -0.469511660
47  0.518202590
48 -0.063448305
49  0.097305899
50 -0.263459164
51  0.583289208
52 -0.014311808
53 -0.567838003
54 -0.714794548
55  0.023891723
56 -0.191508909
57 -0.368298073
58 -0.729030566
59  0.472564041
60 -0.526998773
61  0.641265734
62 -0.071023895
63 -0.782045605
64  0.242812595
65 -0.027732621
66  0.249225572
67  0.375660587
68 -0.389974423
69 -0.163555759
70 -0.583834716
71 -0.065979204
72 -0.191721106
73  0.166096073
74  0.169415254
75  0.087308758
76  0.638476975
77 -0.298831856
78 -0.620651684
79 -0.687877863
80  0.140027368
81 -0.791903325
82  0.386859343
83  0.068795001
84 -0.403913758
85 -0.740350271
86 -0.263278371
87 -0.276368021
88 -0.494251639
89  0.008793308
90  0.527771388
91 -0.101410102
92 -0.342571947
93 -0.131476325
94 -0.603919690
95 -0.119328343
96 -0.115454092
97 -0.017040966
98  0.075916666
99  0.574665864
100  0.134518563
101 -0.752802322
#Fishing Mortality info
0.3 # F ballpark
-2001 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4  # max F or harvest rate, depends on F_Method
#
#
#
0 1 100 # overall start F value; overall phase; N detailed inputs to read
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2; -Yr to fill remaining years)
1 1 1 0 0.005 1
1 2 1 0 0.005 1
1 3 1 0 0.005 1
1 4 1 0 0.005 1
1 5 1 0 0.005 1
1 6 1 0 0.005 1
1 7 1 0 0.005 1
1 8 1 0 0.005 1
1 9 1 0 0.005 1
1 10 1 0 0.005 1
1 11 1 0 0.005 1
1 12 1 0 0.005 1
1 13 1 0 0.005 1
1 14 1 0 0.005 1
1 15 1 0 0.005 1
1 16 1 0 0.005 1
1 17 1 0 0.005 1
1 18 1 0 0.005 1
1 19 1 0 0.005 1
1 20 1 0 0.005 1
1 21 1 0 0.005 1
1 22 1 0 0.005 1
1 23 1 0 0.005 1
1 24 1 0 0.005 1
1 25 1 0 0.005 1
1 26 1 0.1052 0.005 1
1 27 1 0.1052 0.005 1
1 28 1 0.1052 0.005 1
1 29 1 0.1052 0.005 1
1 30 1 0.1052 0.005 1
1 31 1 0.1052 0.005 1
1 32 1 0.1052 0.005 1
1 33 1 0.1052 0.005 1
1 34 1 0.1052 0.005 1
1 35 1 0.1052 0.005 1
1 36 1 0.1052 0.005 1
1 37 1 0.1052 0.005 1
1 38 1 0.1052 0.005 1
1 39 1 0.1052 0.005 1
1 40 1 0.1052 0.005 1
1 41 1 0.1052 0.005 1
1 42 1 0.1052 0.005 1
1 43 1 0.1052 0.005 1
1 44 1 0.1052 0.005 1
1 45 1 0.1052 0.005 1
1 46 1 0.1052 0.005 1
1 47 1 0.1052 0.005 1
1 48 1 0.1052 0.005 1
1 49 1 0.1052 0.005 1
1 50 1 0.1052 0.005 1
1 51 1 0.1052 0.005 1
1 52 1 0.1052 0.005 1
1 53 1 0.1052 0.005 1
1 54 1 0.1052 0.005 1
1 55 1 0.1052 0.005 1
1 56 1 0.1052 0.005 1
1 57 1 0.1052 0.005 1
1 58 1 0.1052 0.005 1
1 59 1 0.1052 0.005 1
1 60 1 0.1052 0.005 1
1 61 1 0.1052 0.005 1
1 62 1 0.1052 0.005 1
1 63 1 0.1052 0.005 1
1 64 1 0.1052 0.005 1
1 65 1 0.1052 0.005 1
1 66 1 0.1052 0.005 1
1 67 1 0.1052 0.005 1
1 68 1 0.1052 0.005 1
1 69 1 0.1052 0.005 1
1 70 1 0.1052 0.005 1
1 71 1 0.1052 0.005 1
1 72 1 0.1052 0.005 1
1 73 1 0.1052 0.005 1
1 74 1 0.1052 0.005 1
1 75 1 0.1052 0.005 1
1 76 1 0.1052 0.005 1
1 77 1 0.1052 0.005 1
1 78 1 0.1052 0.005 1
1 79 1 0.1052 0.005 1
1 80 1 0.1052 0.005 1
1 81 1 0.1052 0.005 1
1 82 1 0.1052 0.005 1
1 83 1 0.1052 0.005 1
1 84 1 0.1052 0.005 1
1 85 1 0.1052 0.005 1
1 86 1 0.1052 0.005 1
1 87 1 0.1052 0.005 1
1 88 1 0.1052 0.005 1
1 89 1 0.1052 0.005 1
1 90 1 0.1052 0.005 1
1 91 1 0.1052 0.005 1
1 92 1 0.1052 0.005 1
1 93 1 0.1052 0.005 1
1 94 1 0.1052 0.005 1
1 95 1 0.1052 0.005 1
1 96 1 0.1052 0.005 1
1 97 1 0.1052 0.005 1
1 98 1 0.1052 0.005 1
1 99 1 0.1052 0.005 1
1 100 1 0.1052 0.005 1
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         2         1         0         0         0         0  #  Survey
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            -3             3             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_Survey(2)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0 0 # 1 Fishery
 24 0 0 0 # 2 Survey
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 11 0 0 0 # 1 Fishery
 11 0 0 0 # 2 Survey
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Fishery LenSelex
            20           199          50.8          50.8          0.05             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_Fishery(1)
            -5             3            -3            -3          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_Fishery(1)
            -4            12           5.1           5.1          0.05             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_Fishery(1)
            -2            16            15            15          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P4_Fishery(1)
           -15             5          -999          -999          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P5_Fishery(1)
            -5          1000           999           999          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P6_Fishery(1)
# 2   Survey LenSelex
            20           199          41.8          41.8          0.05             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_Survey(2)
            -5             3            -4            -4          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_Survey(2)
            -4            12           5.2           5.2          0.05             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_Survey(2)
            -2            15            14            14          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P4_Survey(2)
          -100           100           -99           -99          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P5_Survey(2)
          -100           100            99            99          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P6_Survey(2)
# 1   Fishery AgeSelex
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_Fishery(1)
             0           101           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_Fishery(1)
# 2   Survey AgeSelex
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_Survey(2)
             0           101           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_Survey(2)
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
#
# Input variance adjustments factors:
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch;
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  1 1 1 1 #_CPUE/survey:_2
#  1 1 1 1 #_CPUE/survey:_3
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  0 0 0 0 #_lencomp:_3
#  1 1 1 1 #_agecomp:_1
#  1 1 1 1 #_agecomp:_2
#  0 0 0 0 #_agecomp:_3
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting
 # 0 0 0 0 0 0 0 0 0 # placeholder for # selex_fleet, 1=len/2=age/3=both, year, N selex bins, 0 or Growth pattern, N growth ages, 0 or NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

