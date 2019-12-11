### Implementing Heckman correction - More Complex Case
library(MASS)
n <- 100000
X <- matrix(c(rnorm(n, 0, 1), rnorm(n, 0, 1)), ncol = 2)
Betas <- c(1.25, 3.125)

W <- matrix(c(rnorm(n, 0, 1), rnorm(n, 0, 1)), ncol = 2)
Deltas <- c(2.5, 1.5)

ep_tau <- mvrnorm(n = n, mu  = c(0,0), Sigma = matrix(c(2, 1.5, 1.5, 2), byrow = T, nrow =2))

Y <-  (X %*% Betas) + ep_tau[,1]
Z <- (W %*% Deltas) + ep_tau[,2]

sample_vec <- ep_tau[,2] > - (W %*% Deltas)
mean(sample_vec)

sampled_Y <- Y[sample_vec]
sampled_X <- X[sample_vec,]

lm(Y ~ X)
lm(sampled_Y ~ sampled_X)


V <- -(W %*% Deltas) 

bias_term <-  (dnorm(V / sqrt(2)) / (sqrt(2) * (1 - pnorm(V / sqrt(2)))))

mean(bias_term[bias_term < Inf])
bias_term[bias_term == Inf] <- max(bias_term[bias_term != Inf])


m_adjusted <- lm(sampled_Y ~ sampled_X + bias_term[sample_vec])

m_adjusted
 
# Estimating the bias term

sampling_probit <- glm(sample_vec ~ W, family = binomial(link = "probit"))
estimated_deltas <- unname(sampling_probit$coefficients[2:3])

sigma_mod <- lm(Z ~ W)
estimated_sigma_tau <- sqrt(sum((sigma_mod$residuals)^2) / (n - 2))

estimated_V <- -(W %*% estimated_deltas) / estimated_sigma_tau
estimated_bias <- (dnorm(estimated_V) / (estimated_sigma_tau * (1 - pnorm(estimated_V))))

estimated_bias[estimated_bias == Inf] <- max(estimated_bias[estimated_bias != Inf])

m_adjusted_estimated <- lm(sampled_Y ~ sampled_X + estimated_bias[sample_vec])
m_adjusted_estimated


