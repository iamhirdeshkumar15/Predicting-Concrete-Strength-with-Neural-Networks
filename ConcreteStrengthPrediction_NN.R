## Predicting-Concrete-Strength-with-Neural-Networks
# Set working directory and load dataset
getwd()
concrete <- read.csv("C:/Users/Hirdesh Kumar Yadav/Downloads/R Predictive Analysis/Concrete_Data.csv")
View(concrete)

# View the structure and histogram of the 'strength' column
str(concrete)
hist(concrete$strength)

# Normalize function
normalize <- function(x) {  
  return((x - min(x)) / (max(x) - min(x)))
} 

# Apply normalization to the dataset
concrete_norm <- as.data.frame(lapply(concrete, normalize))
summary(concrete_norm$strength) # Normalized 'strength' column
summary(concrete$strength)       # Original 'strength' column

# Split data into training and testing sets
concrete_train <- concrete_norm[1:773, ]  # 75% training data
concrete_test <- concrete_norm[774:1030, ] # 25% testing data

# Load neuralnet package
library(neuralnet)

# Train a neural network model with a single hidden node
concrete_model <- neuralnet(strength ~ cement + slag + ash + water + superplasticizer +
                              coarseagg + fineagg + age, data = concrete_train)
# OR
# concrete_model <- neuralnet(strength ~ ., data = concrete_train)

# Plot the neural network model
plot(concrete_model)

# Compute predictions on test data
model_results <- compute(concrete_model, concrete_test[1:8])
predicted_strength <- model_results$net.result

# Calculate correlation between predicted and actual strength values
cor(predicted_strength, concrete_test$strength)

# Train a neural network model with 5 hidden nodes
concrete_model2 <- neuralnet(strength ~ cement + slag + ash + water + superplasticizer +
                               coarseagg + fineagg + age, data = concrete_train, hidden = 5)

# Plot the neural network model with 5 hidden nodes
plot(concrete_model2)

# Compute predictions on test data with the updated model
model_results2 <- compute(concrete_model2, concrete_test[1:8])
predicted_strength2 <- model_results2$net.result

# Calculate correlation for the second model's predictions
cor(predicted_strength2, concrete_test$strength)
