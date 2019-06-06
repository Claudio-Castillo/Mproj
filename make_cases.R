# Or, create the argument lists directly in R and skip the case file setup:

F0 <- list(years = 1913:2012, years_alter = 1913:2012, fvals = c(rep(0,
  25), rep(0.114, 75)))

index1 <- list(fleets = 2, years = list(seq(1974, 2012, by = 2)), sds_obs =
  list(0.1))

lcomp1 <- list(fleets = c(1, 2), Nsamp = list(100, 100), years =
  list(1938:2012, seq(1974, 2012, by = 2)), lengthbin_vector = NULL, cpar =
  c(1, 1))

agecomp1 <- list(fleets = c(1, 2), Nsamp = list(100, 100), years =
  list(1938:2012, seq(1974, 2012, by = 2)), agebin_vector = NULL, cpar =
  c(1, 1))

E0 <- list(natM_type = "1Parm", natM_n_breakpoints = NULL, natM_lorenzen =
  NULL, natM_val = c(NA,-1), par_name = "LnQ_base_3_CPUE", par_int = NA,
  par_phase = -1, forecast_num = 0) # change parameters in the EM...e.g= another M is natM_val=c(new value, phase)..i can turn on the phase for estimation

M0 <- list(NatM_p_1_Fem_GP_1 = rep(0, 100)) #change parameters in the OM...I can add more parameters 

ss3sim_base(iterations = 1, scenarios = "D1-E0-F0-M0-cod",
  f_params = F0, index_params = index1, lcomp_params = lcomp1,
  agecomp_params = agecomp1, estim_params = E0, tv_params = M0,
  om_dir = om, em_dir = em)

unlink("D1-E0-F0-M0-cod", recursive = TRUE) # clean up

setwd(wd)

## End(Not run)
