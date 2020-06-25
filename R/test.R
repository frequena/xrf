# library(RCurl)
# library(monomvn)
#
# # grabbing data from uci
# census_income_text <- getURL('https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data')
# census_income <- read.csv(textConnection(census_income_text), header=F, stringsAsFactors = F)
# colnames(census_income) <- c('age', 'workclass', 'fnlwgt', 'education', 'education_num', 'marital_status',
#                              'occupation', 'relationship', 'race', 'sex', 'capital_gain', 'capital_loss',
#                              'hours_per_week', 'native_country', 'above_50k')
#
# m_xrf <- xrf(above_50k ~ ., census_income, family = 'binomial',
#              xgb_control = list(nrounds = 100, max_depth = 3))
#
#
# a <- model.matrix(m_xrf, census_income, sparse = FALSE)
# b <- model.matrix(m_xrf, census_income, sparse = TRUE)
#
# terms(m_xrf$base_formula)
#
# dim(a)
# dim(b)
#
#
# dotR <- file.path(Sys.getenv("HOME"), ".R")
# if (!file.exists(dotR)) dir.create(dotR)
# M <- file.path(dotR, "Makevars")
# if (!file.exists(M)) file.create(M)
# cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",
#     "CXX14=/usr/local/bin/g++", # or clang++ but you may need a version postfix
#     file = M, sep = "\n", append = TRUE)
#
# Sys.setenv(MAKEFLAGS = "CXX14FLAGS += -fPIC") # four cores used
#
# install.packages('rstan')
# set.seed(1233)
# X <- scale(matrix(rnorm(30),ncol=3))[,]
# set.seed(12333)
# Y <- matrix(rnorm(10, X%*%matrix(c(-0.2,0.5,1.5),ncol=1), sd=0.8),ncol=1)
#
# require(monomvn)
# ## Lasso regression
# reg.las <- regress(X, Y, method="lasso")
#
# ## Bayesian Lasso regression
# reg.blas <- blasso(X, Y)
#
# library(rstanarm)
