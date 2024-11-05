# Predicting-Concrete-Strength-with-Neural-Networks

This repository contains an R-based neural network model for predicting the compressive strength of concrete. The project utilizes the `neuralnet` package to explore various neural network model training with various hidden layers, and performance evaluation using correlation analysis for accurate predictions based on the composition of concrete.

## Dataset

The dataset used in this project is `Concrete_Data.csv`, which includes the following features:
- Cement
- Slag
- Ash
- Water
- Superplasticizer
- Coarse Aggregate
- Fine Aggregate
- Age
- Strength (target variable)

## Project Structure

- `ConcreteStrengthPrediction_NN.R`: The main R script that implements data preprocessing, model training, and evaluation.
- `Concrete_Data.csv`: The dataset used for training and testing the model.

## Installation

To run the script, ensure you have R and the `neuralnet` package installed. You can install the package using the following command in R:

```R
install.packages("neuralnet")
