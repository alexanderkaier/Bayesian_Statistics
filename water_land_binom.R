setwd("/home/akaier/Studying_Playground/Bayesian_Statistics")

# Probability of 6 successes from 9 trails according to the binomial distribution
dbinom(6, 9, 1/2)

# Grid approximation for bayesian inference about the proportion of water on the globe
# from a small sample of ß observations WLWWWLWLW

# Define the grid
p_grid <- seq(from = 0, to = 1, length.out = 20) # Seperating the whole spectrum in 20 discrete points
# Define the prior
prior <- rep(1, 20) # Uniform distribution on the whole grid
# Compute likelihood at each value in grid
likelihood <- dbinom(6, size = 9, prob = p_grid)
# Compute product of likelihood and prior
unstd.posterior <- (likelihood * prior)
# Compute the standarized posterioe
posterior <- unstd.posterior/sum(unstd.posterior)

# Plotting the results
plot(p_grid, posterior, type="b",
     xlab="probability of water", ylab="posterior probability", main = "20 points")