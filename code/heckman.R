### Implementing Heckman correction - Simple Case
library(MASS)
n <- 100000
X <- matrix(rnorm(n, 0, 1), ncol = 1)
Betas <- c(1.25)

W <- matrix(rnorm(n, 0, 1), ncol = 1)
Deltas <- c(2.5)

ep_tau <- mvrnorm(n = n, mu  = c(0,0), Sigma = matrix(c(1, .75, .75, 1), byrow = T, nrow =2))

Y <-  (X %*% Betas) + ep_tau[,1]
Z <- (W %*% Deltas) + ep_tau[,2]

sample_vec <- ep_tau[,2] > - (W %*% Deltas)
mean(sample_vec)

sampled_Y <- Y[sample_vec]
sampled_X <- X[sample_vec,]

lm(Y ~ X)
m_bias <- lm(sampled_Y ~ sampled_X)

m_bias$coefficients

V <- -(W %*% Deltas) 

bias_term <-  (dnorm(V) / (1 - pnorm(V)))
  
mean(bias_term[bias_term < Inf])


sampled_Y_adj <- sampled_Y + bias_term[sample_vec]
m_adjusted <- lm(sampled_Y ~ sampled_X + bias_term[sample_vec])

m_adjusted

# Estimating the bias term

sampling_probit <- glm(sample_vec ~ W, family =  binomial(link = "probit"))
estimated_deltas <- unname(sampling_probit$coefficients[2])

estimated_V <- -(W %*% estimated_deltas) 
estimated_bias <- (dnorm(estimated_V) / (1 - pnorm(estimated_V)))

m_adjusted_estimated <- lm(sampled_Y ~ sampled_X + estimated_bias[sample_vec])



