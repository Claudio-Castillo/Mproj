# install.packages("devtools")
#devtools::install_github("ss3sim/ss3sim", 
                         ref = "development", build_vignettes = TRUE, dependencies = TRUE)

library(ss3sim)
library(here)
#example("run_ss3sim",package = "ss3sim")
#' # Create a temporary folder for the output and set the working directory:
temp_path <- file.path(tempdir(), "ss3sim-example")
dir.create(temp_path, showWarnings = FALSE)
wd <- getwd()
setwd(temp_path)
on.exit(setwd(wd), add = TRUE)

# Find the data in the ss3sim package:
d <- system.file("extdata", package = "ss3sim")
om <- file.path(d, "models", "cod-om")
em <- file.path(d, "models", "cod-em")
case_folder <- file.path(d, "eg-cases")
#
# Without bias adjustment:
run_ss3sim(iterations = 1, scenarios = "D0-F0-cod",
           case_folder = case_folder, om_dir = om, em_dir = em)
unlink("D0-F0-cod", recursive = TRUE) # clean up

# An example specifying the case files:
run_ss3sim(iterations = 1, scenarios = "D0-F0-E0-cod",
           case_folder = case_folder, om_dir = om, em_dir = em,
           case_files = list(F = "F", D = c("index", "lcomp",
                                            "agecomp"), E = "E"))
unlink("D0-F0-E0-cod", recursive = TRUE) # clean up

#' # If try to use bias adjustment, a warning will be triggered and the run will
#' # proceed WITHOUT using bias adjustment (and may result in error.)
run_ss3sim(iterations = 1, scenarios = "D1-F0-cod",
           case_folder = case_folder, om_dir = om, em_dir = em,
           bias_adjust = TRUE)

# A run with deterministic process error for model checking:
recdevs_det <- matrix(0, nrow = 101, ncol = 2)
run_ss3sim(iterations = 1:2, scenarios = "D0-E100-F0-cod",
           case_folder = case_folder,
           case_files = list(F = "F", D = c("index", "lcomp", "agecomp"), E = "E"),
           om_dir = om, em_dir = em,
           bias_adjust = FALSE, user_recdevs = recdevs_det)
unlink("D0-E100-F0-cod", recursive = TRUE)

# An example of a run using parallel processing across 2 cores:
require(doParallel)
registerDoParallel(cores = 2)
require(foreach)
getDoParWorkers() # check how many cores are registered

# parallel scenarios:
run_ss3sim(iterations = 1, scenarios = c("D0-F0-cod",
                                         "D1-F0-cod"), case_folder = case_folder,
           om_dir = om, em_dir = em, parallel = TRUE)
unlink("D0-F0-cod", recursive = TRUE)
unlink("D1-F0-cod", recursive = TRUE)

# parallel iterations:
run_ss3sim(iterations = 1:2, scenarios = "D0-F0-cod",
           case_folder = case_folder, om_dir = om, em_dir = em,
           parallel = TRUE, parallel_iterations = TRUE)
unlink("D0-F0-cod", recursive = TRUE)